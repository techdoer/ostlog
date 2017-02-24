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

-- Version: A simple fact table to classify stool according to the Bristol stool chart.  Designed for Azure SQL Server. 
-- URL: 
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Stool log]
(
	[id] INT NOT NULL,
	[calendar_date_id] INT NOT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[person_id] INT NOT NULL, 
	[bss_type] INT NULL, -- Bristol Stool Chart classification
	[color] NVARCHAR (10) NULL,
	[amount] NVARCHAR (10) NULL,
	[ph] INT NULL, -- 0..7..14
	[occult_blood] BIT NULL,
	[red_blood_cells] BIT NULL,
	[white_blood_cells] BIT NULL,
	[mucus] BIT NULL,
	[lysozyme_ng_ml] INT NULL,
	[calprotectin_ug_g] INT NULL,
	[lactoferrin_ug_ml] INT NULL,
	[carbohydrates] BIT NULL,
	[veg_fibers] BIT NULL,
	[muscle_fibers] BIT NULL,
	[fat_stain] BIT NULL,
	[elastase_ug_ml] BIT NULL,
	[secretory_iga_mg_dl] INT NULL,
	[remarks] NVARCHAR(2056) NULL, 
	CONSTRAINT [PK_Stool log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Stool log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Stool log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CHECK ([bss_type] >= 1 AND [bss_type] <= 7), -- see https://en.wikipedia.org/wiki/Bristol_stool_scale
	CHECK ([amount] = 'little' OR [amount] = 'normal' OR [amount] = 'alot'),
	CHECK ([color] = 'brown' OR [color] = 'green' OR [color] = 'yellow' OR [color] = 'black' OR [color] = 'white' OR [color] = 'red'),
	CHECK ([ph] >= 1 AND [ph] <= 14),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial')
)
