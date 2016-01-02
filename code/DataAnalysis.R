#---
#title: "Data analysis"
#author: "Ritwik Roy"
#date: "December 10, 2015"
#output: html_document
#---
  # Connor Gullstad, Eric Arnett, Michael Ferrin, Ritwik Roy
  # Stat 133 Final Project
  # December 13, 2015
  
  #(imports functions from DataCleaningFunctions.R)
  # This file contains the data analysis functions and calculations used to 
  # analyze the information we used in addition to contributing the 
  # graphic visualizations we made of important information
  

################################ Our Report Won't Knit with the install
#install.packages('ggplot2')
library('ggplot2')
library('readr')
source('code/DataAnalysisFunctions.R')
total = read.csv('data/total.csv')

par(mar=c(1,1,1,1))
dev.off()

California <- subset(total, State == "California")
Florida <- subset(total, State == "Florida")
Texas <- subset(total, State == "Texas")


# Avg player rating from state

CA_Avg_Stars <- round(sum(California$Stars) / nrow(California), 2)
FL_Avg_Stars <- round(sum(Florida$Stars) / nrow(Florida), 2)
TX_Avg_Stars <- round(sum(Texas$Stars) / nrow(Texas), 2)

QBs <- subset(total, Position == "QB")
RBs <- subset(total, Position == "RB")
WRs <- subset(total, Position == "WR")

West <- c("Alaska", "Hawaii", "Washington", "Oregon", "California",
          "Idaho", "Nevada", "Utah", "Arizona", "Montana", "New Mexico",
          "Colorado", "Wyoming")

Midwest <- c("North Dakota", "South Dakota", "Nebraska", "Kansas",
             "Oklahoma", "Texas", "Minnesota", "Wisconsin", "Iowa",
             "Michigan", "Illinois", "Indiana", "Ohio", "Missouri")

South <- c("Kentucky", "Tennessee", "Arkansas", "Louisiana",
           "Alabama", "Mississippi", "Georgia", "Florida",
           "South Carolina", "North Carolina", "Virginia", "West Virginia")

Northeast <- c("Pennsylvania", "Maine", "Vermont", "New Hampshire",
               "Massachusetts", "Connecticut", "Rhode Island",
               "New York", "Maryland", "Delaware", "New Jersey")



# Avg QB Stats
Avg_QB_TD <- round(calculate_avg(QBs$TD, QBs), 2)
Avg_QB_Yards <- round(calculate_avg(QBs$Yards, QBs), 0)
# Avg RB Stats
Avg_RB_TD <- round(calculate_avg(RBs$TD, RBs), 2)
Avg_RB_Yards <- round(calculate_avg(RBs$Yards, RBs), 0)
# Avg WR Stats
Avg_WR_TD <- round(calculate_avg(WRs$TD, WRs), 2)
Avg_WR_Yards <- round(calculate_avg(WRs$Yards, WRs), 0)


# Standard Deviations

#QBs
sd_QB_TD <- sd(QBs$TD)
sd_QB_Yards <- sd(QBs$Yards)
#RBs
sd_RB_TD <- sd(RBs$TD)
sd_RB_Yards <- sd(RBs$Yards)
#WRs
sd_WR_TD <- sd(WRs$TD)
sd_WR_Yards <- sd(WRs$Yards)




WRs$sd_Yards <- sd_away(Avg_WR_Yards, WRs$Yards, sd_WR_Yards)
WRs$sd_TD <- sd_away(Avg_WR_TD, WRs$TD, sd_WR_TD)

RBs$sd_Yards <- sd_away(Avg_RB_Yards, RBs$Yards, sd_RB_Yards)
RBs$sd_TD <- sd_away(Avg_RB_TD, RBs$TD, sd_RB_TD)

QBs$sd_Yards <- round((QBs$Yards - Avg_QB_Yards) / sd_QB_Yards, 2)
QBs$sd_TD <- round((QBs$TD - Avg_QB_TD) / sd_QB_TD, 2)


