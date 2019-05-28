--
-- Version: Each entry records a number vital signs and body measurement readings.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Vitals_log.json
--
CREATE TABLE [dbo].[Vitals log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[person_id] INT NOT NULL,
	[feeling_great] NVARCHAR(20) NULL, 
	[height_cm] FLOAT NULL,
	[weight_kg] FLOAT NULL,
	[right_foot_size_cm] FLOAT NULL,
	[left_foot_size_cm] FLOAT NULL,
	[head_circumference_cm] FLOAT NULL,
	[body_temperature_c] FLOAT NULL,
	[blood_pressure_diastolic_mmhg] INT NULL,
	[blood_pressure_systolic_mmhg] INT NULL,
	[respiratory_rate_bpm] FLOAT NULL, /* breaths per minute */
	[bfp_%] FLOAT NULL, /* body fat percentage */
	[spo2_%] FLOAT NULL, /* peripheral capillary oxygen saturation */
	[remarks] NVARCHAR(4000) NULL, 
	CONSTRAINT [PK_Vitals log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Vitals log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Vitals log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Vitals log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Vitals log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
	CHECK ([feeling_great] = 'strongly disagree' OR [feeling_great] = 'disagree' OR [feeling_great] = 'neutral' OR [feeling_great] = 'agree' OR [feeling_great] = 'strongly agree')
)
