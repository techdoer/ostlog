--
-- Version: Each entry describes a drug and the disorder(s) it targets.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Drug_targets.json
--
CREATE TABLE [dbo].[Drug targets] (
	[drug_atc_code] NVARCHAR(50) NOT NULL,
	[disorder_sctid_code] INT NOT NULL,
	[disorder_name] NVARCHAR (50),
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Drug disorder lookup] PRIMARY KEY CLUSTERED ([drug_atc_code] ASC, [disorder_sctid_code] ASC),

)