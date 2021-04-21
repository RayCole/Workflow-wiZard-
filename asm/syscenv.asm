***********************************************************************
*
*   syscenv.asm
*
***********************************************************************
*
* Extract the environment from the first parameter received in R1 (the
* "this" pointer which should be derived from SccSytemsCEnv.
*
* Sample reference:
* #pragma prolkey( APICode::f, "DCALL=SUPPLIED,FINDENV=FINDSYSCENV" )
*
***********************************************************************

FINDSYSCENV RMODE ANY
FINDSYSCENV AMODE ANY

FINDSYSCENV RSECT
         l     15,0(1)         Get the interface block
         using SYSCENVD,15     Map the  Systems/C Environment dsect
         l     0,ENV@          Load the Systems/C Environment Address
         drop  15
*
         larl  15,mylit
         using mylit,15
         l     15,=v(@crt9a)   Get the address of CRT9A
         br    15

         drop  15
mylit    dc    0h

         ltorg
         syscenv ,
         end
