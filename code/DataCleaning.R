#---
#title: "Data Cleaning"
#author: "Michael Ferrin"
#date: "December 8, 2015"
#---

# Data Cleaning Process: (imports functions from DataCleaningFunctions.R)
# Our raw data was collected by saving the html source code from 108 different webpages (see README.md or rawdata/_DataDictionary.txt for more info)
# The following cleaning process is made up of four different phases.
# Phase 1: 
#   Scrape all high school quarterback data from the raw data files, bind this information to make a single & complete data frame containing all
#   high school quarterback information.
#   Scrape all college quarterback data from the raw data files, bind this information to make a single & complete data frame containing all 
#   college quarterback information.
#   InnerJoin high school and college quarterback data keeping only the necessary columns
# Phase 2: 
#   Repeat phase 1 for running backs
# Phase 3:
#   Repeat phase 1 for recievers
# Phase 4:
#   Bind quarterback, running back, and reciever data.  Output cleaned data into 'clean/total.csv'



install.packages('XML')
library(XML)
install.packages('gdata')
library(gdata)
source('code/DataCleaningFunctions.R')
#setwd("~/Desktop/Stat")



#Quarterback Phase:
# 1) Import all high school quarterback information (position, name, state, stars)
# 2) Import all college quarterback information (name, yards, td's)
# 3) Inner Join high school and college statistics
#
############################################################## QBs #######################################################
############################################################## QBs #######################################################
############################################################## QBs #######################################################
############################################################## QBs #######################################################
############################################################## QBs #######################################################
############################################################## QBs #######################################################
highURL <- 'rawdata/Hqb1.html'
highTable <- readHTMLTable(highURL, stringsAsFactors = FALSE)
highRows <- unlist(lapply(highTable, function(t) dim(t)[1]))
high = highTable[[which.max(highRows)]]
high = high[c(1,2,3,7)]
colnames(high) <- c("Position", "Name", "State", "Stars")

highURL2 = 'rawdata/Hqb2.html'
highTable2 <- readHTMLTable(highURL2, stringsAsFactors = FALSE)
highRows2 <- unlist(lapply(highTable2, function(t) dim(t)[1]))
high2 = highTable2[[which.max(highRows2)]]
high2 = high2[c(1,2,3,7)]
colnames(high2) <- c("Position", "Name", "State", "Stars")

highURL3 = 'rawdata/Hqb3.html'
highTable3 <- readHTMLTable(highURL3, stringsAsFactors = FALSE)
highRows3 <- unlist(lapply(highTable3, function(t) dim(t)[1]))
high3 = highTable3[[which.max(highRows3)]]
high3 = high3[c(1,2,3,7)]
colnames(high3) <- c("Position", "Name", "State", "Stars")



high <- rbind(high, high2)
high <- rbind(high, high3)



collegeURL = 'rawdata/C1.html'
colTable <- readHTMLTable(collegeURL, stringsAsFactors = FALSE)
colRows <- unlist(lapply(colTable, function(t) dim(t)[1]))
college = colTable[[which.max(colRows)]]
college = college[c(2,7,10)]
colnames(college) <- c("Name", "Yards", "TD")

collegeURL2 = 'rawdata/C2.html'
colTable2 <- readHTMLTable(collegeURL2, stringsAsFactors = FALSE)
colRows2 <- unlist(lapply(colTable2, function(t) dim(t)[1]))
college2 = colTable2[[which.max(colRows2)]]
college2 = college2[c(2,7,10)]
colnames(college2) <- c("Name", "Yards", "TD")

collegeURL3 = 'rawdata/C3.html'
colTable3 <- readHTMLTable(collegeURL3, stringsAsFactors = FALSE)
colRows3 <- unlist(lapply(colTable3, function(t) dim(t)[1]))
college3 = colTable3[[which.max(colRows3)]]
college3 = college3[c(2,7,10)]
colnames(college3) <- c("Name", "Yards", "TD")

collegeURL4 = 'rawdata/C4.html'
colTable4 <- readHTMLTable(collegeURL4, stringsAsFactors = FALSE)
colRows4 <- unlist(lapply(colTable4, function(t) dim(t)[1]))
college4 = colTable4[[which.max(colRows4)]]
college4 = college4[c(2,7,10)]
colnames(college4) <- c("Name", "Yards", "TD")

collegeURL5 = 'rawdata/C5.html'
colTable5 <- readHTMLTable(collegeURL5, stringsAsFactors = FALSE)
colRows5 <- unlist(lapply(colTable5, function(t) dim(t)[1]))
college5 = colTable5[[which.max(colRows5)]]
college5 = college5[c(2,7,10)]
colnames(college5) <- c("Name", "Yards", "TD")

collegeURL6 = 'rawdata/C6.html'
colTable6 <- readHTMLTable(collegeURL6, stringsAsFactors = FALSE)
colRows6 <- unlist(lapply(colTable6, function(t) dim(t)[1]))
college6 = colTable6[[which.max(colRows6)]]
college6 = college6[c(2,7,10)]
colnames(college6) <- c("Name", "Yards", "TD")

collegeURL7 = 'rawdata/C7.html'
colTable7 <- readHTMLTable(collegeURL7, stringsAsFactors = FALSE)
colRows7 <- unlist(lapply(colTable7, function(t) dim(t)[1]))
college7 = colTable7[[which.max(colRows7)]]
college7 = college7[c(2,7,10)]
colnames(college7) <- c("Name", "Yards", "TD")

collegeURL8 = 'rawdata/C8.html'
colTable8 <- readHTMLTable(collegeURL8, stringsAsFactors = FALSE)
colRows8 <- unlist(lapply(colTable8, function(t) dim(t)[1]))
college8 = colTable8[[which.max(colRows8)]]
college8 = college8[c(2,7,10)]
colnames(college8) <- c("Name", "Yards", "TD")

collegeURL9 = 'rawdata/C9.html'
colTable9 <- readHTMLTable(collegeURL9, stringsAsFactors = FALSE)
colRows9 <- unlist(lapply(colTable9, function(t) dim(t)[1]))
college9 = colTable9[[which.max(colRows9)]]
college9 = college9[c(2,7,10)]
colnames(college9) <- c("Name", "Yards", "TD")

