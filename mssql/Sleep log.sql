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

-- Version: Each entry records sleep activity on a day in time.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Sleep_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Sleep log]
(
	[id] INT NOT NULL,
	[meta_id] INT NULL,
	[in_bed_date_id] INT NOT NULL,
	[in_bed_timestamp] TIME (0) NOT NULL,
	[out_of_bed_date_id] INT NOT NULL,
	[out_of_bed_timestamp] TIME (0) NOT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[slept_well] NVARCHAR(20) NULL, 
	[easy_wakeup] NVARCHAR(20) NULL, 
	[remarks] NVARCHAR(2056) NULL,   
	CONSTRAINT [PK_Sleep log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Sleep log-Calendar_date1] FOREIGN KEY ([in_bed_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Sleep log-Calendar_date2] FOREIGN KEY ([out_of_bed_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Sleep log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Sleep log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
	CHECK ([slept_well] = 'strongly disagree' OR [slept_well] = 'disagree' OR [slept_well] = 'neutral' OR [slept_well] = 'agree' OR [slept_well] = 'strongly agree'),
	CHECK ([easy_wakeup] = 'strongly disagree' OR [easy_wakeup] = 'disagree' OR [easy_wakeup] = 'neutral' OR [easy_wakeup] = 'agree' OR [easy_wakeup] = 'strongly agree')
)
