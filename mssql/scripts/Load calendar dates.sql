--
-- Version: A script to pre-populate the Calendar dates dimension table.   Designed for Azure SQL Server. 
-- URL:         -
--
DECLARE @StartDate DATETIME = '01/01/2017'
DECLARE @EndDate DATETIME = '01/05/2017' 

DECLARE
	@DayInMonth INT,
	@DayInQuarter INT,
	@DayInYear INT,
	@WeekInMonth INT,
	@WeekInYear INT,
	@MonthInQuarter INT,
	@MonthInYear INT,
	@QuarterInYear INT,
	@CurrentYear INT,
	@CurrentMonth INT,
	@CurrentQuarter INT

DECLARE @DayOfWeek TABLE (DOW INT, MonthCount INT, QuarterCount INT, YearCount INT)

INSERT INTO @DayOfWeek VALUES (1, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (2, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (3, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (4, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (5, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (6, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (7, 0, 0, 0)

DECLARE @CurrentDate AS DATETIME = @StartDate
SET @CurrentMonth = DATEPART(MM, @CurrentDate)
SET @CurrentYear = DATEPART(YY, @CurrentDate)
SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)

WHILE @CurrentDate < @EndDate

BEGIN

	IF @CurrentMonth != DATEPART(MM, @CurrentDate) 
	BEGIN
		UPDATE @DayOfWeek
		SET MonthCount = 0
		SET @CurrentMonth = DATEPART(MM, @CurrentDate)
	END

	IF @CurrentQuarter != DATEPART(QQ, @CurrentDate)
	BEGIN
		UPDATE @DayOfWeek
		SET QuarterCount = 0
		SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)
	END
       
	IF @CurrentYear != DATEPART(YY, @CurrentDate)
	BEGIN
		UPDATE @DayOfWeek
		SET YearCount = 0
		SET @CurrentYear = DATEPART(YY, @CurrentDate)
	END
	
	UPDATE @DayOfWeek
	SET 
		MonthCount = MonthCount + 1,
		QuarterCount = QuarterCount + 1,
		YearCount = YearCount + 1
	WHERE DOW = DATEPART(DW, @CurrentDate)

	SELECT
		@DayInMonth = MonthCount,
		@DayInQuarter = QuarterCount,
		@DayInYear = YearCount
	FROM @DayOfWeek
	WHERE DOW = DATEPART(DW, @CurrentDate)


/* Load values */
	INSERT INTO [dbo].[Calendar dates]
	SELECT
		CONVERT (char(8), @CurrentDate, 112) as date_id, -- YYYYMMDD
		CONVERT (smalldatetime, @CurrentDate, 103) as full_date, -- dd/mm/yy
		DATEPART(DW, @CurrentDate) AS day_in_week,
		DATENAME(weekday, @CurrentDate) AS day_in_week_name,
		DATEPART(DD, @CurrentDate) AS day_in_month,
		@DayInQuarter AS day_in_quarter,
		DATEPART(DY, @CurrentDate) AS day_in_year,
		DATEPART(week, @CurrentDate) AS week_in_year,
		CASE
			WHEN DATEPART(MM, @CurrentDate) IN (1, 4, 7, 10) THEN 1
			WHEN DATEPART(MM, @CurrentDate) IN (2, 5, 8, 11) THEN 2
			WHEN DATEPART(MM, @CurrentDate) IN (3, 6, 9, 12) THEN 3
			END AS MonthInQuarter,
		DATEPART(MM, @CurrentDate) AS month_in_year,
		FORMAT(@CurrentDate, 'MMMM', 'en-US') AS month_in_year_name,
		@CurrentQuarter,
		@CurrentYear,
		' ' 
		SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END
