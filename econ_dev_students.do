clear all
global data "C:\Users\danny\Documents\chaynov dependency ratio\malawi data\MWI_2010-2019_IHPS_v01_M_Stata\" 
****land data collapse
use "$data\ag_mod_c_10.dta"
collapse ag_c04c, by( HHID)
gen wave=1
save "$data\ag_land_data_10.dta",replace

use "$data\hh_mod_a_filt_13.dta"
merge 1:m y2_hhid using "$data\ag_mod_c_13"
collapse ag_c04c, by( HHID)
gen wave=2
save "$data\ag_land_data_13.dta",replace

use "$data\hh_mod_a_filt_16.dta"
merge 1:m y3_hhid using "$data\ag_mod_c_16"
collapse ag_c04c, by( HHID)
gen wave=3
save "$data\ag_land_data_16.dta",replace

use "$data\hh_mod_a_filt_19.dta"
merge 1:m y4_hhid using "$data\ag_mod_c_19"
collapse ag_c04c, by( HHID)
gen wave=4
save "$data\ag_land_data_19.dta",replace

*********************************************************************
*********************************************************************
*********************************************************************

******
use "$data\hh_mod_a_filt_10.dta"
merge 1:m HHID using "$data\hh_mod_b_10.dta"
drop _m


*merge 1:1 case_id PID using "$data\hh_mod_e_10.dta" 
*drop _m
gen senior=1 if hh_b05a> 65
replace senior=0 if senior==.
gen prime_age=1 if hh_b05a< 65 & hh_b05a>12
replace prime_age=0 if prime_age==.
gen child=1 if hh_b05a<13
replace child=0 if child==.

save "$data\malawi_10.dta", replace
collapse (sum) senior child prime_age, by (HHID)

foreach var in senior child prime_age {
replace `var'=`var'+1
}

generate dep_ratio=1
replace dep_ratio=senior/prime_age if senior>0 & senior!=. & prime_age>0
replace dep_ratio=senior/1 if senior>0 & senior!=. & prime_age==0 
*double check this later

replace dep_ratio=child/prime_age if child>0 & child!=. & prime_age>0
replace dep_ratio=child/1 if child>0 & child!=. & prime_age==0

replace dep_ratio=(senior+child)/prime_age if senior>0 & senior!=. & child>0 & child!=. & prime_age>0
replace dep_ratio=(senior+child)/1 if senior>0 & senior!=. & child>0 & child!=. & prime_age==0
gen wave=1
save "$data\malawi_c_10.dta", replace

*********************************************************************
*********************************************************************
*********************************************************************
*wave 2 13

use "$data\hh_mod_a_filt_13.dta"
merge 1:m y2_hhid using "$data\hh_mod_b_13.dta"
drop _m

*merge 1:1 case_id PID using "$data\hh_mod_e_10.dta" 
*drop _m
gen senior=1 if hh_b05a> 65
replace senior=0 if senior==.
gen prime_age=1 if hh_b05a< 65 & hh_b05a>12
replace prime_age=0 if prime_age==.
gen child=1 if hh_b05a<13
replace child=0 if child==.

save "$data\malawi_13.dta", replace
collapse (sum) senior child prime_age, by (HHID)

foreach var in senior child prime_age {
replace `var'=`var'+1
}

generate dep_ratio=1
replace dep_ratio=senior/prime_age if senior>0 & senior!=. & prime_age>0
replace dep_ratio=senior/1 if senior>0 & senior!=. & prime_age==0 
*double check this later

replace dep_ratio=child/prime_age if child>0 & child!=. & prime_age>0
replace dep_ratio=child/1 if child>0 & child!=. & prime_age==0

replace dep_ratio=(senior+child)/prime_age if senior>0 & senior!=. & child>0 & child!=. & prime_age>0
replace dep_ratio=(senior+child)/1 if senior>0 & senior!=. & child>0 & child!=. & prime_age==0
gen wave=2
save "$data\malawi_c_13.dta", replace
*********************************************************************
*********************************************************************
*********************************************************************

*wave 3 16

