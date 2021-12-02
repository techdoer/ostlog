--
-- Version: Each entry represents the range of sleep hours recommended at a given age in months (see https://www.sleepfoundation.org/. Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Sleep_targets.json
--
CREATE TABLE [dbo].[Sleep targets] (
	[age_in_months] FLOAT NOT NULL,
    [meta_id] INT NULL,
    [age_category] NVARCHAR (15) NOT NULL, 
    [min_sleep_hours_recommended] INT NOT NULL,
    [max_sleep_hours_recommended] INT NOT NULL, 
    [remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK_Sleep targets] PRIMARY KEY CLUSTERED ([age_in_months] ASC),
	CONSTRAINT [FK_Sleep targets charts-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),

    CHECK([age_category] = 'newborn' 
    OR [age_category] = 'infant'
    OR [age_category] = 'toddler'
    OR [age_category] = 'pre-school'
    OR [age_category] = 'school age'
    OR [age_category] = 'teen'
    OR [age_category] = 'young adult'
    OR [age_category] = 'adult'
    OR [age_category] = 'older adult')
)