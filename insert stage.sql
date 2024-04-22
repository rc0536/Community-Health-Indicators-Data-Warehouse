CREATE OR ALTER PROCEDURE InsertStagingTables
AS
BEGIN
    SET NOCOUNT ON;


	-- Insert Race Categories
	INSERT INTO RaceStage (Race_Name, Description)
	VALUES ('White', 'Individuals identified as White'),
		   ('Black', 'Individuals identified as Black or African American'),
		   ('Native American', 'Individuals identified as American Indian or Alaska Native'),
		   ('Asian', 'Individuals identified as Asian'),
		   ('Hispanic', 'Individuals identified as Hispanic or Latino'),
		   ('Other', 'Other than white and black');


	-- Insert into StatisticCategoriesStage
	INSERT INTO CategoriesStage (Category_Name, Description) VALUES
	('Population Size', 'County data, population size'),
	('Population Density', 'County data, population density (people per square mile)'),
	('Poverty', 'County data, individuals living below poverty level'),
	('Health Status', 'County data, self-rated health status'),
	('Birth Measures', 'County data, birth measures'),
	('Life Style and Risk Factors', 'County data, Life Style and Risk Factors'),
	('Age Distribution', 'Statistics on the age composition of the population within a county'),
	('Race/Ethnicity', 'Demographic data on the racial and ethnic composition of the county population'),
	('Leading Causes of Death', 'Data on the primary causes of death and the prevalence of various diseases within the county'),
	('Infectious Diseases', 'Statistics on reported and expected cases of infectious diseases within the county');


	-- Insert into AgeGroupStage
	INSERT INTO AgeGroupStage (Age_Group, Description) VALUES
	('Under age 1', 'Infants under the age of one year'),
	('Ages 1-14', 'Children and early adolescents between the ages of 1 and 14 years'),
	('Ages 15-24', 'Older adolescents and young adults between the ages of 15 and 24 years'),
	('Ages 25-44', 'Adults between the ages of 25 and 44 years'),
	('Ages 45-64', 'Middle-aged adults between the ages of 45 and 64 years'),
	('Ages 65+', 'Seniors aged 65 years and above'),
	('Age 19 and under', 'Individuals aged 19 years and younger'),
	('Age 19-64', 'Adult population between the ages of 19 and 64 years'),
	('Age 65-84', 'Older adults between the ages of 65 and 84 years'),
	('Age 85 and over', 'Oldest adults aged 85 years and above');

	INSERT INTO LCD_Time_SpanStage (Time_Span)
	VALUES 
	('1994-2003'), 
	('1999-2003'), 
	('2001-2003');

	INSERT INTO CauseOfDeathStage (Name, Description)
	VALUES
	('Complications of pregnancy/birth', 'County data for complications of pregnancy/birth across different age and racial groups'),
	('Birth defects', 'County data for birth defects across different age and racial groups'),
	('Injuries', 'County data for injuries across different age and racial groups'),
	('Cancer', 'County data for cancer across different age and racial groups'),
	('Homicide', 'County data for homicide across different age and racial groups'),
	('Heart disease', 'County data for heart disease across different age and racial groups'),
	('Suicide', 'County data for suicide across different age and racial groups'),
	('HIV/AIDS', 'County data for HIV/AIDS across different age and racial groups');

	INSERT INTO LifestyleRiskFactorsStage (Name, Description)
	VALUES 
	('No Exercise', 'Refers to the percentage of adults within a given population who do not engage in any form of leisure-time physical activity. High levels indicate a sedentary lifestyle which increases risk of chronic diseases.'),
	('Few Fruit Veg', 'Indicates the percentage of adults consuming fewer than five servings of fruits and vegetables per day. Low consumption is associated with higher risk of various chronic diseases.'),
	('Obesity', 'Represents the percentage of adults who are classified as obese based on their Body Mass Index (BMI). Obesity is a leading risk factor for several chronic diseases, including heart disease, diabetes, and cancer.'),
	('High Blood Pressure', 'The percentage of adults diagnosed with hypertension or high blood pressure. High blood pressure increases the risk of heart disease and stroke.'),
	('Smoker', 'Denotes the percentage of adults who are current smokers. Smoking tobacco is a primary risk factor for numerous health conditions, including lung cancer, respiratory diseases, and cardiovascular diseases.'),
	('Diabetes', 'The percentage of adults diagnosed with diabetes. Diabetes increases the risk of heart disease, kidney failure, and blindness.');

END