install.packages(c("readxl", "writexl", "httr", "jsonlite", "dplyr", "purrr"))
yes
library(readxl)
library(writexl)
library(httr)
library(jsonlite)
library(dplyr)
library(purrr)

#Loading file
spvmdata <- read_excel(file.choose())

#Defining reverse geocoding function
reverse_geocode_osm <- function(Latitude, Longitude){
  base_url <- "https://nominatim.openstreetmap.org/reverse"
  tryCatch({
    res <- GET(url = base_url,
               query = list(Latitude = Latitude,
                            Longitude = Longitude,
                            format = "jsonv2",
                            addressdetails =1),
               user_agent("R_bulk_reverse_geocoder"))
    if(status_code(res) == 200){
      data <- fromJSON(content(res, as = "text", encoding = "UTF-8"))
      return(data$display_name)
    } else{
      return(NA)
    }
  }, error = function(e){
    return(NA)
  })
}

#Applying reverse geocoding (with rate limiting)
spvmdata$address <- NA

for(i in seq_len(nrow(spvmdata))){
  cat("Processing row", i, "of", nrow(df), "...\n")
  spvmdata$address[i] <- reverse_geocode_osm(spvmdata$Latitude[i],
                                             spvmdata$Longitude[i])
  Sys.sleep(1) #respect Nominatim's rate limit
}
