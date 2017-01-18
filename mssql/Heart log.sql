--
-- This program is licensed to you under the MIT License
-- Copyright (c) 2017 family•smarts. All rights reserved.
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal 
-- in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
-- of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
-- FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-- Version: A simple fact table to record heart/ECG exam results.  Designed for Azure SQL Server. 
-- URL: 
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Heart log]
(
	[id] INT NOT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME(0) NOT NULL,
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
	[remarks] NVARCHAR(2056) NULL, 
	CONSTRAINT [PK_Heart log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Heart log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Heart log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id])
)
