--
-- Version: Each entry characterizes a chronic/acute allergic reaction.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/log_Allergy.json
--
CREATE TABLE [dbo].[log_Allergies]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[location_id] INT NOT NULL, 
	[person_id] INT NOT NULL,
	[allergen_type_sctid] INT NOT NULL, -- SNOWMED CT ID referencing a type of allergen disorder
	[remarks] NVARCHAR(2056) NULL,   
	CONSTRAINT [PK_Allergy log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Allergy log-Calendar_dates] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Allergy log-Locations] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations] ([location_id]),
	CONSTRAINT [FK_Allergy log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
)