###############################################################


# How many players of each rating are there?
total_5_stars <- nrow(subset(total, Stars == 5))
total_4_stars <- nrow(subset(total, Stars == 4))
total_3_stars <- nrow(subset(total, Stars == 3))
total_2_stars <- nrow(subset(total, Stars == 2))
star_distribution <- 
  c(total_2_stars, total_3_stars, total_4_stars, total_5_stars)

# How many players from each region?
total_West <- nrow(subset(total, State %in% West))
total_Midwest <- nrow(subset(total, State %in% Midwest))
total_South <- nrow(subset(total, State %in% South))
total_Northeast <- nrow(subset(total, State %in% Northeast))
region_distribution <- 
  c(total_West, total_Midwest, total_South, total_Northeast)

# 4-stars by region
num_West_4_stars <- nrow(subset(total, Stars == 4 & State %in% West))
num_Midwest_4_stars <- nrow(subset(total, Stars == 4 & State %in% Midwest))
num_South_4_stars <- nrow(subset(total, Stars == 4 & State %in% South))
num_Northeast_4_stars <- nrow(subset(total, Stars == 4 & State %in% Northeast))

# 3-stars by region
num_West_3_stars <- nrow(subset(total, Stars == 3 & State %in% West))
num_Midwest_3_stars <- nrow(subset(total, Stars == 3 & State %in% Midwest))
num_South_3_stars <- nrow(subset(total, Stars == 3 & State %in% South))
num_Northeast_3_stars <- nrow(subset(total, Stars == 3 & State %in% Northeast))

# 2-stars by region
num_West_2_stars <- nrow(subset(total, Stars == 2 & State %in% West))
num_Midwest_2_stars <- nrow(subset(total, Stars == 2 & State %in% Midwest))
num_South_2_stars <- nrow(subset(total, Stars == 2 & State %in% South))
num_Northeast_2_stars <- nrow(subset(total, Stars == 2 & State %in% Northeast))


#### Performance by position and region ####

#### QBs Yards ####

# Subset QBs by region
West_QBs <- subset(QBs, State %in% West)
Midwest_QBs <- subset(QBs, State %in% Midwest)
South_QBs <- subset(QBs, State %in% South)
Northeast_QBs <- subset(QBs, State %in% Northeast)

# Standard deviations above/below mean by region for QBs:
avg_Yards_sd_West_QBs <- round(sum(West_QBs$sd_Yards) / nrow(West_QBs), 2)
avg_Yards_sd_Midwest_QBs <- round(sum(Midwest_QBs$sd_Yards) 
                                  / nrow(Midwest_QBs), 2)
avg_Yards_sd_South_QBs <- round(sum(South_QBs$sd_Yards) / nrow(South_QBs), 2)
avg_Yards_sd_Northeast_QBs <- 
  round(sum(Northeast_QBs$sd_Yards) / nrow(Northeast_QBs), 2)

#### RBs Yards ####

# Subset RBs by region
West_RBs <- subset(RBs, State %in% West)
Midwest_RBs <- subset(RBs, State %in% Midwest)
South_RBs <- subset(RBs, State %in% South)
Northeast_RBs <- subset(RBs, State %in% Northeast)

# Standard deviations above/below mean by region for RBs:
avg_Yards_sd_West_RBs <- round(sum(West_RBs$sd_Yards) / nrow(West_RBs), 2)
avg_Yards_sd_Midwest_RBs <- round(sum(Midwest_RBs$sd_Yards) 
                                  / nrow(Midwest_RBs), 2)
avg_Yards_sd_South_RBs <- round(sum(South_RBs$sd_Yards) / nrow(South_RBs), 2)
avg_Yards_sd_Northeast_RBs <- round(sum(Northeast_RBs$sd_Yards) 
                                    / nrow(Northeast_RBs), 2)
avg_Yards_sd_regions <- 
  c(avg_Yards_sd_West_RBs, avg_Yards_sd_Midwest_RBs, 
    avg_Yards_sd_South_RBs, avg_Yards_sd_Northeast_RBs)

