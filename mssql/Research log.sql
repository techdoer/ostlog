--
-- Version: Each entry records the status of a planned or completed chore.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Research_log.json
--
CREATE TABLE [dbo].[Research log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'intellectual' NOT NULL,
	[summary_text] NVARCHAR (4000) NOT NULL,
	[full_text] NTEXT NULL,
	[url] NVARCHAR(1000) NULL,
	[keywords_csv] NVARCHAR (1000) NOT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Research log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Research log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Research log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CONSTRAINT [FK_Research log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
)