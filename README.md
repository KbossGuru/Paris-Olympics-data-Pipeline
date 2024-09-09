# Paris-Olympics-data-Pipeline
An end-to-end Microsoft Azure data engineering project which includes data ingestion, transformation, storage, and analytics.

##  Data Architecture
![Data Architecture](https://github.com/KbossGuru/Paris-Olympics-data-Pipeline/blob/main/ParisOlympicsArchitecture.jpg)

## Tools used
1. Azure Data Factory: Azure Data Factory is used for raw data ingestion from various sources. Azure data factory was used to ingest raw data from a Github data repository into the Azure Data Lake Storage Gen2.
2. Data Lake Storage Gen2: Data Lake Storage Gen2 is a scalable data lake solution in Azure. Raw data ingested by Azure Data Factory is stored here for further processing and transformations.
3. Azure Databricks: Azure databricks has a collaborative notebook for a variety of programming languages like python, SQL, Scala and R, and options to work with data. Databricks was used to write python codes to perform some data transformation on the datasets and loading the transformed dataset into a folder in data lake storage Gen2.
4. Azure Synapse Analysis: Azure Synapse Analytics is a powerful cloud-based data warehouse platform that enables large-scale analytics on structured and semi-structured data. Azure synapse analytics was used to create a lake database using the transformed data and writing SQL queries to analyze the data.
5. Microsoft Power BI: Power BI is a dashboard tool used for visualizing the data. Power BI connects to the lake database in Azure Synapse Analytics to create interactive reports and dashboards.

## Steps to build the data pipeline
1. Data ingestion with Azure Synapse Analytics and storage on Data Lake Storage Gen2
   -  Create a Data Pipeline in Azure Data Factory:
      - Log into the Azure portal and navigate to Azure Data Factory.
      - Create a new pipeline within your ADF workspace.
   - Use the Copy Data Activity:
      - Add the Copy Data Activity to your pipeline. This activity allows you to copy data from one location to another.
   - Source Dataset Configuration (GitHub):
      - In the Source tab of the Copy Data activity, configure a dataset that points to the GitHub file’s raw URL.
      - Choose HTTP as the linked service type (since GitHub raw URLs can be accessed via HTTP).
      - Provide the GitHub raw URL for the file (or files) you want to copy.
   - Sink Dataset Configuration (Data Lake Gen2):
      - In the Sink tab, configure a dataset that points to your Azure Data Lake Storage Gen2.
      - You will need to create a Linked Service to your Data Lake Gen2 acDatcount.
      - Provide the destination folder path where you want to copy the files in Data Lake Gen2.
   - Trigger the Pipeline:
      - Once you have set up the source and sink datasets, you can trigger the pipeline manually or schedule it to run periodically.
      - When triggered, the pipeline will copy the data from the GitHub raw file (source) to your Data Lake Gen2 (sink).

Here's a preview of the data pipeline in azure data factory:
![Data Pipeline](https://github.com/KbossGuru/Paris-Olympics-data-Pipeline/blob/main/Data%20Factory%20Pipeline.png)

2. Data Transformation in databricks and loading the transformed data
    - Loading Data into Databricks:
       - Establish a connection to Data Lake Gen2 using Azure Data Lake credentials
       - Using Spark API to load the raw data from the data lake into a spark dataframe
    - Performing Transformation:
       - Organizing and cleaning the data early in the pipeline by using some spark commands
    - Writing Transformed Data Back to Azure Data Lake Gen2:
       - The transformed sparks dataframe is stored in a data lake folder

You can view the databricks notebook here: [Paris-Olympic-data-transformation.ipynb](https://github.com/KbossGuru/Paris-Olympics-data-Pipeline/blob/main/Paris-Olympic-data-transformation.ipynb)

3. Creating a Lake Database in Azure Synapse Analytics:
    - A lake database is created in Azure synapse analytics. The tables in the tables points to the transformed datasets in Data Lake storage Gen2.
    - An entity relation diagram is created during the creation of the table
      
Here's a preview of the ERD diagram of the lake database created:
![ERD Diagram](https://github.com/KbossGuru/Paris-Olympics-data-Pipeline/blob/main/Data%20Model.png)

4. Performing SQL Analysis:
     - After the database is created, analysis was carried out using T-SQL queries

Here's a preview of the analysis performed: [Olympic-Analysis](https://github.com/KbossGuru/Paris-Olympics-data-Pipeline/blob/main/Olympic-Analysis.sql)

   
 
    
