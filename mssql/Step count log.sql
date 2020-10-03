--
-- Version: Each entry records a person's step count in a given time interval.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Step_count_log.json
--
CREATE TABLE [dbo].[Step count log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[start_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
    [start_time] TIME (0) NOT NULL,
    [end_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
    [end_time] TIME (0) NOT NULL,	
	[start_location_id] INT NULL,
	[person_id] INT NOT NULL,
	[step_count] INT NOT NULL,
	[remarks] NVARCHAR(4000) NULL,   
	CONSTRAINT [PK_Step count log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Step count log-Calendar_date1] FOREIGN KEY ([start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Step count log-Calendar_date2] FOREIGN KEY ([end_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
    CONSTRAINT [FK Step_count_log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Step_count_log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Step_count_log-Location] FOREIGN KEY ([start_location_id]) REFERENCES [dbo].[Location] ([location_id])
)