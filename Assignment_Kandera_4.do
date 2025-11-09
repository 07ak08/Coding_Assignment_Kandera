*** Assignment Kandera Stata Code ***
*** 4. Do-File ***
*** create summary statistics table

* set working directory and import modified datafile 
cd "C:\Users\Kandera_Agnes\Documents\Assignment"
use "airbnb_london_listing_modified.dta", clear


** summary statistics for continuous variables:

* summary statistics (mean, sd, min, max) for all continuous variables
summarize

* more detailed statistics (percentiles, skewness, kurtosis)
summarize, detail

* summary statistics for a chosen continuous variable (in this example variable price)
summarize price 

* summary statistics with conditions (examples for variable price)
summarize price if price < 100
summarize price if room_type == "Private room"

* summary statistics by group (in this example price by room type)
tabstat price, by(room_type) statistics(mean sd min max)

** summary statistics for categorical variables:

* frequency tables for categorical variablse (in this example variable room_type and neighbourhood_cleansed)
tabulate room_type
tabulate neighbourhood_cleansed

* frequency table for two categorical variables (in this example room type by neighborhood)
tabulate room_type neighbourhood_cleansed, row nofreq