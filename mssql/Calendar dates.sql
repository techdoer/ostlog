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

-- Version: A dimension table to capture a date in time and its related metadata.  Designed for Azure SQL Server. 
-- URL:         -
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Calendar dates]
(
	[date_id] INT NOT NULL,  -- YYYYMMDD
	[full_date] SMALLDATETIME NOT NULL, -- MM/DD/YYYY
	[day_in_week] SMALLINT NOT NULL, -- 0 = Sunday
	[day_in_month] SMALLINT NOT NULL, 
	[day_in_quarter] SMALLINT NOT NULL, 
	[day_in_year] SMALLINT NOT NULL, 
	[week_in_year] SMALLINT NULL,
	[month_in_quarter] SMALLINT NOT NULL, 
	[month_in_year] SMALLINT NOT NULL, 
	[quarter_in_year] SMALLINT NOT NULL, 
	[year] INT NOT NULL, 
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK Calendar dates] PRIMARY KEY ([date_id]),
)