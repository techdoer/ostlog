--
-- URL: https://github.com/techdoer/ostlog/blob/master/schema/Sleep_log.json
--
CREATE TABLE [dbo].[Sleep log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[in_bed_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[in_bed_timestamp] TIME (0) NOT NULL,
	[out_of_bed_date_id] INT NOT NULL,
	[out_of_bed_timestamp] TIME (0) NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[sleep_minutes_total] INT NULL,
	[light_sleep_percentage] FLOAT NULL,
	[deep_sleep_percentage] FLOAT NULL,
	[awakening_count] INT NULL,
	[awakening_minutes_total] INT NULL,
	[slept_well] NVARCHAR(20) NULL, 
	[easy_wakeup] NVARCHAR(20) NULL, 
	[remarks] NVARCHAR(2056) NULL,   
	CONSTRAINT [PK_Sleep log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Sleep log-Calendar_date1] FOREIGN KEY ([in_bed_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Sleep log-Calendar_date2] FOREIGN KEY ([out_of_bed_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Sleep log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CONSTRAINT [FK_Sleep log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Sleep log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CHECK ([slept_well] = 'strongly disagree' OR [slept_well] = 'disagree' OR [slept_well] = 'neutral' OR [slept_well] = 'agree' OR [slept_well] = 'strongly agree'),
	CHECK ([easy_wakeup] = 'strongly disagree' OR [easy_wakeup] = 'disagree' OR [easy_wakeup] = 'neutral' OR [easy_wakeup] = 'agree' OR [easy_wakeup] = 'strongly agree')
)
