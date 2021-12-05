--
-- URL: https://github.com/techdoer/ostlog/blob/master/schema/Therapy_log.json
--
CREATE TABLE [dbo].[Therapy log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[schedule_id] INT NOT NULL,
	[location_id] INT NULL, 
	[person_id] INT NOT NULL,
	[body_site_code] INT NULL,
	[diagnosis_id] INT NULL,
	[therapy_name] NVARCHAR(100) NOT NULL,
	[therapy_sctid] INT NOT NULL, -- SNOWMED CT ID referencing a procedure
	
	[was_effective] NVARCHAR (20) NULL,
	[effectivness_remarks] NVARCHAR (2048) NULL,
	[remarks] NVARCHAR(2056) NULL,   
	
	CONSTRAINT [PK_Therapy log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Therapy log-Timing schedule] FOREIGN KEY ([schedule_id]) REFERENCES [dbo].[Timing schedule] ([id]),
	CONSTRAINT [FK_Therapy log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Therapy log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Therapy log-Diagnosis log] FOREIGN KEY ([diagnosis_id]) REFERENCES [dbo].[Diagnosis log] ([id]),
	CONSTRAINT [FK_Therapy log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([was_effective] = 'strongly disagree' OR [was_effective] = 'disagree' OR [was_effective] = 'neutral' OR [was_effective] = 'agree' OR [was_effective] = 'strongly agree')
)
