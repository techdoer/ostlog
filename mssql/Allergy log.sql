--
-- Version: Each entry characterizes a chronic/acute allergic reaction.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Allergy_log.json
--
CREATE TABLE [dbo].[Allergy log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT NOT NULL,
	[location_id] INT NOT NULL, 
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[allergen_type_sctid] INT NOT NULL, -- SNOWMED CT ID referencing a type of allergen disorder
	[remarks] NVARCHAR(2056) NULL,   
	CONSTRAINT [PK_Allergy log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Allergy log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Allergy log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CONSTRAINT [FK_Allergy log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Allergy log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)