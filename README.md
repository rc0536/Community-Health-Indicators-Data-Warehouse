#Community Health Status Indicators (CHSI) to Combat Obesity, Heart Disease, and Cancer
## Project Overview
The Community Health Status Indicators (CHSI) project aims to provide a comprehensive data warehouse that supports the analysis of strategies against obesity, heart disease, and cancer. This initiative compiles community-level health data to identify trends and inform policy decisions.

## Data Source
This project uses public health data available from HealthData.gov, providing an extensive collection of indicators for community health. It encompasses a range of metrics that offer insights into socioeconomic conditions, health outcomes, and various risk factors associated with chronic diseases.
This project uses public health data available from the following sources:
- [HealthData.gov Dataset](https://data.world/us-hhs-gov/fcdb091a-3d47-4f43-a99c-19c9e95c8ca9): Comprehensive health indicators for community health analysis.

## Data Model
We maintain a structured representation of health data, designed to facilitate in-depth analysis. The Entity-Relationship (ER) diagrams provided illustrate the data models used to represent the complex relationships within the health data.

## Transformations
The data undergoes a rigorous ETL process using SQL and Python scripts, ensuring data quality and preparing it for insightful analysis. These scripts perform functions essential to cleaning, transforming, and staging the data accurately.

## County Health Database
Central to this project is the county health database, which allows for detailed analysis of health metrics at the local level. It is instrumental for identifying areas most affected by the health conditions under study and for strategizing targeted interventions.
## ERD
[![Community Health Indicators Data Warehouse ERD](/path/to/image/representing/ERD.png)](Project ERD.pdf)

## Business Questions
Our project structure aims to address significant health-related questions, such as:

* Identifying states with the highest average poverty levels and their impact on health.
[![View State Poverty Data Visualization](https://public.tableau.com/thumb/views/StatePovertyData/Sheet2)](https://public.tableau.com/app/profile/rishabh.chaudhary3253/viz/StatePovertyData/Sheet2?publish=yes)



* Determining the leading causes of death by state and their potential connections to lifestyle choices.
[![View Highest Cause of Death per State Visualization](https://public.tableau.com/thumb/views/Highestcauseofdeathperstate/Sheet2)](https://public.tableau.com/app/profile/rishabh.chaudhary3253/viz/Highestcauseofdeathperstate/Sheet2?publish=yes)



  
* Investigating the correlation between physical inactivity and death rates across states.
 [![View Statewise Death and Risk Visualization](https://public.tableau.com/thumb/views/StatewiseDeathandRisk/Sheet3)](https://public.tableau.com/app/profile/rishabh.chaudhary3253/viz/StatewiseDeathandRisk/Sheet3)

  
## Scripts and Notebooks
Each script and notebook contains detailed comments explaining its purpose and functionality within the ETL pipeline, which aids in understanding their role in the overall analytical framework.

## Getting Started
Detailed instructions are provided for setting up the project environment, installing required dependencies, and executing the ETL scripts to replicate the database and its analyses.

## Contributing
Contributions to this project are welcome. Please refer to the contribution guidelines for more information on how to participate and help improve the project.

## License
The data used in this project is sourced from HealthData.gov and is available under public domain. 