collegeURL10 = 'rawdata/C10.html'
colTable10 <- readHTMLTable(collegeURL10, stringsAsFactors = FALSE)
colRows10 <- unlist(lapply(colTable10, function(t) dim(t)[1]))
college10 = colTable10[[which.max(colRows10)]]
college10 = college10[c(2,7,10)]
colnames(college10) <- c("Name", "Yards", "TD")

collegeURL11 = 'rawdata/C11.html'
colTable11 <- readHTMLTable(collegeURL11, stringsAsFactors = FALSE)
colRows11 <- unlist(lapply(colTable11, function(t) dim(t)[1]))
college11 = colTable11[[which.max(colRows11)]]
college11 = college11[c(2,7,10)]
colnames(college11) <- c("Name", "Yards", "TD")

collegeURL12 = 'rawdata/C12.html'
colTable12 <- readHTMLTable(collegeURL12, stringsAsFactors = FALSE)
colRows12 <- unlist(lapply(colTable12, function(t) dim(t)[1]))
college12 = colTable12[[which.max(colRows12)]]
college12 = college12[c(2,7,10)]
colnames(college12) <- c("Name", "Yards", "TD")



college <- rbind(college, college2)
college <- rbind(college, college3)
college <- rbind(college, college4)
college <- rbind(college, college5)
college <- rbind(college, college6)
college <- rbind(college, college7)
college <- rbind(college, college8)
college <- rbind(college, college9)
college <- rbind(college, college10)
college <- rbind(college, college11)
college <- rbind(college, college12)



#Replace Name, Position with Name
for (i in 1:505) {
  college[i,1] <- gsub("\\,.*","",college[i,1])
}



#Merge College and High School data frames
totalQB <- merge(high, college)



#Call cleanState() in DataCleaningFunctions.R
totalQB <- cleanState(totalQB)








#Running Back Phase:
# 1) Import all high school running back information (position, name, state, stars)
# 2) Import all college running back information (name, yards, td's)
# 3) Inner Join high school and college statistics
#
############################################################## RBs #######################################################
############################################################## RBs #######################################################
############################################################## RBs #######################################################
############################################################## RBs #######################################################
############################################################## RBs #######################################################
############################################################## RBs #######################################################
highURL4 = 'rawdata/Hrb4.html'
highTable4 <- readHTMLTable(highURL4, stringsAsFactors = FALSE)
highRows4 <- unlist(lapply(highTable4, function(t) dim(t)[1]))
high4 = highTable4[[which.max(highRows4)]]
high4 = high4[c(1,2,3,7)]
colnames(high4) <- c("Position", "Name", "State", "Stars")

highURL5 = 'rawdata/Hrb5.html'
highTable5 <- readHTMLTable(highURL5, stringsAsFactors = FALSE)
highRows5 <- unlist(lapply(highTable5, function(t) dim(t)[1]))
high5 = highTable5[[which.max(highRows5)]]
high5 = high5[c(1,2,3,7)]
colnames(high5) <- c("Position", "Name", "State", "Stars")

highURL6 = 'rawdata/Hrb6.html'
highTable6 <- readHTMLTable(highURL6, stringsAsFactors = FALSE)
highRows6 <- unlist(lapply(highTable6, function(t) dim(t)[1]))
high6 = highTable6[[which.max(highRows6)]]
high6 = high6[c(1,2,3,7)]
colnames(high6) <- c("Position", "Name", "State", "Stars")

highURL7 = 'rawdata/Hrb7.html'
highTable7 <- readHTMLTable(highURL7, stringsAsFactors = FALSE)
highRows7 <- unlist(lapply(highTable7, function(t) dim(t)[1]))
high7 = highTable7[[which.max(highRows7)]]
high7 = high7[c(1,2,3,7)]
colnames(high7) <- c("Position", "Name", "State", "Stars")



high4 <- rbind(high4, high5)
high4 <- rbind(high4, high6)
high4 <- rbind(high4, high7)



RBURL1 = 'rawdata/U1.html'
colTable1 <- readHTMLTable(RBURL1, stringsAsFactors = FALSE)
colRows1 <- unlist(lapply(colTable1, function(t) dim(t)[1]))
RB1 = colTable1[[which.max(colRows1)]]
RB1 = RB1[c(2,5,8)]
colnames(RB1) <- c("Name", "Yards", "TD")

RBURL2 = 'rawdata/U2.html'
colTable2 <- readHTMLTable(RBURL2, stringsAsFactors = FALSE)
colRows2 <- unlist(lapply(colTable2, function(t) dim(t)[1]))
RB2 = colTable2[[which.max(colRows2)]]
RB2 = RB2[c(2,5,8)]
colnames(RB2) <- c("Name", "Yards", "TD")

RBURL3 = 'rawdata/U3.html'
colTable3 <- readHTMLTable(RBURL3, stringsAsFactors = FALSE)
colRows3 <- unlist(lapply(colTable3, function(t) dim(t)[1]))
RB3 = colTable3[[which.max(colRows3)]]
RB3 = RB3[c(2,5,8)]
colnames(RB3) <- c("Name", "Yards", "TD")

RBURL4 = 'rawdata/U4.html'
colTable4 <- readHTMLTable(RBURL4, stringsAsFactors = FALSE)
colRows4 <- unlist(lapply(colTable4, function(t) dim(t)[1]))
RB4 = colTable4[[which.max(colRows4)]]
RB4 = RB4[c(2,5,8)]
colnames(RB4) <- c("Name", "Yards", "TD")

RBURL5 = 'rawdata/U5.html'
colTable5 <- readHTMLTable(RBURL5, stringsAsFactors = FALSE)
colRows5 <- unlist(lapply(colTable5, function(t) dim(t)[1]))
RB5 = colTable5[[which.max(colRows5)]]
RB5 = RB5[c(2,5,8)]
colnames(RB5) <- c("Name", "Yards", "TD")

RBURL6 = 'rawdata/U6.html'
colTable6 <- readHTMLTable(RBURL6, stringsAsFactors = FALSE)
colRows6 <- unlist(lapply(colTable6, function(t) dim(t)[1]))
RB6 = colTable6[[which.max(colRows6)]]
RB6 = RB6[c(2,5,8)]
colnames(RB6) <- c("Name", "Yards", "TD")

RBURL7 = 'rawdata/U7.html'
colTable7 <- readHTMLTable(RBURL7, stringsAsFactors = FALSE)
colRows7 <- unlist(lapply(colTable7, function(t) dim(t)[1]))
RB7 = colTable7[[which.max(colRows7)]]
RB7 = RB7[c(2,5,8)]
colnames(RB7) <- c("Name", "Yards", "TD")

