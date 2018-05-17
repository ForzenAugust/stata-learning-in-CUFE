// the handout of STATA by Chuanbo Chen,RUC //
// DOFILE---Zihan Sheng,CUFE //

//CHAPTER 1//
cd "C:\Users\shengzihan\Stata14\mydata"
use auto

// 1.5.2 :5 basic statistics index //
sum price // obs mean std.dev min max //
sum price weight

// 1.5.3 :draw the figures //
scatter price weight // sactter gragh //
line price weight,sort //line graph,price=y,weight=x //
//*****//
// attention! no comma between two variables //

// 1.5.4 :generate new data //
clear
set obs 1000 // obs=1000//
gen x=_n // positive integret from 1 to n //
gen y=x+100

// 1.5.5 :list the data //
list y
list x y

// 1.6 stata environment setup //
// 1.6.1 screen moving //
set more off // list the data from the bottom //
list
set more on // list the data from the top //
list x y
q //break the showing list //
//*****//
// attention! command "q" is not functional in the dofile //

// 1.6.2 clear all the data //
clear

// 1.6.3 set the memory //
memory // check the memory //
*set memory 10m (do not run this command!!!)

// 1.6.4 set the saving place //
cd // check the saving place //
cd "C:\Users\shengzihan\Stata14\mydata" // set the saving place //
dir // display the file(dta.) in the saving place //
mkdir c:\mydata // gen a new folder to save files //

// 1.7 review and excercise //
// (3) //
di 8+2*ln(100)-exp(3)/5^2

