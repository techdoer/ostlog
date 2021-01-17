--
-- URL: https://github.com/techdoer/ostlog/blob/master/schema/Drugs_log.json
--
CREATE TABLE [dbo].[Drugs log] (
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[schedule_id] INT NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[diagnosis_id] INT NULL,
	[name] NVARCHAR (512) NOT NULL, -- commercial name of drug taken
	[status] NVARCHAR (10) NULL,  -- status based FHIR value-set: http://hl7.org/fhir/ValueSet/medication-statement-status 
	[drug_atc_code] NVARCHAR (20) NULL, -- The Anatomical Therapeutic Chemical (ATC) Classification System
	[admin_route] NVARCHAR (20) NOT NULL, -- equivalent to ATC classification's Route of administration (Adm.R)
	[dosage_amount] FLOAT (53) NULL,
	[dosage_units] NVARCHAR (32) NULL, -- equivalent to ATC classification's dosage units
	[body_site_code] INT NULL, -- equivalent to SNOMED CT's body site https://www.hl7.org/fhir/valueset-approach-site-codes.html
	[was_effective] NVARCHAR (20) NULL,
	[effectivness_remarks] NVARCHAR (2048) NULL,
	[side_effect_remarks] NVARCHAR (2048) NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Drugs log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Drugs log-Timing schedule] FOREIGN KEY ([schedule_id]) REFERENCES [dbo].[Timing schedule] ([id]),
	CONSTRAINT [FK_Drugs log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Drugs log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Drugs log-Diagnosis log] FOREIGN KEY ([diagnosis_id]) REFERENCES [dbo].[Diagnosis log] ([id]),
	CONSTRAINT [FK_Drugs log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([status]='active' OR [status]='completed' OR [status]='entered-in-error' OR [status]='intended' OR [status]='stopped' OR [status]='on-hold' OR [status] = 'unknown' OR [status] = 'not-taken'),
	CHECK ([admin_route]='implant' OR [admin_route]='inhale' OR [admin_route]='nasal' OR [admin_route]='instill' OR  [admin_route]='oral' OR  [admin_route]='nasal' OR [admin_route]='parenteral' OR [admin_route]='rectal' OR [admin_route]='sublingual' OR [admin_route]='transdermal' OR [admin_route]='vaginal'),
	CHECK ([dosage_units]='drp' OR [dosage_units]='g' OR [dosage_units]='mg' OR [dosage_units]='mcg' OR [dosage_units]='U' OR [dosage_units]='TU' OR [dosage_units]='MU' OR [dosage_units]='mmol' OR [dosage_units]='ml'),
	CHECK ([was_effective] = 'strongly disagree' OR [was_effective] = 'disagree' OR [was_effective] = 'neutral' OR [was_effective] = 'agree' OR [was_effective] = 'strongly agree')
);
