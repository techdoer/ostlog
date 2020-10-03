--
-- Version: Each entry records a person's attendance at a social gathering of some type. Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Social_log.json 
--
CREATE TABLE [dbo].[Social log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME (0) NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[type] NVARCHAR(20) NOT NULL,
	[remarks] NVARCHAR(4000) NULL,   
	CONSTRAINT [PK_Social log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Social log] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Social log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Social log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Social log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id])
)