use "$data\hh_mod_a_filt_16.dta"
merge 1:m y3_hhid using "$data\hh_mod_b_16.dta"
drop _m


*merge 1:1 case_id PID using "$data\hh_mod_e_10.dta" 
*drop _m
gen senior=1 if hh_b05a> 65
replace senior=0 if senior==.
gen prime_age=1 if hh_b05a< 65 & hh_b05a>12
replace prime_age=0 if prime_age==.
gen child=1 if hh_b05a<13
replace child=0 if child==.

save "$data\malawi_16.dta", replace
collapse (sum) senior child prime_age, by (HHID)

foreach var in senior child prime_age {
replace `var'=`var'+1
}

generate dep_ratio=1
replace dep_ratio=senior/prime_age if senior>0 & senior!=. & prime_age>0
replace dep_ratio=senior/1 if senior>0 & senior!=. & prime_age==0 
*double check this later

replace dep_ratio=child/prime_age if child>0 & child!=. & prime_age>0
replace dep_ratio=child/1 if child>0 & child!=. & prime_age==0

replace dep_ratio=(senior+child)/prime_age if senior>0 & senior!=. & child>0 & child!=. & prime_age>0
replace dep_ratio=(senior+child)/1 if senior>0 & senior!=. & child>0 & child!=. & prime_age==0
gen wave=3
save "$data\malawi_c_16.dta", replace

*********************************************************************
*********************************************************************
*********************************************************************

*wave4 19

use "$data\hh_mod_a_filt_19.dta"
merge 1:m y4_hhid using "$data\hh_mod_b_19.dta"
drop _m


*merge 1:1 case_id PID using "$data\hh_mod_e_10.dta" 
*drop _m
gen senior=1 if hh_b05a> 65
replace senior=0 if senior==.
gen prime_age=1 if hh_b05a< 65 & hh_b05a>12
replace prime_age=0 if prime_age==.
gen child=1 if hh_b05a<13
replace child=0 if child==.

save "$data\malawi_19.dta", replace
collapse (sum) senior child prime_age, by (HHID)

foreach var in senior child prime_age {
replace `var'=`var'+1
}

generate dep_ratio=1
replace dep_ratio=senior/prime_age if senior>0 & senior!=. & prime_age>0
replace dep_ratio=senior/1 if senior>0 & senior!=. & prime_age==0 
*double check this later

replace dep_ratio=child/prime_age if child>0 & child!=. & prime_age>0
replace dep_ratio=child/1 if child>0 & child!=. & prime_age==0

replace dep_ratio=(senior+child)/prime_age if senior>0 & senior!=. & child>0 & child!=. & prime_age>0
replace dep_ratio=(senior+child)/1 if senior>0 & senior!=. & child>0 & child!=. & prime_age==0
gen wave=4
save "$data\malawi_c_19.dta", replace

use "$data\malawi_c_10.dta", clear
append using "$data\malawi_c_13.dta"
append using "$data\malawi_c_16.dta"
append using "$data\malawi_c_19.dta"
tab wave
xtset HHID wave
xtsum senior prime_age child dep_ratio
xtsum senior prime_age child dep_ratio


merge 1:1 HHID wave using "$data\malawi_ds_a"
drop _m
merge 1:m HHID wave using "$data\all_waves_gps"
drop _m

egen total_family=rsum(senior prime_age child)


merge m:m HHID wave using "$data\ag_land_data_10.dta"
drop _m
merge m:m HHID wave using "$data\ag_land_data_13.dta"
drop _m
merge m:m HHID wave using "$data\ag_land_data_16.dta"
drop _m
merge m:m HHID wave using "$data\ag_land_data_19.dta"
drop _m

gen land_prime = ag_c04c/prime_age

foreach var in dscore senior child prime_age total_family dep_ratio ag_c04c land_prime{
replace `var'=ln(`var')
}
*spatial cont
drop if wave==4
drop if lat==.
drop if lon==.
ols_spatial_HAC dscore dep_ratio total_family ag_c04c land_prime, lat(lat) lon(lon) t(wave) p(HHID) dist(5) lag(0) bartlett disp


