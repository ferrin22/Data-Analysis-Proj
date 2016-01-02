#---
#title: "Data Cleaning Functions"
#author: "Michael Ferrin"
#date: "December 8, 2015"
#---

#Contains all functions that I defined for the data cleaning
#Sourced and called from DataCleaning.R




#Clean State information by removing the city
#input: data frame
#output: data frame with cities removed from the state column
cleanState <- function(frame) {
  for (i in 1:nrow(frame)) {
    frame[i,3] <- gsub(".*,","",frame[i,3])
  }
  return(frame)
}



#Removes the word 'Stars' from Stars column
#input: data frame
#output: data frame e.g. '3' instead of '3 stars'
noStar <- function(frame) {
  for (i in 1:nrow(frame)) {
    frame[i,4] <- gsub("\\ .*","",frame[i,4])
  }
  return(frame)
}



#Removes duplicate players, as some players have 
#recieving and rushing data which needs to be consolidated.
#input: data frame
#output: data frame without any duplicate players
removeDuplicates <- function(frame) {
  duplicates = c()
  for (i in 2:nrow(frame)) {
    prev = (i - 1)
    prevYDS = frame[prev,5]
    prevTD = frame[prev,6]
    if (frame[i,1] == frame[prev,1]) {
      frame[i,5] <- frame[i,5] + frame[prev,5]
      frame[i,6] <- frame[i,6] + frame[prev,6]
      duplicates = c(duplicates, prev)
    }
  }
  for (i in length(duplicates):1) {
    frame <- frame[-(duplicates[i]), ]
  }
  rownames(frame) <- seq(length=nrow(frame))
  return(frame)
}



#Replaces jumbled state information with
#concise state names 
#input: data frame
#output: data frame with proper state column
getState <- function(frame) {
  for (i in 1:nrow(frame)) {
    if(startsWith(frame[i,3], ' Alabama')) {
      frame[i,3] <- 'Alabama'
    } else if (startsWith(frame[i,3], ' Alaska')) {
      frame[i,3] <- 'Alaska'
    } else if (startsWith(frame[i,3], ' Arizona')) {
      frame[i,3] <- 'Arizona'
    } else if (startsWith(frame[i,3], ' Arkansas')) {
      frame[i,3] <- 'Arkansas'
    } else if (startsWith(frame[i,3], ' California')) {
      frame[i,3] <- 'California'
    } else if (startsWith(frame[i,3], ' Colorado')) {
      frame[i,3] <- 'Colorado'
    } else if (startsWith(frame[i,3], ' Connecticut')) {
      frame[i,3] <- 'Connecticut'
    } else if (startsWith(frame[i,3], ' Delaware')) {
      frame[i,3] <- 'Delaware'
    } else if (startsWith(frame[i,3], ' Florida')) {
      frame[i,3] <- 'Florida'
    } else if (startsWith(frame[i,3], ' Georgia')) {
      frame[i,3] <- 'Georgia'
    } else if (startsWith(frame[i,3], ' Hawaii')) {
      frame[i,3] <- 'Hawaii'
    } else if (startsWith(frame[i,3], ' Idaho')) {
      frame[i,3] <- 'Idaho'
    } else if (startsWith(frame[i,3], ' Illinois')) {
      frame[i,3] <- 'Illinois'
    } else if (startsWith(frame[i,3], ' Indiana')) {
      frame[i,3] <- 'Indiana'
    } else if (startsWith(frame[i,3], ' Iowa')) {
      frame[i,3] <- 'Iowa'
    } else if (startsWith(frame[i,3], ' Kansas')) {
      frame[i,3] <- 'Kansas'
    } else if (startsWith(frame[i,3], ' Kentucky')) {
      frame[i,3] <- 'Kentucky'
    } else if (startsWith(frame[i,3], ' Louisiana')) {
      frame[i,3] <- 'Louisiana'
    } else if (startsWith(frame[i,3], ' Maine')) {
      frame[i,3] <- 'Maine'
    } else if (startsWith(frame[i,3], ' Maryland')) {
      frame[i,3] <- 'Maryland'
    } else if (startsWith(frame[i,3], ' Massachusetts')) {
      frame[i,3] <- 'Massachusetts'
    } else if (startsWith(frame[i,3], ' Michigan')) {
      frame[i,3] <- 'Michigan'
    } else if (startsWith(frame[i,3], ' Minnesota')) {
      frame[i,3] <- 'Minnesota'
    } else if (startsWith(frame[i,3], ' Mississippi')) {
      frame[i,3] <- 'Mississippi'
    } else if (startsWith(frame[i,3], ' Missouri')) {
      frame[i,3] <- 'Missouri'
    } else if (startsWith(frame[i,3], ' Montana')) {
      frame[i,3] <- 'Montana'
    } else if (startsWith(frame[i,3], ' Nebraska')) {
      frame[i,3] <- 'Nebraska'
    } else if (startsWith(frame[i,3], ' Nevada')) {
      frame[i,3] <- 'Nevada'
    } else if (startsWith(frame[i,3], ' New Hampshire')) {
      frame[i,3] <- 'New Hampshire'
    } else if (startsWith(frame[i,3], ' New Jersey')) {
      frame[i,3] <- 'New Jersey'
    } else if (startsWith(frame[i,3], ' New Mexico')) {
      frame[i,3] <- 'New Mexico'
    } else if (startsWith(frame[i,3], ' New York')) {
      frame[i,3] <- 'New York'
    } else if (startsWith(frame[i,3], ' North Carolina')) {
      frame[i,3] <- 'North Carolina'
    } else if (startsWith(frame[i,3], ' North Dakota')) {
      frame[i,3] <- 'North Dakota'
    } else if (startsWith(frame[i,3], ' Ohio')) {
      frame[i,3] <- 'Ohio'
    } else if (startsWith(frame[i,3], ' Oklahoma')) {
      frame[i,3] <- 'Oklahoma'
    } else if (startsWith(frame[i,3], ' Oregon')) {
      frame[i,3] <- 'Oregon'
    } else if (startsWith(frame[i,3], ' Pennsylvania')) {
      frame[i,3] <- 'Pennsylvania'
    } else if (startsWith(frame[i,3], ' Rhode Island')) {
      frame[i,3] <- 'Rhode Island'
    } else if (startsWith(frame[i,3], ' South Carolina')) {
      frame[i,3] <- 'South Carolina'
    } else if (startsWith(frame[i,3], ' South Dakota')) {
      frame[i,3] <- 'South Dakota'
    } else if (startsWith(frame[i,3], ' Tennessee')) {
      frame[i,3] <- 'Tennessee'
    } else if (startsWith(frame[i,3], ' Texas')) {
      frame[i,3] <- 'Texas'
    } else if (startsWith(frame[i,3], ' Utah')) {
      frame[i,3] <- 'Utah'
    } else if (startsWith(frame[i,3], ' Vermont')) {
      frame[i,3] <- 'Vermont'
    } else if (startsWith(frame[i,3], ' Virginia')) {
      frame[i,3] <- 'Virginia'
    } else if (startsWith(frame[i,3], ' Washington')) {
      frame[i,3] <- 'Washington'
    } else if (startsWith(frame[i,3], ' West Virginia')) {
      frame[i,3] <- 'West Virginia'
    } else if (startsWith(frame[i,3], ' Wisconsin')) {
      frame[i,3] <- 'Wisconsin'
    } else if (startsWith(frame[i,3], ' Wyoming')) {
      frame[i,3] <- 'Wyoming'
    }
  }
  return(frame)
}