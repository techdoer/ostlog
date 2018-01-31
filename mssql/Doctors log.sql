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

-- Version: Each entry records a visit to a medical professional.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Doctors_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Doctors log]
(
	[id] INT NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME(0) NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[doctor_id] INT NOT NULL,
	[patient_id] INT NOT NULL,
	[visit_key] INT NULL,   /* surrogate key */
	[emergency] NVARCHAR(3) NULL,
	[prescription_url] NVARCHAR(512) NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Doctors log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Doctors log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Doctors log-People] FOREIGN KEY ([doctor_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Doctors log-People1] FOREIGN KEY ([patient_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Doctors log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
	CHECK ([emergency] = 'yes' OR [emergency] = 'no')

)

