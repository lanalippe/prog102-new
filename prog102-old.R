library(marinecs100b)

# Extracting data ---------------------------------------------------------

# How did you extract the temperature and exposure from the hottest day?
# We extracted the temperature by plotting the plot_kefj command
# Copy-paste the code here.
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

# If you want to change the site and date, what variables would need to change?
#Add in a new variable for kefj_site and change the date parameters.

# What would you pick for the temperature extraction function name and parameter
# names?
Harris_datetime <- kefj_datetime[kefj_site == "Harris"]

Harris_interval <- Harris_datetime[2:(length(Harris_datetime))] - Harris_datetime[1:(length(Harris_datetime)-1)]
table(Harris_interval)


# Writing extraction functions --------------------------------------------

# Write your temperature extraction function here

# Write your exposure extraction function here

# Write your datetime extraction function here

# Visualize Nuka Pass temperatures on 2018-07-01

# How does the visualization code above compare to what you wrote in PROG101?


# Functions within functions (optional) -----------------------------------

# How would you parameterize the visualization code into its own function?
# Specifically, what would you call that function and its parameters?

# Write your wrapper function for plot_kefj(). Call it to compare the
# visualizations for Nuka Pass on July 1, 2018 versus January 1, 2018.
