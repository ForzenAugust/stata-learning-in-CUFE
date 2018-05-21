// the handout of STATA by Chuanbo Chen,RUC //
// DOFILE---Zihan Sheng,CUFE //

//CHAPTER 2//
cd "C:\Users\shengzihan\Stata14\mydata"
use auto

// 2.2 :command //
sum // show all the vars 5  basic statistics index //
sum _all //same as "sum" //

// 2.3 :varlist //
sum price
sum p
sum mak
rename mak 制造商
sum 制
sum t* // show the 5s of all the vars which begin with 't' //
sum t??? // show th 5s of turn(4) //

// 2.4 :by varlist //
by foreign:sum price weight // show the 5s by foreign //
//*****//
//attention! a colon behind the [by var] //
sort foreign
by foreign,sort:sum price weight
//*****//
//attention! a comma between the [by var] and the [sort] //

gsort -price // down //
gsort +price  // up //
sort price // this one is equal to "gsort +price //
sort price weight
//*****//
// NO COMMA BETWEEN VARS!!! //

// 2.5 :gen and egen //
gen int nprice=price+10
replace nprice=nprice-10
egen totalweight=sum(weight)

help gen // Create or change contents of variable //
//syntax1:generate [type] newvar[:lblname] =exp [if] [in] [, before(varname) | after(varname)]//
//syntax2: replace oldvar =exp [if] [in] [, nopromote]//
// ex1 below //
	webuse genxmpl2, clear
	list name
	generate lastname = word(name,2)
	list lastname
	help word
// ex1.1 below //
	webuse genxmpl2, clear
	input 
	August Steven
	end
	list name
	generate lastname = word(name,2)
	list lastname
	
help egen // Extensions to generate //
//syntax: egen [type] newvar = fcn(arguments) [if] [in] [, options] //

// 2.6 :conditional exp //
use auto,clear
list make if foreign==1
list make if foreign==1&price>10000 // and //
list make if foreign==1|price>10000 // or //
 
// 2.7 :selct //
use auto,clear
sort price
sum price in 1/5 // 1 to 5 from the listtop //

// 2.8 :weighted //
clear
input int score int num
650 193 
649 26 
648 23 
647 16 
646 21 
645 26 
644 32 
643 23 
642 38 
641 29 
640 38 
end

sum score[weight=num]
sum s[w=n]
sum s

// 2.9 :other options //
sum score,detail // more details besides the 5s //

use auto,clear
list price
list price,nohead

use auto,clear
list price,sep(10) // add a line in every (n) records //
list price,sep(0)
