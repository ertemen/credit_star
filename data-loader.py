
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, year, month, dayofmonth


load_table_list=["users", "loan", "payment"]
date_field = "created_on"


spark = SparkSession.builder \
    .appName("cstar_data_load") \
    .config("spark.jars", "postgresql-42.6.0.jar") \
    .getOrCreate()

for table in load_table_list:
    df = spark.read \
        .format("jdbc") \
        .option("url", "jdbc:postgresql://localhost:5432/postgres") \
        .option("dbtable", table) \
        .option("user", "enisertem") \
        .option("password", "password") \
        .option("driver", "org.postgresql.Driver") \
        .load()


    date_year = year(col(date_field))
    date_month = month(col(date_field))
    date_day = dayofmonth(col(date_field))

    df = df.withColumn("year", date_year)
    df = df.withColumn("month", date_month)
    df = df.withColumn("day", date_day)


    output_dir = f"./data-output/{table}"

    df.write \
        .format("parquet") \
        .mode("overwrite") \
        .option("compression", "snappy") \
        .partitionBy("year", "month", "day") \
        .save(output_dir)