RBURL8 = 'rawdata/U8.html'
colTable8 <- readHTMLTable(RBURL8, stringsAsFactors = FALSE)
colRows8 <- unlist(lapply(colTable8, function(t) dim(t)[1]))
RB8 = colTable8[[which.max(colRows8)]]
RB8 = RB8[c(2,5,8)]
colnames(RB8) <- c("Name", "Yards", "TD")

RBURL9 = 'rawdata/U9.html'
colTable9 <- readHTMLTable(RBURL9, stringsAsFactors = FALSE)
colRows9 <- unlist(lapply(colTable9, function(t) dim(t)[1]))
RB9 = colTable9[[which.max(colRows9)]]
RB9 = RB9[c(2,5,8)]
colnames(RB9) <- c("Name", "Yards", "TD")

RBURL10 = 'rawdata/U10.html'
colTable10 <- readHTMLTable(RBURL10, stringsAsFactors = FALSE)
colRows10 <- unlist(lapply(colTable10, function(t) dim(t)[1]))
RB10 = colTable10[[which.max(colRows10)]]
RB10 = RB10[c(2,5,8)]
colnames(RB10) <- c("Name", "Yards", "TD")

RBURL11 = 'rawdata/U11.html'
colTable11 <- readHTMLTable(RBURL11, stringsAsFactors = FALSE)
colRows11 <- unlist(lapply(colTable11, function(t) dim(t)[1]))
RB11 = colTable11[[which.max(colRows11)]]
RB11 = RB11[c(2,5,8)]
colnames(RB11) <- c("Name", "Yards", "TD")

RBURL12 = 'rawdata/U12.html'
colTable12 <- readHTMLTable(RBURL12, stringsAsFactors = FALSE)
colRows12 <- unlist(lapply(colTable12, function(t) dim(t)[1]))
RB12 = colTable12[[which.max(colRows12)]]
RB12 = RB12[c(2,5,8)]
colnames(RB12) <- c("Name", "Yards", "TD")

RBURL13 = 'rawdata/U13.html'
colTable13 <- readHTMLTable(RBURL13, stringsAsFactors = FALSE)
colRows13 <- unlist(lapply(colTable13, function(t) dim(t)[1]))
RB13 = colTable13[[which.max(colRows13)]]
RB13 = RB13[c(2,5,8)]
colnames(RB13) <- c("Name", "Yards", "TD")

RBURL14 = 'rawdata/U14.html'
colTable14 <- readHTMLTable(RBURL14, stringsAsFactors = FALSE)
colRows14 <- unlist(lapply(colTable14, function(t) dim(t)[1]))
RB14 = colTable14[[which.max(colRows14)]]
RB14 = RB14[c(2,5,8)]
colnames(RB14) <- c("Name", "Yards", "TD")

RBURL15 = 'rawdata/U15.html'
colTable15 <- readHTMLTable(RBURL15, stringsAsFactors = FALSE)
colRows15 <- unlist(lapply(colTable15, function(t) dim(t)[1]))
RB15 = colTable15[[which.max(colRows15)]]
RB15 = RB15[c(2,5,8)]
colnames(RB15) <- c("Name", "Yards", "TD")

RBURL16 = 'rawdata/U16.html'
colTable16 <- readHTMLTable(RBURL16, stringsAsFactors = FALSE)
colRows16 <- unlist(lapply(colTable16, function(t) dim(t)[1]))
RB16 = colTable16[[which.max(colRows16)]]
RB16 = RB16[c(2,5,8)]
colnames(RB16) <- c("Name", "Yards", "TD")

RBURL17 = 'rawdata/U17.html'
colTable17 <- readHTMLTable(RBURL17, stringsAsFactors = FALSE)
colRows17 <- unlist(lapply(colTable17, function(t) dim(t)[1]))
RB17 = colTable17[[which.max(colRows17)]]
RB17 = RB17[c(2,5,8)]
colnames(RB17) <- c("Name", "Yards", "TD")

RBURL18 = 'rawdata/U18.html'
colTable18 <- readHTMLTable(RBURL18, stringsAsFactors = FALSE)
colRows18 <- unlist(lapply(colTable18, function(t) dim(t)[1]))
RB18 = colTable18[[which.max(colRows18)]]
RB18 = RB18[c(2,5,8)]
colnames(RB18) <- c("Name", "Yards", "TD")

RBURL19 = 'rawdata/U19.html'
colTable19 <- readHTMLTable(RBURL19, stringsAsFactors = FALSE)
colRows19 <- unlist(lapply(colTable19, function(t) dim(t)[1]))
RB19 = colTable19[[which.max(colRows19)]]
RB19 = RB19[c(2,5,8)]
colnames(RB19) <- c("Name", "Yards", "TD")

RBURL20 = 'rawdata/U20.html'
colTable20 <- readHTMLTable(RBURL20, stringsAsFactors = FALSE)
colRows20 <- unlist(lapply(colTable20, function(t) dim(t)[1]))
RB20 = colTable20[[which.max(colRows20)]]
RB20 = RB20[c(2,5,8)]
colnames(RB20) <- c("Name", "Yards", "TD")

RBURL21 = 'rawdata/U21.html'
colTable21 <- readHTMLTable(RBURL21, stringsAsFactors = FALSE)
colRows21 <- unlist(lapply(colTable21, function(t) dim(t)[1]))
RB21 = colTable21[[which.max(colRows21)]]
RB21 = RB21[c(2,5,8)]
colnames(RB21) <- c("Name", "Yards", "TD")

RBURL22 = 'rawdata/U22.html'
colTable22 <- readHTMLTable(RBURL22, stringsAsFactors = FALSE)
colRows22 <- unlist(lapply(colTable22, function(t) dim(t)[1]))
RB22 = colTable22[[which.max(colRows22)]]
RB22 = RB22[c(2,5,8)]
colnames(RB22) <- c("Name", "Yards", "TD")

RBURL23 = 'rawdata/U23.html'
colTable23 <- readHTMLTable(RBURL23, stringsAsFactors = FALSE)
colRows23 <- unlist(lapply(colTable23, function(t) dim(t)[1]))
RB23 = colTable23[[which.max(colRows23)]]
RB23 = RB23[c(2,5,8)]
colnames(RB23) <- c("Name", "Yards", "TD")

