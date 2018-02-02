﻿--
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

-- Version: Each entry records a health event observed on a day in time.   Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Health_observations_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Health observations log]
(
	[id] INT NOT NULL,
	[meta_id] INT NULL,
	[observation_date_id] INT NOT NULL,
	[observation_time] TIME(0) NOT NULL, /* HH:MM:SS */
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,   
	[event_id] INT NOT NULL, /* foreign key from standard Symptoms table included in this kit */
	[event_icd10_code] NVARCHAR(10), /* the WHO's ICD-10 code for this event */
	[occurance] INT NULL, /* 1 = first, 2= recurring; 3 = last */
	[remarks] NVARCHAR(4000) NULL, 
	CONSTRAINT [PK_Health observations log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Health observations log-Calendar_date] FOREIGN KEY ([observation_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Health observations log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Health observations log-Symptom] FOREIGN KEY ([event_id]) REFERENCES [dbo].[Symptoms] ([id]),
	CONSTRAINT [FK_Health observations log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)