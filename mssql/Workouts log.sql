--
-- Version: Each entry ecords a workout activity.  Supports Azure SQL Server. 
-- URL:  http://ostlog.org/schema/Workouts_log.json
--
CREATE TABLE [dbo].[Workouts log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[start_time] TIME(0) NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[person_id] INT NOT NULL, 
	[workout_type] NVARCHAR(20) NOT NULL, 
	[duration_minutes] FLOAT NULL, 
	[moving_minutes] FLOAT NULL,
	[distance_miles] FLOAT NULL, 
	[elevation_gain_ft] FLOAT NULL, 
	[avg_speed_mph] FLOAT NULL, 
	[max_speed_mph] FLOAT NULL, 
	[calories_burned] FLOAT NULL, 
	[steps] INT NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK_Workouts log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Workouts log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Workouts log-Person] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Workouts log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Workouts log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([workout_type]='walking' OR [workout_type]='running' OR [workout_type]='swimming' OR [workout_type]='cycling' OR [workout_type]='hiking' OR [workout_type]='gymnastics' OR [workout_type]='dance' OR [workout_type]='roller-blading' OR [workout_type]='other'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)