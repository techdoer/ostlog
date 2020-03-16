-- 
-- URL: https://github.com/techdoer/ostlog/blob/master/schema/Timing_schedule.json
--
CREATE TABLE [dbo].[Timing schedule]
(

	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	
	-- begin columns based on FHIR Timing type - an event that may occur multiple times
	
	-- event
	[event_date_id] INT NULL, 
	[event_time] TIME(0) NULL, 

	-- repeat 
	[repeat_bounds_duration_minutes] INT NULL,
	[repeat_bounds_range_start_date] INT NULL,
	[repeat_bounds_range_start_time] TIME(0) NULL,
	[repeat_bounds_range_end_date] INT NULL,
	[repeat_bounds_range_end_time] TIME(0) NULL,
	[repeat_count] INT NULL,
	[repeat_count_max] INT NULL,
	[repeat_duration] FLOAT NULL,
	[repeat_duration_max] FLOAT NULL,
	[repeat_duration_units] NVARCHAR(3) NULL,
	[repeat_frequency] INT NULL, 
	[repeat_frequency_max] INT NULL, 
	[repeat_period] INT NULL, 
	[repeat_period_max] INT NULL,
	[repeat_period_units] NVARCHAR(3) NULL, 
	[repeat_day_of_week] NVARCHAR(30) NULL, 
	[repeat_time_of_day] TIME(0) NULL,
	[repeat_when] NVARCHAR(10),
	[repeat_offset] INT NULL,  
	
	-- code
	[code] NVARCHAR(20),
	
	-- end columns  based on FHIR Timing type 


	CONSTRAINT [PK_Timing schedule] PRIMARY KEY CLUSTERED ([id] ASC),

	-- start FHIR type constraints 
	CONSTRAINT [FK_Timing schedule-Calendar_date1] FOREIGN KEY ([event_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Timing schedule-Calendar_date2] FOREIGN KEY ([repeat_bounds_range_start_date]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Timing schedule-Calendar_date3] FOREIGN KEY ([repeat_bounds_range_end_date]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CHECK ([repeat_duration_units] = 's' OR [repeat_duration_units] = 'min' OR [repeat_duration_units] = 'h' OR [repeat_duration_units] = 'd' OR [repeat_duration_units] = 'wk' OR [repeat_duration_units] = 'mo' OR [repeat_duration_units] = 'a'),
	CHECK ([repeat_period_units] = 's' OR [repeat_period_units] = 'min' OR [repeat_period_units] = 'h' OR [repeat_period_units] = 'd' OR [repeat_period_units] = 'wk' OR [repeat_period_units] = 'mo' OR [repeat_period_units] = 'a'),  
	-- end FHIR type constraints 


)
