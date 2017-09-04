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

-- Version: View [Menstrual cycle log] as a two column table consisting of StartDate | DaysBetweeen where DaysBetween is the days between successive menstural 
-- cycle start dates
--  
-- URL: http://ostlog.org/schema/View_days_between_menstrual_cycle.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE VIEW [dbo].[View days between menstrual cycle]
	AS 
	
	SELECT	m.calendar_date_id AS StartDate, m.person_id, DATEDIFF(day, convert(date, convert(nvarchar(8), m.calendar_date_id), 112), 
			LEAD(convert(date, convert(nvarchar(8), calendar_date_id), 112), 1, GETDATE()) OVER (ORDER BY calendar_date_id ASC)) AS DaysBetween
	FROM [dbo].[Menstrual cycle log] m
	WHERE day_in_cycle = 1;