RBURL24 = 'rawdata/U24.html'
colTable24 <- readHTMLTable(RBURL24, stringsAsFactors = FALSE)
colRows24 <- unlist(lapply(colTable24, function(t) dim(t)[1]))
RB24 = colTable24[[which.max(colRows24)]]
RB24 = RB24[c(2,5,8)]
colnames(RB24) <- c("Name", "Yards", "TD")

RBURL25 = 'rawdata/U25.html'
colTable25 <- readHTMLTable(RBURL25, stringsAsFactors = FALSE)
colRows25 <- unlist(lapply(colTable25, function(t) dim(t)[1]))
RB25 = colTable25[[which.max(colRows25)]]
RB25 = RB25[c(2,5,8)]
colnames(RB25) <- c("Name", "Yards", "TD")

RBURL26 = 'rawdata/U26.html'
colTable26 <- readHTMLTable(RBURL26, stringsAsFactors = FALSE)
colRows26 <- unlist(lapply(colTable26, function(t) dim(t)[1]))
RB26 = colTable26[[which.max(colRows26)]]
RB26 = RB26[c(2,5,8)]
colnames(RB26) <- c("Name", "Yards", "TD")

RBURL27 = 'rawdata/U27.html'
colTable27 <- readHTMLTable(RBURL27, stringsAsFactors = FALSE)
colRows27 <- unlist(lapply(colTable27, function(t) dim(t)[1]))
RB27 = colTable27[[which.max(colRows27)]]
RB27 = RB27[c(2,5,8)]
colnames(RB27) <- c("Name", "Yards", "TD")

RBURL28 = 'rawdata/U28.html'
colTable28 <- readHTMLTable(RBURL28, stringsAsFactors = FALSE)
colRows28 <- unlist(lapply(colTable28, function(t) dim(t)[1]))
RB28 = colTable28[[which.max(colRows28)]]
RB28 = RB28[c(2,5,8)]
colnames(RB28) <- c("Name", "Yards", "TD")

RBURL29 = 'rawdata/U29.html'
colTable29 <- readHTMLTable(RBURL29, stringsAsFactors = FALSE)
colRows29 <- unlist(lapply(colTable29, function(t) dim(t)[1]))
RB29 = colTable29[[which.max(colRows29)]]
RB29 = RB29[c(2,5,8)]
colnames(RB29) <- c("Name", "Yards", "TD")

RBURL30 = 'rawdata/U30.html'
colTable30 <- readHTMLTable(RBURL30, stringsAsFactors = FALSE)
colRows30 <- unlist(lapply(colTable30, function(t) dim(t)[1]))
RB30 = colTable30[[which.max(colRows30)]]
RB30 = RB30[c(2,5,8)]
colnames(RB30) <- c("Name", "Yards", "TD")

RBURL31 = 'rawdata/U31.html'
colTable31 <- readHTMLTable(RBURL31, stringsAsFactors = FALSE)
colRows31 <- unlist(lapply(colTable31, function(t) dim(t)[1]))
RB31 = colTable31[[which.max(colRows31)]]
RB31 = RB31[c(2,5,8)]
colnames(RB31) <- c("Name", "Yards", "TD")

RBURL32 = 'rawdata/U32.html'
colTable32 <- readHTMLTable(RBURL32, stringsAsFactors = FALSE)
colRows32 <- unlist(lapply(colTable32, function(t) dim(t)[1]))
RB32 = colTable32[[which.max(colRows32)]]
RB32 = RB32[c(2,5,8)]
colnames(RB32) <- c("Name", "Yards", "TD")

RBURL33 = 'rawdata/U33.html'
colTable33 <- readHTMLTable(RBURL33, stringsAsFactors = FALSE)
colRows33 <- unlist(lapply(colTable33, function(t) dim(t)[1]))
RB33 = colTable33[[which.max(colRows33)]]
RB33 = RB33[c(2,5,8)]
colnames(RB33) <- c("Name", "Yards", "TD")

RBURL34 = 'rawdata/U34.html'
colTable34 <- readHTMLTable(RBURL34, stringsAsFactors = FALSE)
colRows34 <- unlist(lapply(colTable34, function(t) dim(t)[1]))
RB34 = colTable34[[which.max(colRows34)]]
RB34 = RB34[c(2,5,8)]
colnames(RB34) <- c("Name", "Yards", "TD")

RBURL35 = 'rawdata/U35.html'
colTable35 <- readHTMLTable(RBURL35, stringsAsFactors = FALSE)
colRows35 <- unlist(lapply(colTable35, function(t) dim(t)[1]))
RB35 = colTable35[[which.max(colRows35)]]
RB35 = RB35[c(2,5,8)]
colnames(RB35) <- c("Name", "Yards", "TD")

RBURL36 = 'rawdata/U36.html'
colTable36 <- readHTMLTable(RBURL36, stringsAsFactors = FALSE)
colRows36 <- unlist(lapply(colTable36, function(t) dim(t)[1]))
RB36 = colTable36[[which.max(colRows36)]]
RB36 = RB36[c(2,5,8)]
colnames(RB36) <- c("Name", "Yards", "TD")



RB1 <- rbind(RB1, RB2)
RB1 <- rbind(RB1, RB3)
RB1 <- rbind(RB1, RB4)
RB1 <- rbind(RB1, RB5)
RB1 <- rbind(RB1, RB6)
RB1 <- rbind(RB1, RB7)
RB1 <- rbind(RB1, RB8)
RB1 <- rbind(RB1, RB9)
RB1 <- rbind(RB1, RB10)
RB1 <- rbind(RB1, RB11)
RB1 <- rbind(RB1, RB12)
RB1 <- rbind(RB1, RB13)
RB1 <- rbind(RB1, RB14)
RB1 <- rbind(RB1, RB15)
RB1 <- rbind(RB1, RB16)
RB1 <- rbind(RB1, RB17)
RB1 <- rbind(RB1, RB18)
RB1 <- rbind(RB1, RB19)
RB1 <- rbind(RB1, RB20)
RB1 <- rbind(RB1, RB21)
RB1 <- rbind(RB1, RB22)
RB1 <- rbind(RB1, RB23)
RB1 <- rbind(RB1, RB24)
RB1 <- rbind(RB1, RB25)
RB1 <- rbind(RB1, RB26)
RB1 <- rbind(RB1, RB27)
RB1 <- rbind(RB1, RB28)
RB1 <- rbind(RB1, RB29)
RB1 <- rbind(RB1, RB30)
RB1 <- rbind(RB1, RB31)
RB1 <- rbind(RB1, RB32)
RB1 <- rbind(RB1, RB33)
RB1 <- rbind(RB1, RB34)
RB1 <- rbind(RB1, RB35)
RB1 <- rbind(RB1, RB36)



