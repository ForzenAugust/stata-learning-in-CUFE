// the handout of STATA by Chuanbo Chen,RUC //
// DOFILE---Zihan Sheng,CUFE //

//CHAPTER 3//
cd "C:\Users\shengzihan\Stata14\mydata"

// 3.1:use //
sysuse auto
webuse nlswork,clear

// 3.2:data //
// 3.2.1: numeric data //
clear
set obs 1
gen float a=1
des
replace a=2
d
//*****//
// the only syntax of "replace" is:
// Replace contents of existing variable
// replace oldvar =exp [if] [in] [, nopromote] //

compress // store the data in the samllest format //
replace a=33000 // a is automatically converted from byte to long //
dis a
d a
gen double b=3.1415
replace a=64
recast double a
d a

// 3.2.2:string data //
clear
gen str a="3.1415"
//*****//
//attention! ''is not allowed//
d
gen b=real(a) // convert str to num by function "real()" // 
d 
destring a,gen(c) // convert str to num by "destring" //
d

// 3.2.3 date data //
// these content will be discussed in chapter 16//
// remember that the only 3 formats are "YMD","MDY","DMY" //

// 3.2.4 missing data //
use auto,clear
mvencode price,mv(-9996)// convert "9996" into "." //

// 3.3 convert//
// 3.3.1 from str to num //
webuse destring1,clear
des
destring ,replace
gen nincom=income*1.3
webuse destring2,clear
d
destring date,replace
//*****//
//attention! date: contains nonnumeric characters(in this example, it is " "); no replace //
de date
destring date,replace ignore(" ")
de date
destring price percent,gen(price2 percent2)ignore("$,%")
//*****//
//attention! no comma between price2 and percent2//

// 3.3.2 from num to str //
webuse tostring,clear 
tostring year day,replace
gen date1=month+"/"+day+"/"+year
list date1
gen date2=date(date1,"mdy") // the fuction of "date()" //
di date("9/1/1999","MDY")

// 3.4 format //
webuse census10,clear
de
list
list in 1/4
format region %-8.0g
list
format pop %11.0gc // number with comma //
list pop
format medage %8.1f

gen id=_n
replace id=9842 in 3 // change id into 9845 when the id=3

format id %05.0f

// 3.5 input //
clear
input id str10 name economy
1 john 40
end
// there is no need to put john with "" //

// 3.6 transfer //
//skip//

// 3.7 label //
clear
cd "C:\Users\shengzihan\Stata14\mydata\chen data"
use 3origin.dta

// 3.7.1 rename ver name //
renpfix var v
rename v1 id

// 3.7.2 label file//
label data "students score"
note: 2018/5/30
note

// 3.7.3 label var //
label var id "学号"

// 3.7.4 label define & label value //
rename v3 gender
label define genderlb 1 "male" 0 "female" // label define:show the data with the xxlb label //
list 
label values gender genderlb // label values //
list

// 3.7.5 add & modify //
clear
use 3origin.dta
rename var4 minority
label define minoritylb 1 "han" 2 "others"
label values minority minoritylb
label define minoritylb 3 "unknown",add
list
label values minority minoritylb
list minority
label dir //display all the labels //
label define minoritylb 2 "hui",modify //change the existing minoritylb//
label drop minority // delate the label //
