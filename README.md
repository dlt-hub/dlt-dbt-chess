# Chess dlt-dbt Package

### Overview
The Chess dbt package offers data models to help you transform and analyze Chess data. It's designed to integrate seamlessly with the dlt Chess pipeline, which extracts and loads Chess data into your data warehouse.

### Who is this for?
This package is perfect for dbt users who want to integrate Chess data into their analytics workflows without building models from scratch.

### Key Features
- **Staging Models:** Clean and prepare raw Chess data for downstream analysis.
- **Mart Models:** Pre-built dimension and fact tables for key Chess entities like player games, player profiles and player online status.
- **Incremental Loading:** Supports incremental data processing to optimize performance.
- **Easy Integration:** Designed to work out-of-the-box with the dlt Chess pipeline.

### Setup Instructions

#### Prerequisites
- dbt Core installed in your environment.
- Access to a supported data warehouse: BigQuery, Snowflake, Redshift, Athena, or PostgreSQL.
- The dlt Chess pipeline is set up and running.

### Step 1: Set Up the dlt Chess Pipeline
1. **Install dlt:**
   ``` 
   pip install dlt
   ```
2. **Configure the Pipeline:**
   Follow the dlt [Chess pipeline documentation](https://dlthub.com/docs/dlt-ecosystem/verified-sources/chess) to set up your pipeline. Ensure you have your Chess API key and destination credentials configured.

3. **Run the Pipeline:**
   Extract and load data from Chess into your data warehouse by running the pipeline.

### Step 2: Install and Configure the dbt Project

1. Install the Chess dbt package into your dbt environment.
2. Configure your 'dbt_project.yml' file with the appropriate connection details for your data warehouse.
3. Ensure the data from your dlt Chess pipeline is available in your warehouse.

This is how the tables in dbt package look like:

```text
dbt_chess_pipeline/
├── analysis/
├── macros/
├── models/
│   ├── marts/
│   │   ├── dim__dlt_loads.sql
│   │   ├── fact_players_games.sql
│   │   ├── dim_players_profiles__streaming_platforms.sql
│   │   ├── dim_players_profiles.sql
│   └── staging/
│   │   ├── stg__dlt_loads.sql
│   │   ├── stg_players_games.sql
│   │   ├── stg_players_profiles__streaming_platforms.sql
│   │   ├── stg_players_profiles.sql
│   ├── dlt_active_load_ids.sql
│   └── dlt_processed_load_ids.sql
├── tests/
├── dbt_project.yml
└── requirements.txt
```

### Step 3: Run dbt
Execute the dbt models to transform the raw Chess data into useful tables:

```sh
dbt build
```

### Schema diagram
The dbt model above can be further customized according to the requirements. Using this package you'll get a basic template
for data model which can be further modified as required.

1. The schema of data modelled above using dlt-dbt-generator:
    
   ![picture1](https://storage.googleapis.com/dlt-blog-images/chess_dlt_dbt_dim_model.png)

> ⚠️ **Note:**
> 
> Please note that this is a starting template for your data model and is not the final product. It is advised to customize
> the data model as per your needs.

Here's the link to the DB diagram: [link](https://dbdiagram.io/d/chess_dlt_dbt_v1-5-6749b027e9daa85aca230327).

#### Optional: Advanced Usage (Generator and Licensing)

This package was created using the dlt-dbt-generator by dlt-plus. For more information about dlt-plus, refer to the 
[dlt-plus documentation.](https://dlt-plus.netlify.app/docs/plus/intro/) To learn more about the dlt-dbt-generator, 
consult the [dlt-dbt-generator](https://dlthub.com/blog/dbt-gen) documentation.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed.
