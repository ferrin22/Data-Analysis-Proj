#---
#title: "Data Analysis Functions"
#author: "Connor Gullstad"
#date: "December 8, 2015"
#---


#Contains all functions that I defined for the data analysis
#Sourced and called from DataAnalysis.R


# calculates averages based on the specific statistic and position
# Takes in the figure and position and outputs the mean
calculate_avg <- function(figure, position) {
  sum(figure) / nrow(position)
}


# sd_away function takes the mean, the standard deviation, and the player's actual stat,
# and outputs how many SDs above/below the mean they are, rounded to two decimals
sd_away <- function(mean, player_stat, stat_sd) {
  return(round((player_stat - mean) / stat_sd, 2))
}
