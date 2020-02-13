--
-- Version: A script to pre-populate the Sleep duration targets with recommended sleep suration
-- hours from sleepfoundation.org.   Designed for Azure SQL Server. 
-- URL:         -
--
DECLARE @StartAgeInMonths AS INT = 0
DECLARE @EndAgeInMonths AS INT = 1200

DECLARE @CurrentAgeInMonths AS INT = @StartAgeInMonths
DECLARE @CurrentAgeInYears AS INT
DECLARE @CurrentAgeCategory AS NVARCHAR(15)
DECLARE @CurrentSleepDurationHoursMin AS INT
DECLARE @CurrentSleepDurationHoursMax AS INT

WHILE @CurrentAgeInMonths < @EndAgeInMonths

BEGIN
    SET @CurrentAgeInYears = FLOOR(@CurrentAgeInMonths / 12)

    -- Sets age category, min and max recommended sleep duration according to sleepfoundation.org's classification 
    IF @CurrentAgeInMonths <= 3
        BEGIN 
            SET @CurrentAgeCategory = 'newborn'
            SET @CurrentSleepDurationHoursMin = 14
            SET @CurrentSleepDurationHoursMax = 17
        END
    ELSE 
        IF @CurrentAgeInMonths <= 11
        BEGIN
            SET @CurrentAgeCategory = 'infant'
            SET @CurrentSleepDurationHoursMin = 12
            SET @CurrentSleepDurationHoursMax = 15
        END
        ELSE
            IF @CurrentAgeInYears <= 2
            BEGIN
                SET @CurrentAgeCategory = 'toddler'
                SET @CurrentSleepDurationHoursMin = 11
                SET @CurrentSleepDurationHoursMax = 14
            END
            ELSE
                IF @CurrentAgeInYears <= 5
                BEGIN
                    SET @CurrentAgeCategory = 'pre-school'
                    SET @CurrentSleepDurationHoursMin = 10
                    SET @CurrentSleepDurationHoursMax = 13
                END
                ELSE
                    IF @CurrentAgeInYears <= 13
                    BEGIN
                        SET @CurrentAgeCategory = 'school age'
                        SET @CurrentSleepDurationHoursMin = 9
                        SET @CurrentSleepDurationHoursMax = 11
                    END
                    ELSE
                        IF @CurrentAgeInYears <= 17
                        BEGIN
                            SET @CurrentAgeCategory = 'teen'
                            SET @CurrentSleepDurationHoursMin = 8
                            SET @CurrentSleepDurationHoursMax = 10
                        END
                        ELSE
                            IF @CurrentAgeInYears <= 25
                            BEGIN
                                SET @CurrentAgeCategory = 'young adult'
                                SET @CurrentSleepDurationHoursMin = 7
                                SET @CurrentSleepDurationHoursMax = 9
                            END
                            ELSE
                                IF @CurrentAgeInYears <= 64
                                BEGIN
                                    SET @CurrentAgeCategory = 'adult'
                                    SET @CurrentSleepDurationHoursMin = 7
                                    SET @CurrentSleepDurationHoursMax = 9
                                END
                                ELSE                                    
                                BEGIN
                                    SET @CurrentAgeCategory = 'older adult'
                                    SET @CurrentSleepDurationHoursMin = 7
                                    SET @CurrentSleepDurationHoursMax = 8
                                END
    
    INSERT INTO [dbo].[Sleep duration targets] ([age_in_months], [age_category], [min_sleep_hours_recommended], [max_sleep_hours_recommended])
    VALUES (@CurrentAgeInMonths,@CurrentAgeCategory, @CurrentSleepDurationHoursMin, @CurrentSleepDurationHoursMax)
    SET @CurrentAgeInMonths = @CurrentAgeInMonths + 1

END