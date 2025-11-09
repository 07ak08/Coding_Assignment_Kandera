### Assignment Kandera Python Code- Cleaning data ###

import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#### Automate repeating tasks using Python “for” loops.
#### Use Python “lists” and “dictionaries” appropriately. Demonstrate at least one of the two.

# 1. Understand folder structure. Perform operations on files in different folders.

# check current working directory
working_directory = os.getcwd() 
# list files in working directory
files = os.listdir(working_directory)
print(files)


# 2. Read csv data and fix common data quality errors

# set working directory and import csv file
os.chdir("C:/Users/hasht/Documents/Uni/CEU/Coding/python_coding/Assignment/")
df = pd.read_csv("airbnb_london_listing.csv", encoding="utf-8", low_memory=False)

# look at structure of dataset
df.head
print(df.head)
df.shape
print(df.shape)
df.columns
print(df.columns)


# I see that there are a few variables that have incorrect formats 

# to correct that first I create a list called money_vars to store all the price related variables that have incorrect formats
money_vars = [
    "price", "weekly_price", "monthly_price",
    "security_deposit", "cleaning_fee", "extra_people"
]

# use for loop to remove the dollar sign and comma from the variables
for col in money_vars:
    if col in df.columns:
        # remove $ and commas
        df[col] = (
            df[col]
            .astype(str)
            .str.replace("$", "", regex=False)
            .str.replace(",", "", regex=False)
        )
        # convert to number
        df[col] = pd.to_numeric(df[col], errors="coerce")

# check the results
df[money_vars].dtypes
df[money_vars].info()
# it shows that the variables have been changed correctly

# handle missing values
# we see that some of the variables contain empty strings, so I replace them with proper missing values (NA)
df.replace(["", " "], pd.NA, inplace=True)
# check for missing values for specific variables
df.loc[df["accommodates"].isnull()]

# handle duplicates
# first, count the duplicates
df.duplicated().sum()
# filter out duplicate for selected variable (for example host id)
df = df.drop_duplicates("host_id")

# save cleaned data
df.to_csv("airbnb_london_listing_cleaned.csv", index=False)