#Replace Name, Position with Name
for (i in 1:1540) {
  RB1[i,1] <- gsub("\\,.*","",RB1[i,1])
}



#Merge College and High School data frames
totalRB <- merge(high4, RB1)



#Clean State information
totalRB <- cleanState(totalRB)










#Reciever Phase:
# 1) Import all high school wide reciever information (position, name, state, stars)
# 2) Import all college wide reciever information (name, yards, td's)
# 3) Inner Join high school and college statistics
#
############################################################## WRs #######################################################
############################################################## WRs #######################################################
############################################################## WRs #######################################################
############################################################## WRs #######################################################
############################################################## WRs #######################################################
############################################################## WRs #######################################################
highURL8 = 'rawdata/Hwr8.html'
highTable8 <- readHTMLTable(highURL8, stringsAsFactors = FALSE)
highRows8 <- unlist(lapply(highTable8, function(t) dim(t)[1]))
high8 = highTable8[[which.max(highRows8)]]
high8 = high8[c(1,2,3,7)]
colnames(high8) <- c("Position", "Name", "State", "Stars")

highURL9 = 'rawdata/Hwr9.html'
highTable9 <- readHTMLTable(highURL9, stringsAsFactors = FALSE)
highRows9 <- unlist(lapply(highTable9, function(t) dim(t)[1]))
high9 = highTable9[[which.max(highRows9)]]
high9 = high9[c(1,2,3,7)]
colnames(high9) <- c("Position", "Name", "State", "Stars")

highURL10 = 'rawdata/Hwr10.html'
highTable10 <- readHTMLTable(highURL10, stringsAsFactors = FALSE)
highRows10 <- unlist(lapply(highTable10, function(t) dim(t)[1]))
high10 = highTable10[[which.max(highRows10)]]
high10 = high10[c(1,2,3,7)]
colnames(high10) <- c("Position", "Name", "State", "Stars")

highURL11 = 'rawdata/Hwr11.html'
highTable11 <- readHTMLTable(highURL11, stringsAsFactors = FALSE)
highRows11 <- unlist(lapply(highTable11, function(t) dim(t)[1]))
high11 = highTable11[[which.max(highRows11)]]
high11 = high11[c(1,2,3,7)]
colnames(high11) <- c("Position", "Name", "State", "Stars")

highURL12 = 'rawdata/Hwr12.html'
highTable12 <- readHTMLTable(highURL12, stringsAsFactors = FALSE)
highRows12 <- unlist(lapply(highTable12, function(t) dim(t)[1]))
high12 = highTable12[[which.max(highRows12)]]
high12 = high12[c(1,2,3,7)]
colnames(high12) <- c("Position", "Name", "State", "Stars")



high8 <- rbind(high8, high9)
high8 <- rbind(high8, high10)
high8 <- rbind(high8, high11)
high8 <- rbind(high8, high12)



WRURL1 = 'rawdata/R1.html'
colTable1 <- readHTMLTable(WRURL1, stringsAsFactors = FALSE)
colRows1 <- unlist(lapply(colTable1, function(t) dim(t)[1]))
WR1 = colTable1[[which.max(colRows1)]]
WR1 = WR1[c(2,5,8)]
colnames(WR1) <- c("Name", "Yards", "TD")

WRURL2 = 'rawdata/R2.html'
colTable2 <- readHTMLTable(WRURL2, stringsAsFactors = FALSE)
colRows2 <- unlist(lapply(colTable2, function(t) dim(t)[1]))
WR2 = colTable2[[which.max(colRows2)]]
WR2 = WR2[c(2,5,8)]
colnames(WR2) <- c("Name", "Yards", "TD")

WRURL3 = 'rawdata/R3.html'
colTable3 <- readHTMLTable(WRURL3, stringsAsFactors = FALSE)
colRows3 <- unlist(lapply(colTable3, function(t) dim(t)[1]))
WR3 = colTable3[[which.max(colRows3)]]
WR3 = WR3[c(2,5,8)]
colnames(WR3) <- c("Name", "Yards", "TD")

WRURL4 = 'rawdata/R4.html'
colTable4 <- readHTMLTable(WRURL4, stringsAsFactors = FALSE)
colRows4 <- unlist(lapply(colTable4, function(t) dim(t)[1]))
WR4 = colTable4[[which.max(colRows4)]]
WR4 = WR4[c(2,5,8)]
colnames(WR4) <- c("Name", "Yards", "TD")

WRURL5 = 'rawdata/R5.html'
colTable5 <- readHTMLTable(WRURL5, stringsAsFactors = FALSE)
colRows5 <- unlist(lapply(colTable5, function(t) dim(t)[1]))
WR5 = colTable5[[which.max(colRows5)]]
WR5 = WR5[c(2,5,8)]
colnames(WR5) <- c("Name", "Yards", "TD")

WRURL6 = 'rawdata/R6.html'
colTable6 <- readHTMLTable(WRURL6, stringsAsFactors = FALSE)
colRows6 <- unlist(lapply(colTable6, function(t) dim(t)[1]))
WR6 = colTable6[[which.max(colRows6)]]
WR6 = WR6[c(2,5,8)]
colnames(WR6) <- c("Name", "Yards", "TD")

WRURL7 = 'rawdata/R7.html'
colTable7 <- readHTMLTable(WRURL7, stringsAsFactors = FALSE)
colRows7 <- unlist(lapply(colTable7, function(t) dim(t)[1]))
WR7 = colTable7[[which.max(colRows7)]]
WR7 = WR7[c(2,5,8)]
colnames(WR7) <- c("Name", "Yards", "TD")

WRURL8 = 'rawdata/R8.html'
colTable8 <- readHTMLTable(WRURL8, stringsAsFactors = FALSE)
colRows8 <- unlist(lapply(colTable8, function(t) dim(t)[1]))
WR8 = colTable8[[which.max(colRows8)]]
WR8 = WR8[c(2,5,8)]
colnames(WR8) <- c("Name", "Yards", "TD")

