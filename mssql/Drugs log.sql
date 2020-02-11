--
-- Version: Each entry records a dose of medicine taken.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Drugs_log.json
--
CREATE TABLE [dbo].[Drugs log] (
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME (0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[person_id] INT NOT NULL,
	[diagnosis_id] INT NULL,
	[name] NVARCHAR (512) NOT NULL, -- commercial name of drug taken
	[status] NVARCHAR (10) NULL,  -- status based FHIR value-set: http://hl7.org/fhir/ValueSet/medication-statement-status 
	[drug_atc_code] NVARCHAR (20) NULL, -- The Anatomical Therapeutic Chemical (ATC) Classification System
	[admin_route] NVARCHAR (20) NOT NULL, -- equivalent to ATC classification's Route of administration (Adm.R)
	[dosage_amount] FLOAT (53) NULL,
	[dosage_units] NVARCHAR (32) NULL, -- equivalent to ATC classification's dosage units
	[body_site_code] INT NULL, -- equivalent to SNOMED CT's body site https://www.hl7.org/fhir/valueset-approach-site-codes.html

	-- Duration, Frequency and Period based on https://www.hl7.org/fhir/datatypes.html#timing
	[duration] INT NULL,
	[duration_units] NVARCHAR (3) NULL,
	[dosage_frequency] INT NULL, 
	[dosage_frequency_max] INT NULL,
	[period] INT NULL,
	[period_units] NVARCHAR (3) NULL,
	[period_max] INT NULL,
	[days_of_week] NVARCHAR (50) NULL,
	[when] NVARCHAR (3) NULL,
	[length_days] INT NOT NULL,

	[was_effective] NVARCHAR (20) NULL,
	[effectivness_remarks] NVARCHAR (2048) NULL,
	[side_effect_remarks] NVARCHAR (2048) NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Drugs log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Drugs log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Drugs log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Drugs log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Drugs log-Diagnosis log] FOREIGN KEY ([diagnosis_id]) REFERENCES [dbo].[Diagnosis log] ([id]),
	CONSTRAINT [FK_Drugs log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([status]='active' OR [status]='completed' OR [status]='entered-in-error' OR [status]='intended' OR [status]='stopped' OR [status]='on-hold' OR [status] = 'unknown' OR [status] = 'not-taken'),
	CHECK ([admin_route]='implant' OR [admin_route]='inhale' OR [admin_route]='nasal' OR [admin_route]='instill' OR  [admin_route]='oral' OR  [admin_route]='nasal' OR [admin_route]='parenteral' OR [admin_route]='rectal' OR [admin_route]='sublingual' OR [admin_route]='transdermal' OR [admin_route]='vaginal'),
	CHECK ([dosage_units]='g' OR [dosage_units]='mg' OR [dosage_units]='mcg' OR [dosage_units]='U' OR [dosage_units]='TU' OR [dosage_units]='MU' OR [dosage_units]='mmol' OR [dosage_units]='ml'),
	
	-- from https://www.hl7.org/fhir/valueset-units-of-time.html
	CHECK ([duration_units]='s' OR [duration_units]='min' OR [duration_units] = 'h' OR [duration_units] = 'd' OR [duration_units] = 'wk' OR [duration_units] = 'mo' OR [duration_units] = 'a'),
	CHECK ([period_units]='s' OR [period_units]='min' OR [period_units] = 'h' OR [period_units] = 'd' OR [period_units] = 'wk' OR [period_units] = 'mo' OR [period_units] = 'a'),
		
	-- from timing event http://hl7.org/fhir/v3/TimingEvent
	CHECK ([when] = 'HS' OR [when] = 'WAKE' OR [when] = 'C' OR [when] = 'CM' OR [when] = 'CD' OR [when] = 'CV' OR [when] = 'AC' OR [when] = 'ACM' OR [when] = 'ACD' OR [when] = 'ACV' OR [when] = 'IC'  OR [when] = 'ICD'  OR [when] = 'ICM'  OR [when] = 'ICV'  OR [when] = 'PC' OR [when] = 'PCM' OR [when] = 'PCD' OR [when] = 'PCV'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
	CHECK ([was_effective] = 'strongly disagree' OR [was_effective] = 'disagree' OR [was_effective] = 'neutral' OR [was_effective] = 'agree' OR [was_effective] = 'strongly agree')
);
