--
-- Version: Each entry records a number vital signs and body measurement readings.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/log_Vitals.json
--
CREATE TABLE [dbo].[log_Vitals]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,

	-- vital measurements 
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
	[pef_l_min] FLOAT NULL,

	[remarks] NVARCHAR(2056) NULL, 

	CONSTRAINT [PK_log_Vitals] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_log_Vitals-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_log_Vitals-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_log_Vitals-Locations] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations] ([location_id])
)
