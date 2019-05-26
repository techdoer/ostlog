--
-- Version: Each entry provides metadata for a single entry of self-tracking data.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Meta_log.json
--
CREATE TABLE [dbo].[Meta log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[version_id] INT NOT NULL,
	[last_updated] DATETIME NOT NULL,
	[mode_description] NVARCHAR (1000) NOT NULL,
	[collector_id] INT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Meta log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Meta log-People] FOREIGN KEY ([collector_id]) REFERENCES [dbo].[People] ([id]),
)
