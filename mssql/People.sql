--
-- Version: A person referenced in ostlog.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/People.json
--
CREATE TABLE [dbo].[People]
(
	[id] INT IDENTITY (1,1) NOT NULL, 
	[first_name] NVARCHAR(20) NOT NULL, 
	[last_name] NVARCHAR(20) NOT NULL, 
	[date_of_birth] INT NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK People] PRIMARY KEY ([id]),
	CONSTRAINT [FK_People-Calendar_date] FOREIGN KEY ([date_of_birth]) REFERENCES [dbo].[Calendar dates] ([date_id])
)
