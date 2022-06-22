* Panel_reg
* Written for ECON350
* Emperical Project File
* Brandon Lange
* 03/02/22

clear all																		/*Clear data stored in memory*/
capture log close

local network "\\tsclient\brandonlange\Desktop\School\Winter 2022\ECON 350 (Econometrics)\Project"
cd "`network'"																	
set more off																	

**** Start log file to automatically capture Stata output from running this script ****
*Name file appropriately:

log using "`network'\FinalPaperLog_LangeBrandon_McCulloughOtis.txt", replace text

import delimited Dataset using "\\tsclient\brandonlange\Desktop\School\Winter 2022\ECON 350 (Econometrics)\Project\Cleaned Up Data Set CSV.csv", encoding(UTF-8) 

encode date, gen(date_code) /*converting date string into a date code for stata to read*/
xtset statefips date_code /*setting panel variable and time variable*/

xtreg contclaims_count_regular pand_claims covid_cases covid_death_count full_vaccine, fe

xtreg contclaims_count_regular binary_dumb covid_cases covid_death_count full_vaccine, fe

log close

/**/
