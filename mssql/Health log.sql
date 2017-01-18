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

-- Version: A simple fact table to capture health and phenotype related data.  Designed for Azure SQL Server. 
-- URL: 
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Health log]
(
	[id] INT NOT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[person_id] INT NOT NULL, 
	[score] INT NULL, /* subjective assessment 1 = bedridden, 3 = feeling ok,  5=feeling superbb */
	[height_cm] FLOAT NULL,
	[weight_kg] FLOAT NULL,
	[right_foot_size_cm] FLOAT NULL,
	[left_foot_size_cm] FLOAT NULL,
	[body_temperature_c] FLOAT NULL,
	[blood_pressure_diastolic_mmhg] INT NULL,
	[blood_pressure_systolic_mmhg] INT NULL,
	[respiratory_rate_bpm] FLOAT NULL, /* breaths per minute */
	[bmi] FLOAT NULL, /* body mass index */
	[bfp_%] FLOAT NULL, /* body fat percentage */
	[spo2_%] FLOAT NULL, /* peripheral capillary oxygen saturation */
	[remarks] NVARCHAR(2056) NULL, 
	CONSTRAINT [PK_Health log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Health log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Health log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
)
