--
-- Version: Each entry references a standard growth measure.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Drug_targets.json
--
CREATE TABLE [dbo].[Growth charts] (
	[months] FLOAT NOT NULL,
	[measure] NVARCHAR (20) NOT NULL,
	[gender] NVARCHAR (10) NOT NULL,
	[meta_id] INT NULL,
	[3rd] FLOAT NOT NULL,
	[5th] FLOAT NOT NULL,
	[10th] FLOAT NOT NULL,
	[25th] FLOAT NOT NULL,
	[50th] FLOAT NOT NULL,
	[75th] FLOAT NOT NULL,
	[90th] FLOAT NOT NULL,
	[95th] FLOAT NOT NULL,
	[97th] FLOAT NOT NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK_Growth charts] PRIMARY KEY CLUSTERED ([months] ASC, [measure] ASC, [gender] ASC),
	CONSTRAINT [FK_Growth charts-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id])
)