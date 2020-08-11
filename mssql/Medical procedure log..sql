--
-- URL: https://github.com/techdoer/ostlog/blob/master/schema/Medical_procedure.json
--
CREATE TABLE [dbo].[Medical procedure log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[schedule_id] INT NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[person_id] INT NOT NULL,
	[body_site_code] INT NULL,
	[diagnosis_id] INT NULL,
	[procedure_name] NVARCHAR(100) NOT NULL,
	[procedure_sctid] BIGINT NOT NULL, -- SNOWMED CT ID referencing a procedure
	[procedure_results_url] NVARCHAR(512) NULL,
	[procedure_results_notes] NVARCHAR(2056) NULL,
	[was_effective] NVARCHAR (20) NULL,
	[effectivness_remarks] NVARCHAR (2048) NULL,
	[side_effect_remarks] NVARCHAR (2048) NULL,
	[remarks] NVARCHAR(2056) NULL,   
	CONSTRAINT [PK_Medical procedure log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Medical procedure log-Timing schedule] FOREIGN KEY ([schedule_id]) REFERENCES [dbo].[Timing schedule] ([id]),
	CONSTRAINT [FK_Medical procedure log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Medical procedure log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Medical procedure log-Diagnosis log] FOREIGN KEY ([diagnosis_id]) REFERENCES [dbo].[Diagnosis log] ([id]),
	CONSTRAINT [FK_Medical procedure log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),


	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
	CHECK ([was_effective] = 'strongly disagree' OR [was_effective] = 'disagree' OR [was_effective] = 'neutral' OR [was_effective] = 'agree' OR [was_effective] = 'strongly agree')
)
