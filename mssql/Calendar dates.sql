--
-- Version: A dimension table to capture a date in time and related metadata.  Designed for Azure SQL Server. 
-- URL: http://ostlog.org/schema/Calendar_dates.json
--
CREATE TABLE [dbo].[Calendar dates]
(
	[date_id] INT NOT NULL,  -- YYYYMMDD
	[full_date] SMALLDATETIME NOT NULL, -- MM/DD/YYYY
	[day_in_week] SMALLINT NOT NULL, -- 0 = Sunday
	[day_in_month] SMALLINT NOT NULL, 
	[day_in_quarter] SMALLINT NOT NULL, 
	[day_in_year] SMALLINT NOT NULL, 
	[week_in_year] SMALLINT NULL,
	[month_in_quarter] SMALLINT NOT NULL, 
	[month_in_year] SMALLINT NOT NULL, 
	[quarter_in_year] SMALLINT NOT NULL, 
	[year] INT NOT NULL, 
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK Calendar dates] PRIMARY KEY ([date_id]),
)