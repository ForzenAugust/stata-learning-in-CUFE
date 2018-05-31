// the handout of STATA by Chuanbo Chen,RUC //
// DOFILE---Zihan Sheng,CUFE //

//CHAPTER 4//
cd "C:\Users\shengzihan\Stata14\mydata"

// 4.1 //

// 4.2 drop & keep //
// 4.2.1 by row //
cd "C:\Users\shengzihan\Stata14\mydata\chen data"
use mydata,clear 
drop economy math 

use mydata,clear
keep economy math 
// 4.2.2 by list //
use mydata,clear 
keep if gender==o
use mydata,clear 
drop if gender==0

// 4.3 merge //
// by list //
use male,clear
append using female
// by row //
use economy,clear
sort id
merge 1:1 id using economy
tab _merge
drop _merge
use math,clear
sort id
merge 1:1 id using mydata2
drop _merge
//*****//
//extra knowledge //
//tab(tabulate)//
//example1:tab oneway//
sysuse census,clear
tabulate region
tabulate region,sort
tabulate region, gen(reg)
//example2:tab twoway//
webuse citytemp2,clear
tabulate region agecat
tabulate region agecat, column
tabulate region agecat, cell
tabulate region agecat, chi2

// 4.4 reshape //
// 4.4.2 reshape the panel data //
use mywide,clear 
reshape long math economy,i(id) j(year)
list,sepby(id)
reshape wide
list
use mylong,clear
reshape wide math economy,i(id name) j(year)
list
//*****//
//example1//
webuse reshape5, clear
list
reshape wide @inc, i(hid year) j(sex) string // @ is used to put j ih front of var //
list
reshape wide minc finc, i(hid) j(year)
list

// 4.4.3 convert many lists to less lists //
webuse stackxmpl,clear
list
stack a-d,into(x y)
list
webuse stackxmpl,clear
list
stack a b a c, into(a bc) clear //the number of the var in the left new var should be equal to the right // 
list
webuse stackxmpl,clear
list
stack a-d,into(x y) clear wide // "lear wide" keep the a-d //
list
webuse stackxmpl,clear
list
stack a c b d,into(ab cd)
list
// 4.4.4 xpose //
use math,clear
list
xpose,clear
list
