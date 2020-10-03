--
-- Version: Each entry records the a continuous learning activity.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Learning_log.json
--
CREATE TABLE [dbo].[Learning log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[schedule_id] INT NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[name] NVARCHAR(100) NOT NUll,
	[type] NVARCHAR (10) NOT NULL,
	[status] NVARCHAR(20) NOT NULL,
	[is_successful] NVARCHAR(20) NULL,
	[remarks] NVARCHAR(4000) NULL,   

	CONSTRAINT [PK_Learning log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Learning log-Timing schedule] FOREIGN KEY ([schedule_id]) REFERENCES [dbo].[Timing schedule] ([id]),
	CONSTRAINT [FK_Learning log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Learning log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Learning log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	
	CHECK ([type] = 'reading' OR [type] = 'writing' OR [type] = 'listening' OR [type] = 'doing' OR [type] = 'hybrid'),
	CHECK ([status] = 'planned' OR [status] = 'in-progress' OR [status] = 'completed' OR [status] = 'cancelled'),
	CHECK ([is_successful] = 'strongly disagree' OR [is_successful] = 'disagree' OR [is_successful] = 'neutral' OR [is_successful] = 'agree' OR [is_successful] = 'strongly agree'))