WRURL9 = 'rawdata/R9.html'
colTable9 <- readHTMLTable(WRURL9, stringsAsFactors = FALSE)
colRows9 <- unlist(lapply(colTable9, function(t) dim(t)[1]))
WR9 = colTable9[[which.max(colRows9)]]
WR9 = WR9[c(2,5,8)]
colnames(WR9) <- c("Name", "Yards", "TD")

WRURL10 = 'rawdata/R10.html'
colTable10 <- readHTMLTable(WRURL10, stringsAsFactors = FALSE)
colRows10 <- unlist(lapply(colTable10, function(t) dim(t)[1]))
WR10 = colTable10[[which.max(colRows10)]]
WR10 = WR10[c(2,5,8)]
colnames(WR10) <- c("Name", "Yards", "TD")

WRURL11 = 'rawdata/R11.html'
colTable11 <- readHTMLTable(WRURL11, stringsAsFactors = FALSE)
colRows11 <- unlist(lapply(colTable11, function(t) dim(t)[1]))
WR11 = colTable11[[which.max(colRows11)]]
WR11 = WR11[c(2,5,8)]
colnames(WR11) <- c("Name", "Yards", "TD")

WRURL12 = 'rawdata/R12.html'
colTable12 <- readHTMLTable(WRURL12, stringsAsFactors = FALSE)
colRows12 <- unlist(lapply(colTable12, function(t) dim(t)[1]))
WR12 = colTable12[[which.max(colRows12)]]
WR12 = WR12[c(2,5,8)]
colnames(WR12) <- c("Name", "Yards", "TD")

WRURL13 = 'rawdata/R13.html'
colTable13 <- readHTMLTable(WRURL13, stringsAsFactors = FALSE)
colRows13 <- unlist(lapply(colTable13, function(t) dim(t)[1]))
WR13 = colTable13[[which.max(colRows13)]]
WR13 = WR13[c(2,5,8)]
colnames(WR13) <- c("Name", "Yards", "TD")

WRURL14 = 'rawdata/R14.html'
colTable14 <- readHTMLTable(WRURL14, stringsAsFactors = FALSE)
colRows14 <- unlist(lapply(colTable14, function(t) dim(t)[1]))
WR14 = colTable14[[which.max(colRows14)]]
WR14 = WR14[c(2,5,8)]
colnames(WR14) <- c("Name", "Yards", "TD")

WRURL15 = 'rawdata/R15.html'
colTable15 <- readHTMLTable(WRURL15, stringsAsFactors = FALSE)
colRows15 <- unlist(lapply(colTable15, function(t) dim(t)[1]))
WR15 = colTable15[[which.max(colRows15)]]
WR15 = WR15[c(2,5,8)]
colnames(WR15) <- c("Name", "Yards", "TD")

WRURL16 = 'rawdata/R16.html'
colTable16 <- readHTMLTable(WRURL16, stringsAsFactors = FALSE)
colRows16 <- unlist(lapply(colTable16, function(t) dim(t)[1]))
WR16 = colTable16[[which.max(colRows16)]]
WR16 = WR16[c(2,5,8)]
colnames(WR16) <- c("Name", "Yards", "TD")

WRURL17 = 'rawdata/R17.html'
colTable17 <- readHTMLTable(WRURL17, stringsAsFactors = FALSE)
colRows17 <- unlist(lapply(colTable17, function(t) dim(t)[1]))
WR17 = colTable17[[which.max(colRows17)]]
WR17 = WR17[c(2,5,8)]
colnames(WR17) <- c("Name", "Yards", "TD")

WRURL18 = 'rawdata/R18.html'
colTable18 <- readHTMLTable(WRURL18, stringsAsFactors = FALSE)
colRows18 <- unlist(lapply(colTable18, function(t) dim(t)[1]))
WR18 = colTable18[[which.max(colRows18)]]
WR18 = WR18[c(2,5,8)]
colnames(WR18) <- c("Name", "Yards", "TD")

WRURL19 = 'rawdata/R19.html'
colTable19 <- readHTMLTable(WRURL19, stringsAsFactors = FALSE)
colRows19 <- unlist(lapply(colTable19, function(t) dim(t)[1]))
WR19 = colTable19[[which.max(colRows19)]]
WR19 = WR19[c(2,5,8)]
colnames(WR19) <- c("Name", "Yards", "TD")

WRURL20 = 'rawdata/R20.html'
colTable20 <- readHTMLTable(WRURL20, stringsAsFactors = FALSE)
colRows20 <- unlist(lapply(colTable20, function(t) dim(t)[1]))
WR20 = colTable20[[which.max(colRows20)]]
WR20 = WR20[c(2,5,8)]
colnames(WR20) <- c("Name", "Yards", "TD")

WRURL21 = 'rawdata/R21.html'
colTable21 <- readHTMLTable(WRURL21, stringsAsFactors = FALSE)
colRows21 <- unlist(lapply(colTable21, function(t) dim(t)[1]))
WR21 = colTable21[[which.max(colRows21)]]
WR21 = WR21[c(2,5,8)]
colnames(WR21) <- c("Name", "Yards", "TD")

WRURL22 = 'rawdata/R22.html'
colTable22 <- readHTMLTable(WRURL22, stringsAsFactors = FALSE)
colRows22 <- unlist(lapply(colTable22, function(t) dim(t)[1]))
WR22 = colTable22[[which.max(colRows22)]]
WR22 = WR22[c(2,5,8)]
colnames(WR22) <- c("Name", "Yards", "TD")

WRURL23 = 'rawdata/R23.html'
colTable23 <- readHTMLTable(WRURL23, stringsAsFactors = FALSE)
colRows23 <- unlist(lapply(colTable23, function(t) dim(t)[1]))
WR23 = colTable23[[which.max(colRows23)]]
WR23 = WR23[c(2,5,8)]
colnames(WR23) <- c("Name", "Yards", "TD")

WRURL24 = 'rawdata/R24.html'
colTable24 <- readHTMLTable(WRURL24, stringsAsFactors = FALSE)
colRows24 <- unlist(lapply(colTable24, function(t) dim(t)[1]))
WR24 = colTable24[[which.max(colRows24)]]
WR24 = WR24[c(2,5,8)]
colnames(WR24) <- c("Name", "Yards", "TD")