#### WRs Yards ####

# Subset WRs by region
West_WRs <- subset(WRs, State %in% West)
Midwest_WRs <- subset(WRs, State %in% Midwest)
South_WRs <- subset(WRs, State %in% South)
Northeast_WRs <- subset(WRs, State %in% Northeast)

# Standard deviations above/below mean by region for WRs:
avg_Yards_sd_West_WRs <- round(sum(West_WRs$sd_Yards) / nrow(West_WRs), 2)
avg_Yards_sd_Midwest_WRs <- round(sum(Midwest_WRs$sd_Yards) 
                                  / nrow(Midwest_WRs), 2)
avg_Yards_sd_South_WRs <- round(sum(South_WRs$sd_Yards) / nrow(South_WRs), 2)
avg_Yards_sd_Northeast_WRs <- round(sum(Northeast_WRs$sd_Yards) 
                                    / nrow(Northeast_WRs), 2)

###

#### QBs TD ####

# Standard deviations above/below mean by region for QBs:
avg_TD_sd_West_QBs <- round(sum(West_QBs$sd_TD) / nrow(West_QBs), 2)
avg_TD_sd_Midwest_QBs <- round(sum(Midwest_QBs$sd_TD) / nrow(Midwest_QBs), 2)
avg_TD_sd_South_QBs <- round(sum(South_QBs$sd_TD) / nrow(South_QBs), 2)
avg_TD_sd_Northeast_QBs <- round(sum(Northeast_QBs$sd_TD) 
                                 / nrow(Northeast_QBs), 2)
avg_TD_sd_regions <- 
  c(avg_TD_sd_West_QBs, avg_TD_sd_Midwest_QBs, 
    avg_TD_sd_South_QBs, avg_TD_sd_Northeast_QBs)

#### RBs TD ####

# Standard deviations above/below mean by region for RBs:
avg_TD_sd_West_RBs <- round(sum(West_RBs$sd_TD) / nrow(West_RBs), 2)
avg_TD_sd_Midwest_RBs <- round(sum(Midwest_RBs$sd_TD) / nrow(Midwest_RBs), 2)
avg_TD_sd_South_RBs <- round(sum(South_RBs$sd_TD) / nrow(South_RBs), 2)
avg_TD_sd_Northeast_RBs <- round(sum(Northeast_RBs$sd_TD) 
                                 / nrow(Northeast_RBs), 2)

#### WRs TD ####

# Standard deviations above/below mean by region for WRs:
avg_TD_sd_West_WRs <- round(sum(West_WRs$sd_TD) / nrow(West_WRs), 2)
avg_TD_sd_Midwest_WRs <- round(sum(Midwest_WRs$sd_TD) / nrow(Midwest_WRs), 2)
avg_TD_sd_South_WRs <- round(sum(South_WRs$sd_TD) / nrow(South_WRs), 2)
avg_TD_sd_Northeast_WRs <- round(sum(Northeast_WRs$sd_TD) 
                                 / nrow(Northeast_WRs), 2)



# Players by position and star-rating #

# 4 stars
QBs_4_star <- subset(QBs, Stars == 4)
RBs_4_star <- subset(RBs, Stars == 4)
WRs_4_star <- subset(WRs, Stars == 4)

# 3 stars
QBs_3_star <- subset(QBs, Stars == 3)
RBs_3_star <- subset(RBs, Stars == 3)
WRs_3_star <- subset(WRs, Stars == 3)

# 2 stars
QBs_2_star <- subset(QBs, Stars == 2)
RBs_2_star <- subset(RBs, Stars == 2)
WRs_2_star <- subset(WRs, Stars == 2)

# avg TD by star
avg_4_QB_TD_sd <- round(sum(QBs_4_star$sd_TD) / nrow(QBs_4_star), 2)
avg_3_QB_TD_sd <- round(sum(QBs_3_star$sd_TD) / nrow(QBs_3_star), 2)
avg_2_QB_TD_sd <- round(sum(QBs_2_star$sd_TD) / nrow(QBs_2_star), 2)

