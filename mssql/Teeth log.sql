--
-- Version: Each entry records an event on a person's tooth identified by FDI World Dental Federation notation (iso3950).  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Teeth_log.json
--
CREATE TABLE [dbo].[Teeth log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME (0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[tooth_iso3950_number] INT NOT NULL,
	[tooth_iso3950_name] NVARCHAR (20) NOT NULL,
	[event] NVARCHAR (20),
	[remarks] NVARCHAR(4000) NULL,   
	CONSTRAINT [PK_Teeth log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Teeth log-Calendar_date1] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Teeth log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Teeth log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Teeth log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
	CHECK ([tooth_iso3950_name] = 'molar' OR [tooth_iso3950_name] = 'premolar' OR [tooth_iso3950_name] = 'canine' OR [tooth_iso3950_name] = 'incisor')
)