WRURL25 = 'rawdata/R25.html'
colTable25 <- readHTMLTable(WRURL25, stringsAsFactors = FALSE)
colRows25 <- unlist(lapply(colTable25, function(t) dim(t)[1]))
WR25 = colTable25[[which.max(colRows25)]]
WR25 = WR25[c(2,5,8)]
colnames(WR25) <- c("Name", "Yards", "TD")

WRURL26 = 'rawdata/R26.html'
colTable26 <- readHTMLTable(WRURL26, stringsAsFactors = FALSE)
colRows26 <- unlist(lapply(colTable26, function(t) dim(t)[1]))
WR26 = colTable26[[which.max(colRows26)]]
WR26 = WR26[c(2,5,8)]
colnames(WR26) <- c("Name", "Yards", "TD")

WRURL27 = 'rawdata/R27.html'
colTable27 <- readHTMLTable(WRURL27, stringsAsFactors = FALSE)
colRows27 <- unlist(lapply(colTable27, function(t) dim(t)[1]))
WR27 = colTable27[[which.max(colRows27)]]
WR27 = WR27[c(2,5,8)]
colnames(WR27) <- c("Name", "Yards", "TD")

WRURL28 = 'rawdata/R28.html'
colTable28 <- readHTMLTable(WRURL28, stringsAsFactors = FALSE)
colRows28 <- unlist(lapply(colTable28, function(t) dim(t)[1]))
WR28 = colTable28[[which.max(colRows28)]]
WR28 = WR28[c(2,5,8)]
colnames(WR28) <- c("Name", "Yards", "TD")

WRURL29 = 'rawdata/R29.html'
colTable29 <- readHTMLTable(WRURL29, stringsAsFactors = FALSE)
colRows29 <- unlist(lapply(colTable29, function(t) dim(t)[1]))
WR29 = colTable29[[which.max(colRows29)]]
WR29 = WR29[c(2,5,8)]
colnames(WR29) <- c("Name", "Yards", "TD")

WRURL30 = 'rawdata/R30.html'
colTable30 <- readHTMLTable(WRURL30, stringsAsFactors = FALSE)
colRows30 <- unlist(lapply(colTable30, function(t) dim(t)[1]))
WR30 = colTable30[[which.max(colRows30)]]
WR30 = WR30[c(2,5,8)]
colnames(WR30) <- c("Name", "Yards", "TD")

WRURL31 = 'rawdata/R31.html'
colTable31 <- readHTMLTable(WRURL31, stringsAsFactors = FALSE)
colRows31 <- unlist(lapply(colTable31, function(t) dim(t)[1]))
WR31 = colTable31[[which.max(colRows31)]]
WR31 = WR31[c(2,5,8)]
colnames(WR31) <- c("Name", "Yards", "TD")

WRURL32 = 'rawdata/R32.html'
colTable32 <- readHTMLTable(WRURL32, stringsAsFactors = FALSE)
colRows32 <- unlist(lapply(colTable32, function(t) dim(t)[1]))
WR32 = colTable32[[which.max(colRows32)]]
WR32 = WR32[c(2,5,8)]
colnames(WR32) <- c("Name", "Yards", "TD")

WRURL33 = 'rawdata/R33.html'
colTable33 <- readHTMLTable(WRURL33, stringsAsFactors = FALSE)
colRows33 <- unlist(lapply(colTable33, function(t) dim(t)[1]))
WR33 = colTable33[[which.max(colRows33)]]
WR33 = WR33[c(2,5,8)]
colnames(WR33) <- c("Name", "Yards", "TD")

WRURL34 = 'rawdata/R34.html'
colTable34 <- readHTMLTable(WRURL34, stringsAsFactors = FALSE)
colRows34 <- unlist(lapply(colTable34, function(t) dim(t)[1]))
WR34 = colTable34[[which.max(colRows34)]]
WR34 = WR34[c(2,5,8)]
colnames(WR34) <- c("Name", "Yards", "TD")

WRURL35 = 'rawdata/R35.html'
colTable35 <- readHTMLTable(WRURL35, stringsAsFactors = FALSE)
colRows35 <- unlist(lapply(colTable35, function(t) dim(t)[1]))
WR35 = colTable35[[which.max(colRows35)]]
WR35 = WR35[c(2,5,8)]
colnames(WR35) <- c("Name", "Yards", "TD")

WRURL36 = 'rawdata/R36.html'
colTable36 <- readHTMLTable(WRURL36, stringsAsFactors = FALSE)
colRows36 <- unlist(lapply(colTable36, function(t) dim(t)[1]))
WR36 = colTable36[[which.max(colRows36)]]
WR36 = WR36[c(2,5,8)]
colnames(WR36) <- c("Name", "Yards", "TD")

WRURL37 = 'rawdata/R37.html'
colTable37 <- readHTMLTable(WRURL37, stringsAsFactors = FALSE)
colRows37 <- unlist(lapply(colTable37, function(t) dim(t)[1]))
WR37 = colTable37[[which.max(colRows37)]]
WR37 = WR37[c(2,5,8)]
colnames(WR37) <- c("Name", "Yards", "TD")

WRURL38 = 'rawdata/R38.html'
colTable38 <- readHTMLTable(WRURL38, stringsAsFactors = FALSE)
colRows38 <- unlist(lapply(colTable38, function(t) dim(t)[1]))
WR38 = colTable38[[which.max(colRows38)]]
WR38 = WR38[c(2,5,8)]
colnames(WR38) <- c("Name", "Yards", "TD")

WRURL39 = 'rawdata/R39.html'
colTable39 <- readHTMLTable(WRURL39, stringsAsFactors = FALSE)
colRows39 <- unlist(lapply(colTable39, function(t) dim(t)[1]))
WR39 = colTable39[[which.max(colRows39)]]
WR39 = WR39[c(2,5,8)]
colnames(WR39) <- c("Name", "Yards", "TD")

WRURL40 = 'rawdata/R40.html'
colTable40 <- readHTMLTable(WRURL40, stringsAsFactors = FALSE)
colRows40 <- unlist(lapply(colTable40, function(t) dim(t)[1]))
WR40 = colTable40[[which.max(colRows40)]]
WR40 = WR40[c(2,5,8)]
colnames(WR40) <- c("Name", "Yards", "TD")

