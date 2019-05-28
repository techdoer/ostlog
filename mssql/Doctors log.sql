--
-- Version: Each entry records a visit to a medical professional.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Doctors_log.json
--
CREATE TABLE [dbo].[Doctors log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[status] NVARCHAR (10) NULL,  -- status based FHIR value-set: http://hl7.org/fhir/ValueSet/medication-statement-status 
	[doctor_id] INT NOT NULL,
	[patient_id] INT NOT NULL,
	[emergency] NVARCHAR(3) NULL,
	[prescription_url] NVARCHAR(512) NULL,
	[remarks] NVARCHAR (4000) NULL,

	CONSTRAINT [PK_Doctors log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Doctors log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Doctors log-People] FOREIGN KEY ([doctor_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Doctors log-People1] FOREIGN KEY ([patient_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Doctors log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Doctors log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([status]='active' OR [status]='completed' OR [status]='entered-in-error' OR [status]='intended' OR [status]='stopped' OR [status]='on-hold'),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
	CHECK ([emergency] = 'yes' OR [emergency] = 'no')

)

