*** Assignment Kandera Stata Code ***
*** 3. Do-File ***
*** prepare sample for analysis by 
*a) filtering observations
*b) filtering variables
*c) creating transformations of variables
 
* set working directory and import cleaned datafile 
cd "C:\Users\Kandera_Agnes\Documents\Assignment"
use "airbnb_london_listing_cleaned.dta", clear

*a) filtering observations
* keep listings that are active (availability > 0) and have at least 1 review
keep if availability_365 > 0 & number_of_reviews > 0
* output shows that over 23,000 observations were deleted

*b) filtering variables
* drop variables we don't need
drop scrape_id host_name host_since host_verifications host_identity_verified requires_license license jurisdiction_names neighbourhood neighbourhood_group calendar_updated first_review last_review

*c) creating transformations of variables
* log transformation of price (numeric)
gen log_price = ln(price)
summarize log_price 

* price per guest (price divided by accommodates)
gen price_per_guest = price / accommodates
summarize price_per_guest

* save modified data
save "airbnb_london_listing_modified.dta", replace