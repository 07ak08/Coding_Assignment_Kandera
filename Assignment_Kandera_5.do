*** Assignment Kandera Stata Code ***
*** 5. Do-File ***
*** create a graph of any type &
*** save graphs as files

* set working directory and import modified datafile 
cd "C:\Users\Kandera_Agnes\Documents\Assignment"
use "airbnb_london_listing_modified.dta", clear

* histogram for price by room type
histogram log_price, by(room_type) xtitle ("Log Price") ytitle("Frequency") width(0.2) color(red)

graph export "C:\Users\Kandera_Agnes\Documents\Assignment\Assignment_Kandera_Histogram.pdf", replace

* Interpretation:
* Entire apartments tend to have higher prices, Private rooms are in the middle and Shared rooms are the least expensive
* Using log(price) makes the differences more visible and reduces skewness


