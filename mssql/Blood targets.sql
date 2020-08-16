--
-- Version: Each entry describes the min and max values for features in a blood lab examination.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Blood_targets.json
--
CREATE TABLE [dbo].[Blood targets] (
	[blood_feature_name] NVARCHAR(50) NOT NULL, 
	[target_value] FLOAT NULL,
	[min_value] FLOAT NULL,
	[max_value] FLOAT NULL,
	[min_male_adult_value] FLOAT NULL,
	[max_male_adult_value] FLOAT NULL,
	[min_female_adult_value] FLOAT NULL,
	[max_female_adult_value] FLOAT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Blood targets] PRIMARY KEY CLUSTERED ([blood_feature_name] ASC),

)