#avg Yards by star
avg_4_QB_Yards_sd <- round(sum(QBs_4_star$sd_Yards) / nrow(QBs_4_star), 2)
avg_3_QB_Yards_sd <- round(sum(QBs_3_star$sd_Yards) / nrow(QBs_3_star), 2)
avg_2_QB_Yards_sd <- round(sum(QBs_2_star$sd_Yards) / nrow(QBs_2_star), 2)

# avg TD by star
avg_4_RB_TD_sd <- round(sum(RBs_4_star$sd_TD) / nrow(RBs_4_star), 2)
avg_3_RB_TD_sd <- round(sum(RBs_3_star$sd_TD) / nrow(RBs_3_star), 2)
avg_2_RB_TD_sd <- round(sum(RBs_2_star$sd_TD) / nrow(RBs_2_star), 2)

#avg Yards by star
avg_4_RB_Yards_sd <- round(sum(RBs_4_star$sd_Yards) / nrow(RBs_4_star), 2)
avg_3_RB_Yards_sd <- round(sum(RBs_3_star$sd_Yards) / nrow(RBs_3_star), 2)
avg_2_RB_Yards_sd <- round(sum(RBs_2_star$sd_Yards) / nrow(RBs_2_star), 2)

# avg TD by star
avg_4_WR_TD_sd <- round(sum(WRs_4_star$sd_TD) / nrow(WRs_4_star), 2)
avg_3_WR_TD_sd <- round(sum(WRs_3_star$sd_TD) / nrow(WRs_3_star), 2)
avg_2_WR_TD_sd <- round(sum(WRs_2_star$sd_TD) / nrow(WRs_2_star), 2)

#avg Yards by star
avg_4_WR_Yards_sd <- round(sum(WRs_4_star$sd_Yards) / nrow(WRs_4_star), 2)
avg_3_WR_Yards_sd <- round(sum(WRs_3_star$sd_Yards) / nrow(WRs_3_star), 2)
avg_2_WR_Yards_sd <- round(sum(WRs_2_star$sd_Yards) / nrow(WRs_2_star), 2)




### MISCELLANEOUS ###

# POSITIONS BY REGION #

positions <- c("QBs", "RBs", "WRs")
regions <- c("West", "Midwest", "South", "Northeast")


West_3_stars <- subset(total, Stars == 3 & State %in% West)
Midwest_3_stars <- subset(total, Stars == 3 & State %in% Midwest)
South_3_stars <- subset(total, Stars == 3 & State %in% South)
Northeast_3_stars <- subset(total, Stars == 3 & State %in% Northeast)

three_stars_by_region <- c(West_3_stars, Midwest_3_stars, South_3_stars, 
                           Northeast_3_stars)



















#Data frames created to organize star rankings by position and yards,TDs

Star_QBStats=data.frame(QBs[,5:7])
Star_RBStats=data.frame(RBs[,5:7])
Star_WRStats=data.frame(WRs[,5:7])



## Histograms for Positions

##QB

Rank_Comparison_QBYards=
  ggplot(Star_QBStats, aes(Yards, fill = as.factor(Stars))) + 
  geom_histogram(alpha = 0.9, position = 'dodge') + 
  scale_fill_discrete(name="Stars") + 
  ggtitle('Count of QB College Yards Segmented by Star Ranking') + 
  scale_x_continuous(limits=c(0,4000))+scale_y_continuous(limits=c(0,12.5))



Rank_Comparison_QBTDs= 
  ggplot(Star_QBStats, aes(TD, fill = as.factor(Stars))) + 
  geom_histogram(alpha = 0.9, position = 'dodge') + 
  scale_fill_discrete(name="Stars") + 
  ggtitle('Count of QB College TDs Segmented by Star Ranking') + 
  scale_x_continuous(limits=c(0,36))+scale_y_continuous(limits=c(0,7))

