﻿--
-- Version: Each entry records heart/ECG exam results.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/log_Heart.json
--
CREATE TABLE [dbo].[log_Heart]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[min_heart_rate_bpm] FLOAT NULL,
	[avg_heart_rate_bpm] FLOAT NULL,
	[max_heart_rate_bpm] FLOAT NULL,
	[hrv] FLOAT NULL,
	[hrv_rmssd] FLOAT NULL,
	[hrv_sdnn] FLOAT NULL,
	[ecg_pr_ms] INT NULL,   /* PR interval milliseconds */
	[ecg_p_ms] INT NULL,	/* p wave */
	[ecg_qrs_ms] INT NULL, /* QRS complex milliseconds */
	[ecg_t_ms] INT NULL, /* t wave */
	[ecg_qt_ms] INT NULL, /* QT interval milliseconds */
	[ecg_qtc_ms] INT NULL, /* QTC interval milliseconds */
	[ecg_p_axis] INT NULL,
	[ecg_qrs_axis] INT NULL,
	[ecg_t_axis] INT NULl,
	[ecg_rv1_mv] FLOAT NULL, /* amplification millivolts */
	[ecg_sv5_mv] FLOAT NULL, /* amplification millivolts */
	[ecg_rv5_mv] FLOAT NULL, /* amplification millivolts */
	[ecg_sv1_mv] FLOAT NULL, /* amplification millivolts */
	[exam_results_url] NVARCHAR(512) NULL,
	[remarks] NVARCHAR(2056) NULL, 
	CONSTRAINT [PK_log_Heart] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_log_Heart-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_log_Heart-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_log_Heart-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations] ([location_id])
)
