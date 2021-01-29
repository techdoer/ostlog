--
-- Version: Each entry records a session of screen time.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Screen_log.json
--
CREATE TABLE [dbo].[Screen log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[start_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[start_time] TIME (0) NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[screen_minutes] INT NOT NUll,
	[remarks] NVARCHAR(4000) NULL,   

	CONSTRAINT [PK_Screen log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Screen log-Calendar_date] FOREIGN KEY ([start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Screen log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Screen log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Screen log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id])
)