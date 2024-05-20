Welcome to Cerbaresearch technical assessment project!

This project was developed to demonstrate profiency of the applicant in dbt and sql.
Therefore the documentation & tests aren't complete for the sake of time efficiency.
It should be treated as a proof of concept

# Architecture

This project is designed for Bigquery datawarehouse architecture.
A single-tenant sandbox environment that consists of:
- GCP project with Bigquery dataset: Raw data file (parquet) was dumped into a GCS bucket & Bigquery dataset is configured with external data source for the corresponding GCS object.


# How to
In order to run this dbt project, one must first have appropriate IAM roles in the respective GCP project.
To obtain the roles, please contact project admin.

Once access to the cloud are granted, following steps should be taken:

## Clone
Clone this repository. Is probably public by now.

## Profile
Setup a dbt profile locally with following sample:

```
trips_dbt_bigquery:
  outputs:
    dev:
      dataset: [your-name]
      job_execution_timeout_seconds: 600
      job_retries: 1
      location: EU
      method: oauth
      priority: interactive
      project: sbx-kaan-kizilirmak
      threads: 25
      type: bigquery
  target: dev
```
Don't forget to replace the dataset prefix with your name. That will provide an isolated development environment for you in the Bigquery.

## Run
Following must be done to run this project:
### Virtual environment
Setup the python virtual environment using the requirements file. Ie
`pip install -r requirements.txt`
### Test and run
Install the dbt packages, test and run

- `dbt deps`
- `dbt debug`
- `dbt build`

### Docs
- `dbt docs generate`
- `dbt docs serve`

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
