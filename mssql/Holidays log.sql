--
-- Version: Each entry records a holiday date.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Holidays_log.json
--
CREATE TABLE [dbo].[Holidays log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
    [name] NVARCHAR(50),
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Holidays log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Holidays log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Holidays log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id])
)