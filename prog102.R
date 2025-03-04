library(marinecs100b)


# Writing a utility function ----------------------------------------------

# P1: How did you extract the temperature and exposure from the hottest day?
# Copy-paste the code here.
# We extracted the temperature by plotting the plot_kefj command
hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-04 00:00", tz = "Etc/GMT+8")
hotday_idx <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# P2: Fill in the blanks below to write the Alaskan datetime utility function.
alaskan_datetime <- function(start_time) {
  hotday_start <- as.POSIXct(start_time, tz = "Etc/GMT+8")
    return(hotday_start)
}
alaskan_datetime("2018-07-03 00:00")
# Extracting data ---------------------------------------------------------

# P3: Make a copy of your code from P1 and edit it to plot the temperature and
# exposure for "Aialik" on 2012-06-01
Aialik_datetime <- kefj_datetime[kefj_site == "Aialik"]

Aialik_interval <- Aialik_datetime[2:(length(Aialik_datetime))] - Aialik_datetime[1:(length(Aialik_datetime)-1)]
table(Aialik_interval)

site <- "Aialik"
start <- as.POSIXct("2012-06-01 00:00", tz = "Etc/GMT+8")
end <- as.POSIXct("2012-06-01 23:59", tz = "Etc/GMT+8")
day_idx <- kefj_site == site &
  kefj_datetime >= start &
  kefj_datetime <= end
day_datetime <- kefj_datetime[day_idx]
day_temperature <- kefj_temperature[day_idx]
day_exposure <- kefj_exposure[day_idx]
plot_kefj(day_datetime, day_temperature, day_exposure)

# P4: Make a copy of your code from P3 and edit it to plot the temperature and
# exposure for "Harris" on 2016-04-05.

site <- "Harris"
start <- as.POSIXct("2016-04-05 00:00", tz = "Etc/GMT+8")
end <- as.POSIXct("2016-04-05 23:59", tz = "Etc/GMT+8")
day_idx <- kefj_site == site &
  kefj_datetime >= start &
  kefj_datetime <= end
day_datetime <- kefj_datetime[day_idx]
day_temperature <- kefj_temperature[day_idx]
day_exposure <- kefj_exposure[day_idx]
plot_kefj(day_datetime, day_temperature, day_exposure)

# P5: Compare your solutions for P3 and P4 - what variables changed?
#the date and the site changed
# P6: What you would pick for the temperature extraction function and
# parameters' names?
# Function name: extract_temp , parameter names: site, start, end

# Writing extraction functions --------------------------------------------

# P7: Fill in the blanks in the code below to write your temperature extraction
# function.

extract_temp <- function(site, start, end) {
  start_alaska <- alaskan_datetime(start)
  end_alaska <- alaskan_datetime(end)
  extract_idx <- kefj_site == site &
   kefj_datetime >= start_alaska &
   kefj_datetime <= end_alaska
 result <- kefj_temperature[extract_idx]
 return(result)
}
extract_temp("Harris", "2016-04-05 00:00", "2016-04-05 23:59")

#filter datetime_object by time and site
# P8: Make a copy of your solution to P7, and edit it to create exposure and
# datetime extraction functions.

extract_date <- function(site, start, end) {
  start_alaska <- alaskan_datetime(start)
  end_alaska <- alaskan_datetime(end)
  extract_idx <- kefj_site == site &
    kefj_datetime >= start_alaska &
    kefj_datetime <= end_alaska
  result <- kefj_datetime[extract_idx]
  return(result)
}
extract_date("Harris", "2016-04-05 00:00", "2016-04-05 23:59")


extract_exposure <- function(site, start, end) {
  start_alaska <- alaskan_datetime(start)
  end_alaska <- alaskan_datetime(end)
  extract_idx <- kefj_site == site &
    kefj_datetime >= start_alaska &
    kefj_datetime <= end_alaska
  result <- kefj_exposure[extract_idx]
  return(result)
}
extract_exposure("Harris", "2016-04-05 00:00", "2016-04-05 23:59")

# P9: Export your annotated screenshot as a JPEG called "annotated_function.jpg"
# and add it to your copy of the module repository. (It should be in the same
# folder as this file.)

# P10: Visualize Nuka Pass on July 1, 2018.
plot_kefj(extract_date("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"),
          extract_temp("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"),
          extract_exposure("Nuka_Pass","2018-07-01 00:00", "2018-07-01 23:59"))

# P11: Save a copy of the Nuka Pass plot as "nuka_pass_2018-07-01.png" in this
# repo

# P12: Compare the code you wrote to create the plot in this module to the code
# you wrote in PROG101. Qualitatively, how do they compare? Which one is easier
# to read and why?
# I saw in prog101 the values were more difficult to read and analyse. Prog102 is
#easier to read because data is more organized and has better labels for the
#graphs
