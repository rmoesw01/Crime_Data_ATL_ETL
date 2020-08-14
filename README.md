# Crime_Data_ATL_ETL
### Instructions on how to Extract, Transform, and Load the data needed to analyze how overall crime in Atlanta relates to police shootings in Atlanta.

## PART I  Create the SQL Database
 1. Create a database in pgAdmin named **apd_crime_db**
 2. Use file **apd_crime_schema.sql** to create the tables into the database

 ## PART II Merge and clean the monthly APD crime reports
  - This part of the project was performed by different team members at different times which is the reason for multiple Python scripts.
 ### The monthly APD crime reports are stored in Data_Files/Monthly 
 1. Run the file **Merge_monthly_APD** to read in and merge the crime data for 2015-2017
    - outputs file:**2015-2017-APD**<br>

 2. Run the file **APD_merge_csv_files** to read in and merge the crime data for 2018-2020
    - outputs file:  **merged_2018_to_2020**
    - Fun import in this file:  Import **glob** to read in all monthly CSV files at once.  Code looks like:
    - apd_raw_df = pd.concat(map(pd.read_csv, glob.glob('Data_files/APD_data_2018_to_2020/*.csv')))

 3. Run the file **Clean_shootings_data** to read in and clean the US police shootings
    - outputs file:  **police_shootings_us**

 ## PART III Load cleaned files into the database
 
 1. Run the file **load_data** to read in the three "cleaned" CSV files that wre output in PART II and load them into the database.
 2. To review the police shootings in Atlanta, run the SQL query in the file **filter_to_atl_shootings**

<br>

 ### NOTE: Ideally, the three Jupyter notebook files in PART II would be combined with the Jupyter notebook in Part III to execute all cleaning and loading steps at once.





    


