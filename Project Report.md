# Crime_Data_ATL_ETL

This project is running the ETL process to gather the data to answer the following question:
#### Is there an overall increase leading up to or following when a police officer kills someone?

## Description of the team process
### Extract
#### Data Sources
* https://www.kaggle.com/ahsen1330/us-police-shootings/metadata 
    * Data source contains a single csv file listing all of the officer involved shootings in the United States during the years 2015 - 2020
* http://opendata.atlantapd.org/Default.aspx
    * Data source contains historical and current crime data for the Atlanta Police Department(APD) from 1/1/2009 to 8/12/2020 that is updated weekly
    * This data can be downloaded in multiple formats using either links or a form to request monthly data
    * our team chose to use the form (manually) to download csv files containing City Wide Crime of all crime type each month from 2015 - 2020
### Transform
#### APD Data Cleanup
* The team decided to divide and conquer the APD data by each taking three years in our date range and merging the monthly csv files together into a single csv for those three years
* Each team member found that the csv files that were downloaded had two extra blank columns, which were removed
* It was also discovered that the column "Neighborhood" as spelled incorrectly, therefore it was renamed to the correct spelling
* Another column "UC2_Literal" was renamed "Crime Type" to be a little more clear
* a few records were manually corrected using Excel where the "Location" field was entered with city, state, & zip, which spilled over into the following columns
* All columns had to be renamed to match the SQL Schema that we created in order for the Load step to work properly
#### US Police Shootings Data Cleanup
* Changed the "age" field to be a float rounded to 0 decimal places
* The data was also filtered down to shootings in only Georgia as well as only Atlanta, but we ended up importing all the US into the SQL database so the filtering could happen at the SQL level instead
### Load
* Relational Database: apd_crime_db
    * Table 1: apd_crime_data
        Field Name | Data Type | Field Description | Why Column Used
        -----------|-----------|-------------------|----------------
        crime_type | varchar(30) | type of crime committed | could be used to look for patterns of crime
        report_number | integer | unique number for each police report | primary key
        report_date | date | date of the crime | used as a link to the data in the other table
        location | varchar | address of the crime | could be used to create a heat map to find increased crime in an area
        beat | float | the area that certain officers cover | could be used to identify a pattern of crime and police shootings in a certain area
        neighborhood | varchar | name of the neighborhood where the crime was committed | could be used to identify a pattern of crime and police shootings in a neighborhood
        lat | float | latitude of the crime | could be used to create a heat map
        long | float | longitude of the crime | could be used to create a heat map
    * Table 2: us_police_shootings
        Field Name | Data Type | Field Description | Why Column Used
        -----------|-----------|-------------------|-----------------
        id | int | proprietary id number | primary key
        name | varchar | name of the person shot by the police | used to humanize the story the date is telling
        date | date | date of the police shooting | used as a link to the other table
        manner_of_death | varchar(30) | how the person died | used for making conclusions about why crime might have increased
        armed | varchar | what the person that was shot was armed with | used for making conclusions about why crime might have increased
        age | float | age of the person shot | used for making conclusions about why crime might have increased
        gender | varchar(1) | gender of the person shot | used for making conclusions about why crime might have increased
        race | varchar(10) | race of the person shot | used for making conclusions about why crime might have increased
        city | varchar(30) | city location of the shooting | used to narrow the data to a specific area
        state | varchar(2) | state location of the shooting | used to narrow the data to a specific area
        signs_of_mental_illness | boolean | whether the person shot was showing signs of mental illness | used for making conclusions about why crime might have increased
        threat_level | varchar(15) | whether the shooting victim was attacking another person | used for making conclusions about why crime might have increased
        flee | varchar(15) | whether the victim of the shooting was running away from the police and by what means | used for making conclusions about why crime might have increased
        body_cam | boolean | whether the officer's body cam was on during the incident | used for making conclusions about why crime might have increased
        arms_category | varchar(30) | category of the weapon the victim was armed with | used for making conclusions about why crime might have increased