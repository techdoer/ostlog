CREATE VIEW [dbo].[View sleep duration] AS
	
	SELECT s.end_date_id, s.person_id,
		   DATEDIFF(hour, convert(DATETIME, convert(DATETIME, LEFT(convert(varchar, convert(nvarchar(8), s.start_date_id), 112), 120)+' '+LEFT(convert(varchar, s.start_timestamp, 108), 8), 20), 120), 
		   convert(DATETIME, convert(DATETIME, LEFT(convert(varchar, convert(nvarchar(8), s.end_date_id), 112), 120)+' '+LEFT(convert(varchar, s.end_timestamp, 108), 8), 20), 120)) AS Duration
	
	FROM [dbo].[Sleep log] s;

  

  