--
-- Version: A dimension table to record a standard list of symptoms.   Designed for Azure SQL Server. 
-- URL: http://ostlog.org/schema/Symptoms.json
--
CREATE TABLE [dbo].[Symptoms]
(
	[id] INT IDENTITY (1,1) NOT NULL, 
	[sname] NVARCHAR(256) NOT NULL, 
	[classification] NVARCHAR(256) NOT NULL, 
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK_Symptoms] PRIMARY KEY CLUSTERED ([id] ASC)
)
