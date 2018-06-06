--
-- This program is licensed to you under the MIT License
-- Copyright (c) 2018 family•smarts. All rights reserved.
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal 
-- in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
-- of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
-- FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-- Version: Each entry records a person's level of workload at a point in time. Derives from NASA's task load index (TLX) Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Workload_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2018 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Workload log]
(
	[id] INT NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[work_is_mentally_demanding] NVARCHAR (20) NULL,
	[work_is_physically_demanding] NVARCHAR (20) NULL,
	[work_is_hurried_or_rushed] NVARCHAR (20) NULL,
	[work_is_meeting_expectations] NVARCHAR (20) NULL,
	[hard_work_is_required_to_meet_performance_level] NVARCHAR (20) NULL,
	[work_is_causing_insecurity_irritation_or_stress] NVARCHAR (20) NULL,
	[direct_reports] INT NOT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Workloag log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Workload log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Workload log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Workload log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),

	CHECK ([work_is_mentally_demanding] = 'strongly disagree' OR [work_is_mentally_demanding] = 'disagree' OR [work_is_mentally_demanding] = 'neutral' OR [work_is_mentally_demanding] = 'agree' OR [work_is_mentally_demanding] = 'strongly agree'),
	CHECK ([work_is_physically_demanding] = 'strongly disagree' OR[work_is_physically_demanding] = 'disagree' OR[work_is_physically_demanding] = 'neutral' OR [work_is_physically_demanding] = 'agree' OR [work_is_physically_demanding] = 'strongly agree'),
	CHECK ([work_is_hurried_or_rushed] = 'strongly disagree' OR[work_is_hurried_or_rushed] = 'disagree' OR [work_is_hurried_or_rushed] = 'neutral' OR [work_is_hurried_or_rushed] = 'agree' OR [work_is_hurried_or_rushed] = 'strongly agree'),
	CHECK ([work_is_meeting_expectations] = 'strongly disagree' OR [work_is_meeting_expectations] = 'disagree' OR [work_is_meeting_expectations] = 'neutral' OR [work_is_meeting_expectations] = 'agree' OR [work_is_meeting_expectations] = 'strongly agree'),
	CHECK ([hard_work_is_required_to_meet_performance_level] = 'strongly disagree' OR [hard_work_is_required_to_meet_performance_level] = 'disagree' OR [hard_work_is_required_to_meet_performance_level] = 'neutral' OR [hard_work_is_required_to_meet_performance_level] = 'agree' OR [hard_work_is_required_to_meet_performance_level] = 'strongly agree'),
	CHECK ([work_is_causing_insecurity_irritation_or_stress] = 'strongly disagree' OR [work_is_causing_insecurity_irritation_or_stress] = 'disagree' OR [work_is_causing_insecurity_irritation_or_stress] = 'neutral' OR [work_is_causing_insecurity_irritation_or_stress] = 'agree' OR [work_is_causing_insecurity_irritation_or_stress] = 'strongly agree'),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
