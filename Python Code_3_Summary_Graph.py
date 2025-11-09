### Assignment Kandera Python Code- Summary and graph ###

import pandas as pd
import matplotlib.pyplot as plt

# load modified dataset
df = pd.read_csv("airbnb_london_listing_modified.csv")

# 4. create a summary statistics table
summary = df.describe(())
print(summary)
# use skimpy???????????????????????????

# 5. Create a graph
# histogram for prices

# first, I calculate the mean by room type
plot_data = df.groupby("room_type")["price"].mean().reset_index()

fig = plt.figure(figsize=(10,6))
plt.bar(plot_data["room_type"], plot_data["price"], color= 'red')
plt.xlabel("Room Type")
plt.ylabel("Average Price")
plt.title("Average Airbnb Prices by Room Type in London")
plt.show()