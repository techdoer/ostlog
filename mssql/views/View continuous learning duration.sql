CREATE VIEW [dbo].[View continuous learning duration] AS
	
	SELECT cl.id, 
		cd.full_date as startDate, 
		cd1.full_date as endDate,
		cl.person_id, 
		DATEPART(year, cd.full_date) AS startYear, 
		DATEPART(week, cd.full_date) AS startWeekNum, 
		DATEPART(year, cd1.full_date) AS endYear,
		DATEPART(week, cd1.full_date) AS endWeekNum,
		DATEDIFF(week, cd.full_date, cd1.full_date) AS durationWeeks
	
FROM [dbo].[Continuous learning log] cl INNER JOIN [dbo].[Calendar dates] cd on cl.start_date_id = cd.date_id
     INNER JOIN [dbo].[Calendar dates] cd1 on cl.end_date_id = cd1.date_id
