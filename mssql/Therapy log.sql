--
-- URL: https://github.com/techdoer/ostlog/blob/master/schema/Therapy_log.json
--
CREATE TABLE [dbo].[Therapy log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[person_id] INT NOT NULL,
	[body_site_code] INT NULL,
	[diagnosis_id] INT NULL,
	[therapy_name] NVARCHAR(100) NOT NULL,
	[therapy_sctid] INT NOT NULL, -- SNOWMED CT ID referencing a procedure
	
	-- begin columns based on FHIR Timing type - an event that may occur multiple times 
	[boundary_duration_minutes] INT NULL,
	[boundary_range_start_date] INT NULL,
	[boundary_range_start_time] TIME(0) NULL,
	[boundary_range_end_date] INT NULL,
	[boundary_range_end_time] TIME(0) NULL,
	[count] INT NULL,
	[count_max] INT NULL,
	[duration] FLOAT NULL,
	[duration_max] FLOAT NULL,
	[duration_units] NVARCHAR(3) NULL,
	[frequency] INT NULL, 
	[frequency_max] INT NULL, 
	[period] INT NULL, 
	[period_max] INT NULL,
	[period_units] NVARCHAR(3) NULL, 
	[day_of_week] NVARCHAR(3) NULL, 
	[time_of_day] TIME(0) NULL,
	[when] NVARCHAR(10),
	[offset] INT NULL,  
	-- end columns  based on FHIR Timing type 
	
	[was_effective] NVARCHAR (20) NULL,
	[effectivness_remarks] NVARCHAR (2048) NULL,
	[remarks] NVARCHAR(2056) NULL,   
	
	CONSTRAINT [PK_Therapy log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Therapy log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Therapy log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Therapy log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Therapy log-Diagnosis log] FOREIGN KEY ([diagnosis_id]) REFERENCES [dbo].[Diagnosis log] ([id]),
	CONSTRAINT [FK_Therapy log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	-- start FHIR type constraints 
	CONSTRAINT [FK_Therapy log-Calendar_date2] FOREIGN KEY ([boundary_range_start_date]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Therapy log-Calendar_date3] FOREIGN KEY ([boundary_range_end_date]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CHECK ([duration_units] = 's' OR [duration_units] = 'min' OR [duration_units] = 'h' OR [duration_units] = 'd' OR [duration_units] = 'wk' OR [duration_units] = 'mo' OR [duration_units] = 'a'),
	CHECK ([period_units] = 's' OR [period_units] = 'min' OR [period_units] = 'h' OR [period_units] = 'd' OR [period_units] = 'wk' OR [period_units] = 'mo' OR [period_units] = 'a'),  
	-- end FHIR type constraints 

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
	CHECK ([was_effective] = 'strongly disagree' OR [was_effective] = 'disagree' OR [was_effective] = 'neutral' OR [was_effective] = 'agree' OR [was_effective] = 'strongly agree')
)