##RB

Rank_Comparison_RBYards=
  ggplot(Star_RBStats, aes(Yards, fill = as.factor(Stars))) + 
  geom_histogram(alpha = 0.9, position = 'dodge') + 
  scale_fill_discrete(name="Stars") + 
  ggtitle('Count of RB College Yards Segmented by Star Ranking') + 
  scale_x_continuous(limits=c(0,1800))+scale_y_continuous(limits=c(0,8))

Rank_Comparison_RBTDs=ggplot(Star_RBStats, aes(TD, fill = as.factor(Stars))) + 
  geom_histogram(alpha = 0.9, position = 'dodge') + 
  scale_fill_discrete(name="Stars") + 
  ggtitle('Count of RB College TD Segmented by Star Ranking') + 
  scale_x_continuous(limits=c(0,17))+
  scale_y_continuous(limits=c(0,15))


## WR

Rank_Comparison_WRYards=
  ggplot(Star_WRStats, aes(Yards, fill = as.factor(Stars))) + 
  geom_histogram(alpha = 0.9, position = 'dodge') + 
  scale_fill_discrete(name="Stars") + 
  ggtitle('Count of WR College Yards Segmented by Star Ranking') + 
  scale_x_continuous(limits=c(0,1500))+scale_y_continuous(limits=c(0,15))

Rank_Comparison_WRTDs=ggplot(Star_WRStats, aes(TD, fill = as.factor(Stars))) + 
  geom_histogram(alpha = 0.9, position = 'dodge') + 
  scale_fill_discrete(name="Stars") + 
  ggtitle('Count of WR College TD Segmented by Star Ranking') + 
  scale_x_continuous(limits=c(0,15))+scale_y_continuous(limits=c(0,20))



## Boxplot Comparisons

QBYards_Boxplot_Comparison= 
  ggplot(QBs,aes(x=Stars, y=Yards,fill=as.factor(Stars))) + 
  ggtitle('Distribution of QB Yards - Separated by Star Ranking')+ 
  geom_boxplot() + scale_fill_discrete(name="Legend")+
  scale_x_continuous(limits=c(1,5))


QBTDs_Boxplot_Comparison= 
  ggplot(QBs,aes(x=Stars, y=TD,fill=as.factor(Stars))) + 
  ggtitle('Distribution of QB TDs - Separated by Star Ranking')+ 
  geom_boxplot() + scale_fill_discrete(name="Legend")+
  scale_x_continuous(limits=c(1,5))



## RB

RBYards_Boxplot_Comparison= 
  ggplot(RBs,aes(x=Stars, y=Yards,fill=as.factor(Stars))) + 
  ggtitle('Distribution of RB Yards - Separated by Star Ranking')+ 
  geom_boxplot() + scale_fill_discrete(name="Legend")+
  scale_x_continuous(limits=c(1,5.5))


RBTDs_Boxplot_Comparison= 
  ggplot(RBs,aes(x=Stars, y=TD,fill=as.factor(Stars))) + 
  ggtitle('Distribution of RB TDs - Separated by Star Ranking')+ 
  geom_boxplot() + 
  scale_fill_discrete(name="Legend")+scale_x_continuous(limits=c(1,5.5))


## WR 

WRYards_Boxplot_Comparison= 
  ggplot(WRs,aes(x=Stars, y=Yards,fill=as.factor(Stars))) + 
  ggtitle('Distribution of WR Yards - Separated by Star Ranking')+ 
  geom_boxplot() + scale_fill_discrete(name="Legend")+
  scale_x_continuous(limits=c(1,5.5))


WRTDs_Boxplot_Comparison= 
  ggplot(WRs,aes(x=Stars, y=TD,fill=as.factor(Stars))) + 
  ggtitle('Distribution of WR TDs - Separated by Star Ranking')+ 
  geom_boxplot() + scale_fill_discrete(name="Legend")+
  scale_x_continuous(limits=c(1,5.5))


##


