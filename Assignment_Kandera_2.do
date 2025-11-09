*** Assignment Kandera Stata Code ***
*** 2. Do-File ***
*** Read csv data and fix common data quality errors ****
 
* set working directory and import datafile 
cd "C:\Users\Kandera_Agnes\Documents\Assignment"
import delimited "airbnb_london_listing.csv", clear

* make sure all the characters are encoded properly 
import delimited "airbnb_london_listing.csv", varnames(1) bindquotes(strict) encoding("utf-8") clear

* strcuture of the dataset
browse
* opens dataset in the data editor for better overview
describe
* shows variable names, types and labels
inspect 
* summarizes types and missing values for all the variables
codebook
* shows more details on string variables
* I see that the dataset has 73 variables and almost 54,000 observations and that some variables have incorrect formats (for example price is stored as string because it contains $)

* to convert the price string variable to numeric I remove $ and ,
replace price = subinstr(price, "$", "", .)
replace price = subinstr(price, ",", "", .)
destring price, replace

* the same goes for the variables weekly_price, monthly_price, security_deposit, cleaning_fee, extra_people
replace weekly_price = subinstr(weekly_price, "$", "", .)
replace weekly_price = subinstr(weekly_price, ",", "", .)
destring weekly_price, replace

replace monthly_price = subinstr(monthly_price, "$", "", .)
replace monthly_price = subinstr(monthly_price, ",", "", .)
destring monthly_price, replace

replace security_deposit = subinstr(security_deposit, "$", "", .)
replace security_deposit = subinstr(security_deposit, ",", "", .)
destring security_deposit, replace

replace cleaning_fee = subinstr(cleaning_fee, "$", "", .)
replace cleaning_fee = subinstr(cleaning_fee, ",", "", .)
destring cleaning_fee, replace

replace extra_people = subinstr(extra_people, "$", "", .)
replace extra_people = subinstr(extra_people, ",", "", .)
destring extra_people, replace

* check if the convertion worked:
describe price
describe weekly_price
describe monthly_price
describe security_deposit
describe cleaning_fee
describe extra_people
* output shows that storage type is int (only monthly_price is long but it is perfectly fine as well), so converting worked

* check missing values for numeric variables
count if missing(weekly_price)
* for example, the variables weekly_price has 42,162 missing values
count if !missing(weekly_price)
summarize weekly_price
* use the opposite command to check which values are not missing values, in this example 11,742
* use the sum command to recheck, it also shows 11,742 so the code seems to run correctly
* by adding those to numbers together (42,162 and 11,742) we can check if the sum up to the total number of values, which is the case for this example

* I observe that the dataset contains NA and N/A for missing values as well
* standardize string variables representing missing values
* replace NA and N/A with empty strings so Stata recognizes them as missing
replace reviews_per_month = "" if reviews_per_month == "NA"
replace license = "" if license == "NA"
replace review_scores_value = "" if review_scores_value == "NA"
replace review_scores_location = "" if review_scores_location == "NA"
replace review_scores_communication = "" if review_scores_communication == "NA"
replace review_scores_checkin = "" if review_scores_checkin == "NA"
replace review_scores_cleanliness = "" if review_scores_cleanliness == "NA"
replace review_scores_rating = "" if review_scores_rating == "NA"
replace review_scores_accuracy = "" if review_scores_accuracy == "NA"
replace has_availability = "" if has_availability == "NA"
replace square_feet = "" if square_feet == "NA"
replace neighbourhood_group_cleansed = "" if neighbourhood_group_cleansed == "NA"

replace host_acceptance_rate = "" if host_acceptance_rate == "N/A"
replace host_response_rate = "" if host_response_rate == "N/A"

* save cleaned data
save "airbnb_london_listing_cleaned.dta", replace