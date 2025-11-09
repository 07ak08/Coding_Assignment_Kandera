### Assignment Kandera Python Code- Modifying data ###

import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# 3. Prepare a sample for analysis by
# a) filtering observations and 
# b) filtering variables and
# c) creating transformations of variables

df = pd.read_csv("airbnb_london_listing_cleaned.csv")

# a) filter observations

# use loc function to filter for only single rooms
df.shape
df.loc[df['room_type'] == 'Single Room']

# b) filter variables 

# use the filter command to only observe the variables room type and price
df.filter(["room_type" , "price"])

# drop unnecessary variables
cols_to_drop = [
    "scrape_id", "host_name", "host_since", "host_verifications",
    "host_identity_verified", "requires_license", "license",
    "jurisdiction_names", "neighbourhood", "neighbourhood_group",
    "calendar_updated", "first_review", "last_review"
]

df = df.drop(columns=[c for c in cols_to_drop if c in df.columns])

# c) create transformations of variables

# create a average price per room type variable
avg_price_by_type = df.groupby("room_type")["price"].mean().round(2).to_dict()
print(avg_price_by_type)
# output shows that private rooms are the cheapest with an average price of 51, 
# shared rooms come next with 64 and 
# finally, entire apartments are the most expensive with a price of 127

# create a dictionary showing the average price by room type
avg_price_by_type = {
    "Entire home/apt": 127,
    "Shared room": 64,
    "Private room": 51,
}
print(avg_price_by_type)
# check the type
print(type(avg_price_by_type))   
# output shows it is indeed a dictionary

# save modified data
df.to_csv("airbnb_london_listing_modified.csv")