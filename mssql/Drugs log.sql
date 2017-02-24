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

-- Version: A simple fact table to record history of medicines taken.  Designed for Azure SQL Server. 
-- URL: 
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Drugs log] (
	[id] INT NOT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME (0) NOT NULL,
	[person_id] INT NOT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[doctor_visit_id] INT NULL,
	[name] NVARCHAR (512) NOT NULL, -- commercial name of drug taken
	[status] NVARCHAR (10) NULL, 
	[drug_atc_code] NVARCHAR (20) NULL, -- The Anatomical Therapeutic Chemical (ATC) Classification System
	[admin_route] NVARCHAR (20) NOT NULL, -- equivalent to ATC classification's Route of administration (Adm.R)
	[dosage_amount] FLOAT (53) NULL,
	[dosage_units] NVARCHAR (32) NULL, -- equivalent to ATC classification's dosage units

	-- Duration, Frequency and Period based on https://www.hl7.org/fhir/datatypes.html#timing
	[duration] INT NULL,
	[duration_units] NVARCHAR (3) NULL,
	[dosage_frequency] INT NULL, 
	[dosage_frequency_max] INT NULL,
	[period] INT NULL,
	[period_units] NVARCHAR (3) NULL,
	[period_max] INT NULL,
	[when] NVARCHAR (3) NULL,
	[length_days] INT NULL,

	[effectiveness_score] INT NULL,
	[effectivness_remarks] NVARCHAR (2048) NULL,
	[side_effect_remarks] NVARCHAR (2048) NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Drugs log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Drugs log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Drugs log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),

	CHECK ([status]='suspended' OR [status]='finished' OR [status]='started'),
	CHECK ([admin_route]='implant' OR [admin_route]='inhale' OR [admin_route]='nasal' OR [admin_route]='instill' OR  [admin_route]='oral' OR  [admin_route]='nasal' OR [admin_route]='parenteral' OR [admin_route]='rectal' OR [admin_route]='sublingual' OR [admin_route]='transdermal' OR [admin_route]='vaginal'),
	CHECK ([dosage_units]='g' OR [dosage_units]='mg' OR [dosage_units]='mcg' OR [dosage_units]='U' OR [dosage_units]='TU' OR [dosage_units]='MU' OR [dosage_units]='mmol' OR [dosage_units]='ml'),
	
	-- from https://www.hl7.org/fhir/valueset-units-of-time.html
	CHECK ([duration_units]='s' OR [duration_units]='min' OR [duration_units] = 'h' OR [duration_units] = 'd' OR [duration_units] = 'wk' OR [duration_units] = 'mo' OR [duration_units] = 'a'),
	CHECK ([period_units]='s' OR [period_units]='min' OR [period_units] = 'h' OR [period_units] = 'd' OR [period_units] = 'wk' OR [period_units] = 'mo' OR [period_units] = 'a'),
		
	-- from timing event http://hl7.org/fhir/v3/TimingEvent
	CHECK ([when] = 'HS' OR [when] = 'WAKE' OR [when] = 'C' OR [when] = 'CM' OR [when] = 'CD' OR [when] = 'CV' OR [when] = 'AC' OR [when] = 'ACM' OR [when] = 'ACD' OR [when] = 'ACV' OR [when] = 'IC'  OR [when] = 'ICD'  OR [when] = 'ICM'  OR [when] = 'ICV'  OR [when] = 'PC' OR [when] = 'PCM' OR [when] = 'PCD' OR [when] = 'PCV'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial')
);