WRURL41 = 'rawdata/R41.html'
colTable41 <- readHTMLTable(WRURL41, stringsAsFactors = FALSE)
colRows41 <- unlist(lapply(colTable41, function(t) dim(t)[1]))
WR41 = colTable41[[which.max(colRows41)]]
WR41 = WR41[c(2,5,8)]
colnames(WR41) <- c("Name", "Yards", "TD")

WRURL42 = 'rawdata/R42.html'
colTable42 <- readHTMLTable(WRURL42, stringsAsFactors = FALSE)
colRows42 <- unlist(lapply(colTable42, function(t) dim(t)[1]))
WR42 = colTable42[[which.max(colRows42)]]
WR42 = WR42[c(2,5,8)]
colnames(WR42) <- c("Name", "Yards", "TD")

WRURL43 = 'rawdata/R43.html'
colTable43 <- readHTMLTable(WRURL43, stringsAsFactors = FALSE)
colRows43 <- unlist(lapply(colTable43, function(t) dim(t)[1]))
WR43 = colTable43[[which.max(colRows43)]]
WR43 = WR43[c(2,5,8)]
colnames(WR43) <- c("Name", "Yards", "TD")

WRURL44 = 'rawdata/R44.html'
colTable44 <- readHTMLTable(WRURL44, stringsAsFactors = FALSE)
colRows44 <- unlist(lapply(colTable44, function(t) dim(t)[1]))
WR44 = colTable44[[which.max(colRows44)]]
WR44 = WR44[c(2,5,8)]
colnames(WR44) <- c("Name", "Yards", "TD")

WRURL45 = 'rawdata/R45.html'
colTable45 <- readHTMLTable(WRURL45, stringsAsFactors = FALSE)
colRows45 <- unlist(lapply(colTable45, function(t) dim(t)[1]))
WR45 = colTable45[[which.max(colRows45)]]
WR45 = WR45[c(2,5,8)]
colnames(WR45) <- c("Name", "Yards", "TD")

WRURL46 = 'rawdata/R46.html'
colTable46 <- readHTMLTable(WRURL46, stringsAsFactors = FALSE)
colRows46 <- unlist(lapply(colTable46, function(t) dim(t)[1]))
WR46 = colTable46[[which.max(colRows46)]]
WR46 = WR46[c(2,5,8)]
colnames(WR46) <- c("Name", "Yards", "TD")

WRURL47 = 'rawdata/R47.html'
colTable47 <- readHTMLTable(WRURL47, stringsAsFactors = FALSE)
colRows47 <- unlist(lapply(colTable47, function(t) dim(t)[1]))
WR47 = colTable47[[which.max(colRows47)]]
WR47 = WR47[c(2,5,8)]
colnames(WR47) <- c("Name", "Yards", "TD")



WR1 <- rbind(WR1, WR2)
WR1 <- rbind(WR1, WR3)
WR1 <- rbind(WR1, WR4)
WR1 <- rbind(WR1, WR5)
WR1 <- rbind(WR1, WR6)
WR1 <- rbind(WR1, WR7)
WR1 <- rbind(WR1, WR8)
WR1 <- rbind(WR1, WR9)
WR1 <- rbind(WR1, WR10)
WR1 <- rbind(WR1, WR11)
WR1 <- rbind(WR1, WR12)
WR1 <- rbind(WR1, WR13)
WR1 <- rbind(WR1, WR14)
WR1 <- rbind(WR1, WR15)
WR1 <- rbind(WR1, WR16)
WR1 <- rbind(WR1, WR17)
WR1 <- rbind(WR1, WR18)
WR1 <- rbind(WR1, WR19)
WR1 <- rbind(WR1, WR20)
WR1 <- rbind(WR1, WR21)
WR1 <- rbind(WR1, WR22)
WR1 <- rbind(WR1, WR23)
WR1 <- rbind(WR1, WR24)
WR1 <- rbind(WR1, WR25)
WR1 <- rbind(WR1, WR26)
WR1 <- rbind(WR1, WR27)
WR1 <- rbind(WR1, WR28)
WR1 <- rbind(WR1, WR29)
WR1 <- rbind(WR1, WR30)
WR1 <- rbind(WR1, WR31)
WR1 <- rbind(WR1, WR32)
WR1 <- rbind(WR1, WR33)
WR1 <- rbind(WR1, WR34)
WR1 <- rbind(WR1, WR35)
WR1 <- rbind(WR1, WR36)
WR1 <- rbind(WR1, WR37)
WR1 <- rbind(WR1, WR38)
WR1 <- rbind(WR1, WR39)
WR1 <- rbind(WR1, WR40)
WR1 <- rbind(WR1, WR41)
WR1 <- rbind(WR1, WR42)
WR1 <- rbind(WR1, WR43)
WR1 <- rbind(WR1, WR44)
WR1 <- rbind(WR1, WR45)
WR1 <- rbind(WR1, WR46)
WR1 <- rbind(WR1, WR47)



#Replace Name, Position with Name
for (i in 1:2021) {
  WR1[i,1] <- gsub("\\,.*","",WR1[i,1])
}



#Merge College and High School data frames
totalWR <- merge(high8, WR1)



#Call cleanState() function in DataCleaningFunctions.R
totalWR <- cleanState(totalWR)










#Merge Phase:
# 1) Combine Quarterback, Running Back, and Reciever data frames
# 2) Provide additional cleaning
# 3) Output final data frame as 'total.csv' for easier use and access for analysis
#
############################################################## Merge #######################################################
############################################################## Merge #######################################################
############################################################## Merge #######################################################
############################################################## Merge #######################################################
############################################################## Merge #######################################################
############################################################## Merge #######################################################

#Combine all positions
total <- rbind(totalQB, totalRB)
total <- rbind(total, totalWR)

#Call getState() function in DataCleaningFunctions.R
#Replaces state info with proper format
total <- getState(total)
total$TD <- as.numeric(total$TD)
total$Yards <- as.numeric(total$Yards)

#Call noStar() function in DataCleaningFunctions.R
#Removes the word 'Star' from the Star column
total <- noStar(total)
total$Stars <- as.numeric(total$Stars)

#Call removeDuplicates() function in DataCleaningFunctions.R
#Removes Duplicate Players
total <- removeDuplicates(total)

#Output clean data
write.csv(total, "data/total.csv")
