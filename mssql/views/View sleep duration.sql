CREATE VIEW [dbo].[View sleep duration] AS
	
	SELECT s.in_bed_date_id, s.person_id,
		   DATEDIFF(hour, convert(DATETIME, convert(DATETIME, LEFT(convert(varchar, convert(nvarchar(8), s.in_bed_date_id), 112), 120)+' '+LEFT(convert(varchar, s.in_bed_timestamp, 108), 8), 20), 120), 
		   convert(DATETIME, convert(DATETIME, LEFT(convert(varchar, convert(nvarchar(8), s.out_of_bed_date_id), 112), 120)+' '+LEFT(convert(varchar, s.out_of_bed_timestamp, 108), 8), 20), 120)) AS Duration
	
	FROM [dbo].[Sleep log] s;

  

  