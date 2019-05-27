--
-- Version: Each entry characterizes a day of the menstrual cycle.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Menstrual_cycle_log.json
--
CREATE TABLE [dbo].[Menstrual cycle log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[day_in_cycle] INT NOT NULL, -- 1 = first day, 2 = second day....
	[flow] NVARCHAR(20) NULL,
	[remarks] NVARCHAR(4000) NULL, 
	CONSTRAINT [PK_Menstrual cycle log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Menstrual cycle log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Menstrual cycle log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Menstrual cycle log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Menstrual cycle log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([day_in_cycle] >= 0 AND [day_in_cycle] <= 10),
	CHECK ([flow] = 'heavy' OR [flow] = 'light' OR [flow] = 'medium' OR [flow] = 'spotting'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
