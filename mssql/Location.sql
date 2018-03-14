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

-- Version: A specific place on earth.  Designed for Azure SQL Server. 
-- URL: http://ostlog.org/schema/Calendar_dates.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2018 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Location]
(
	[location_id] INT NOT NULL, 
	[name] NVARCHAR (200) NOT NULL,
	[country_iso3_code] NVARCHAR (3) NOT NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK Location] PRIMARY KEY ([location_id]),
)