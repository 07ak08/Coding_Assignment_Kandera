*** Assignment Kandera Stata Code ***
*** 1. Do-File ***
*** Understand folder structure ****

* set working directory
cd "C:\Users\Kandera_Agnes\Documents\Assignment"

* use pwd to check what working directory I am in
pwd
* output is C:\Users\Kandera_Agnes\Documents\Assignment so I am in the correct working directory I set up before

* list files in my current directory
ls
dir

* go back to directory level
ls ../
* output is all the files in my documents folder on my account desktop

* now go into a specific folder in my working directory
cd "C:\Users\Kandera_Agnes\Documents\coding for economists"
* use pwd again to see if it worked correctly
pwd 
* output is C:\Users\Kandera_Agnes\Documents\coding for economists so I am in the correct folder  I set up before

* alternatively, I can also use the realative path to go to the folder
cd "coding for economists"

* go into the class 1 subfolder by using cd again
cd "C:\Users\Kandera_Agnes\Documents\coding for economists\class 1"

* list only csv files in the folder
ls *.csv
* the output shows the WDICountry.csv file

* load the dataset from the folder coding for economists
import delimited "WDICountry.csv", clear

* perfom operations, for example summarizing the dataset
sum

* save the summary as a new file
save "WDICountry_sum.csv", replace
* save the new file in a new folder named results
mkdir "results"
* save the new file into the results folder
save "results\WDICountry_sum.csv", replace


