## code to prepare `disabilitymobility` dataset goes here

library(tidyverse)
trip <- read_csv("~/DisabilityInclusionAnalyticsLab/data_sources/national_household_travel_survey/trippub.csv")

per <- read_csv("~/DisabilityInclusionAnalyticsLab/data_sources/national_household_travel_survey/perpub.csv")

hh <- read_csv("~/DisabilityInclusionAnalyticsLab/data_sources/national_household_travel_survey/hhpub.csv")

trip_selected <- trip |>
  dplyr::select(HOUSEID,
                PERSONID,
                TRIPPURP, # Generalized purpose of trip, home-based and non-home based
                GASPRICE, # Price of gasoline, in cents, on respondent's travel day
                NUMONTRP, # Number of people on trip including respondent
                TRPACCMP, # Count of People on Trip
                TRPMILAD, # Trip distance in miles, adjusted for comparability to past
                TRPMILES, # Trip distance in miles, derived from route geometry returned
                TRVLCMIN, # Trip Duration in Minutes
                VMT_MILE) |>  # Trip distance in miles for personally driven vehicle trips
  #filter(TRIPPURP != -9) |>
  filter(NUMONTRP != -9 & TRPMILES != -9 & TRVLCMIN != -9) |>
  group_by(HOUSEID, PERSONID, TRIPPURP) |>
  dplyr::summarize(Avg_num_of_people = round(mean(NUMONTRP), digits = 0),
                   Avg_trip_distance = round(mean(TRPMILES), digits = 2),
                   Avg_trip_duration = round(mean(TRVLCMIN), digits = 2)) |>
  mutate(TRIPPURP = case_when(TRIPPURP == "HBSHOP" ~ "Shopping_trip",
                              TRIPPURP == "HBO" ~ "Other_home_based_trip",
                              TRIPPURP == "HBSOCREC" ~ "Social_recreational_trip",
                              TRIPPURP == "HBW" ~ "Work_trip",
                              TRIPPURP == "NHB" ~ "Other_non_home_based_trip")) |>
  filter(TRIPPURP != "-9")

per_selected <- per |>
  dplyr::select(HOUSEID, # Household ID
                PERSONID, # Person ID
                MEDCOND, # Medical condition
                MEDCOND6, # Medical condition, how long
                R_SEX_IMP, # Gender (imputed)
                R_AGE_IMP, # Age (imputed)
                R_RACE, # Race
                R_HISP, # Hispanic or not
                BORNINUS, # Born in United States
                PRMACT, # Primary activity in previous week
                HEALTH, # Opinion of health
                HHFAMINC, # Household income
                HBPPOPDN, # Category of population density (persons per square mile) in the census block group of the household's home location
                HHSIZE, # Count of household members
                NBIKETRP, # Count of bike trips
                NWALKTRP, # Count of walk trips
                RIDESHARE, # Count of rideshare app usage
                DRIVER, # Driver status, derived
                W_CANE, # Medical device used: Cane
                W_CHAIR, # Medical device used: Wheelchair
                W_CRUTCH, # Medical device used: Crutches
                W_DOG, # Medical device used: Dog assistance
                W_MTRCHR, # Medical device used: Motorized wheelchair
                W_SCOOTR, # Medical device used: Motorized scooter
                W_WHCANE, # Medical device used: White cane
                W_WLKR, # Medical device used: Walker
                W_NONE, # Medical device used: None
                YEARMILE, # Miles personally driven in all vehicles
                PTUSED, # Count of public transit usage
                #NOCONG, # Trip time in minutes to work without traffic
                DELIVER, # Count of times purchased online for delivery in last 30 days
                #CONDNIGH, CONDPUB, CONDRIVE, CONDSPEC, CONDTRAV, CONDTAX, CONDRIDE
                CNTTDTR, # Count of person trips on travel day
                URBRUR, # Household in urban/rural area
                EDUC, # Educational attainment
                HHSTATE # State
  ) |>
  filter(YEARMILE >= -1) |> # filter to YEARMILE >= -1
  filter(PTUSED >= 0) |>
  filter(DELIVER >= -1) |>
  filter(NBIKETRP >= 0) |>
  filter(NWALKTRP >= 0) |>
  filter(RIDESHARE >= -1) |>
  filter(MEDCOND == "01" | MEDCOND == "02") |> # filter to Medical condition Yes "01" and No "02"
  filter(MEDCOND6 == "01" | MEDCOND6 == "02" | MEDCOND6 == "03" | MEDCOND6 == "-1") |> # filter to Medical condition duration 6_months_or_less "01", More_than_6_months "02", Lifelong "03", and No_disability "-1"
  filter(R_AGE_IMP >= 18 & R_AGE_IMP <= 61) |>
  filter(R_RACE != "-8" & R_RACE != "-7") |>
  filter(R_HISP != "-8" & R_HISP != "-7") |>
  filter(BORNINUS != "-9" & BORNINUS != "-8" & BORNINUS != "-7") |>
  filter(PRMACT != "-8" & PRMACT != "-7" & PRMACT != "-1") |>
  filter(HEALTH != "-9" & HEALTH != "-8" & HEALTH != "-7") |>
  filter(HHFAMINC != "-9" & HHFAMINC != "-8" & HHFAMINC != "-7") |>
  filter(HBPPOPDN != -9) |>
  filter(DRIVER != "-1") |>
  filter(EDUC != "-8" & EDUC != "-7") |>
  mutate(W_CANE = case_when(W_CANE == "01" ~ "True",
                            TRUE ~ "False")) |>
  mutate(W_CHAIR = case_when(W_CHAIR == "07" ~ "True",
                             TRUE ~ "False")) |>
  mutate(W_CRUTCH = case_when(W_CRUTCH == "05" ~ "True",
                              TRUE ~ "False")) |>
  mutate(W_DOG = case_when(W_DOG == 4 ~ "True",
                           TRUE ~ "False")) |>
  mutate(W_MTRCHR = case_when(W_MTRCHR == "08" ~ "True",
                              TRUE ~ "False")) |>
  mutate(W_SCOOTR = case_when(W_SCOOTR == "06" ~ "True",
                              TRUE ~ "False")) |>
  mutate(W_WHCANE = case_when(W_WHCANE == "03" ~ "True",
                              TRUE ~ "False")) |>
  mutate(W_WLKR = case_when(W_WLKR == "02" ~ "True",
                            TRUE ~ "False")) |>
  mutate(W_NONE = case_when(W_NONE == 0 ~ "True",
                            TRUE ~ "False")) |>
  mutate(MEDCOND6 = case_when(MEDCOND6 == "01" ~ "6_months_or_less_disability",
                              MEDCOND6 == "02" ~ "More_than_6_months_of_disability",
                              MEDCOND6 == "03" ~ "Lifelong_disability",
                              TRUE ~ "No_disability")) |>
  #mutate(CONDNIGH = case_when(CONDNIGH == "01" ~ 1,
  #TRUE ~ 0)) |>
  #mutate(CONDPUB = case_when(CONDPUB == "01" ~ 1,
  #TRUE ~ 0)) |>
  #mutate(CONDRIVE = case_when(CONDRIVE == "01" ~ 1,
  #TRUE ~ 0)) |>
  #mutate(CONDSPEC = case_when(CONDSPEC == "01" ~ 1,
  #TRUE ~ 0)) |>
  #mutate(CONDTRAV = case_when(CONDTRAV == "01" ~ 1,
  #TRUE ~ 0)) |>
  #mutate(CONDTAX = case_when(CONDTAX == "01" ~ 1,
  #TRUE ~ 0)) |>
  #mutate(CONDRIDE = case_when(CONDRIDE == "01" ~ 1,
  #TRUE ~ 0)) |>
  mutate(R_SEX_IMP = case_when(R_SEX_IMP == "01" ~ "Male",
                               R_SEX_IMP == "02" ~ "Female")) |>
  mutate(R_RACE = case_when(R_RACE == "01" ~ "White",
                            R_RACE == "02" ~ "Black",
                            R_RACE == "03" ~ "Asian",
                            R_RACE == "04" ~ "American Indian",
                            R_RACE == "05" ~ "Hawaiian/Pacific Islander",
                            R_RACE == "06" ~ "Multiracial",
                            TRUE ~ "Other")) |>
  mutate(R_HISP = case_when(R_HISP == "01" ~ "Hispanic",
                            R_HISP == "02" ~ "Non-Hispanic")) |>
  mutate(PRMACT = case_when(PRMACT %in% c("01", "02") ~ "Employed",
                            TRUE ~ "Unemployed")) |>
  mutate(HEALTH = case_when(HEALTH == "01" ~ "Excellent",
                            HEALTH == "02" ~ "Very good",
                            HEALTH == "03" ~ "Good",
                            HEALTH == "04" ~ "Fair",
                            HEALTH == "05" ~ "Poor")) |>
  mutate(HHFAMINC = case_when(HHFAMINC == "01" ~ "Under $10,000",
                              HHFAMINC %in% c("02", "03", "04") ~ "$10,000 to $34,999",
                              HHFAMINC %in% c("05", "06") ~ "$35,000 to $74,999",
                              HHFAMINC %in% c("07", "08", "09") ~ "$75,000 to $149,999",
                              HHFAMINC %in% c("10", "11") ~ "$150,000 and over")) |>
  mutate(HBPPOPDN = case_when(HBPPOPDN == 50 ~ "0-99",
                              HBPPOPDN == 300 ~ "100-499",
                              HBPPOPDN == 750 ~ "500-999",
                              HBPPOPDN == 1500 ~ "1,000-1,999",
                              HBPPOPDN == 3000 ~ "2,000-3,999",
                              HBPPOPDN == 7000 ~ "4,000-9,999",
                              HBPPOPDN == 17000 ~ "10,000-24,999",
                              HBPPOPDN == 30000 ~ "25,000 and over")) |>
  mutate(DRIVER = case_when(DRIVER == "01" ~ "Drives",
                            TRUE ~ "Does not drive")) |>
  mutate(HHSIZE = case_when(HHSIZE == 1 ~ "Lives alone",
                            TRUE ~ "Does not live alone")) |>
  mutate(YEARMILE = case_when(YEARMILE == -1 ~ 0,
                              TRUE ~ YEARMILE)) |>
  mutate(DELIVER = case_when(DELIVER == -1 ~ 0,
                             TRUE ~ DELIVER)) |>
  mutate(RIDESHARE = case_when(RIDESHARE == -1 ~ 0,
                               TRUE ~ RIDESHARE)) |>
  mutate(URBRUR = case_when(URBRUR == "01" ~ "Urban",
                            TRUE ~ "Rural")) |>
  mutate(EDUC = case_when(EDUC == "01" ~ "Less than a high school graduate",
                          EDUC == "02" ~ "High school graduate or GED",
                          EDUC == "03" ~ "Some college or associates degree",
                          EDUC == "04" ~ "Bachelor's degree",
                          EDUC == "05" ~ "Graduate degree or professional degree"))

per_selected_join <- per_selected |>
  #left_join(hh_selected, by = c("HOUSEID" = "HOUSEID"))
  inner_join(trip_selected, by = c("HOUSEID" = "HOUSEID", "PERSONID" = "PERSONID")) |>
  filter(if_any(c(Avg_num_of_people:Avg_trip_duration), ~ !is.na(.)))

#per_selected_join[is.na(per_selected_join)] = 0

per_selected_join_rename <- per_selected_join |>
  rename(Household_ID = HOUSEID,
         Person_ID = PERSONID,
         Travel_disability = MEDCOND6,
         Sex = R_SEX_IMP,
         Race = R_RACE,
         Hispanic_ethnicity = R_HISP,
         Nativity = BORNINUS,
         Age = R_AGE_IMP,
         Education = EDUC,
         Employment_status = PRMACT,
         Self_rated_health = HEALTH,
         Household_income = HHFAMINC,
         Household_structure = HHSIZE,
         Population_density = HBPPOPDN,
         Driver_status = DRIVER,
         Yearly_miles_personally_driven = YEARMILE, # Miles personally driven in all vehicles
         Count_of_public_transit_usage = PTUSED, # Count of public transit usage
         Count_of_rideshare_app_usage = RIDESHARE,
         Count_of_bike_trips = NBIKETRP,
         Count_of_walk_trips = NWALKTRP,
         Cane = W_CANE, # Medical device used: Cane
         Manual_wheelchair = W_CHAIR, # Medical device used: Wheelchair
         Crutches = W_CRUTCH, # Medical device used: Crutches
         Dog = W_DOG, # Medical device used: Dog assistance
         Motorized_wheelchair = W_MTRCHR, # Medical device used: Motorized wheelchair
         Scooter = W_SCOOTR, # Medical device used: Motorized scooter
         White_cane = W_WHCANE, # Medical device used: White cane
         Walker = W_WLKR, # Medical device used: Walker
         No_accommodation = W_NONE, # Medical device used: None
         #NOCONG # Trip time in minutes to work without traffic
         Count_of_online_delivery = DELIVER, # Count of times purchased online for delivery in last 30 days
         Avg_num_of_people_on_trip = Avg_num_of_people,
         Avg_trip_distance_in_miles = Avg_trip_distance,
         Avg_trip_duration_in_minutes = Avg_trip_duration,
         Trip_purpose = TRIPPURP,
         Number_of_person_trips_on_travel_day = CNTTDTR,
         Urban_rural = URBRUR,
         State = HHSTATE
  ) |>
  dplyr::select(-MEDCOND)

per_selected_join_wider <- per_selected_join_rename |>
  pivot_wider(names_from = "Trip_purpose",
              values_from = "Number_of_person_trips_on_travel_day")
per_selected_join_wider[is.na(per_selected_join_wider)] <- 0
per_selected_join_final <- per_selected_join_wider |>
  group_by(Household_ID, Person_ID, Travel_disability, Sex, Race, Hispanic_ethnicity, Nativity, Age, Education, Self_rated_health, Employment_status, Household_income, Household_structure, Population_density, Urban_rural, State, Driver_status, Cane, Manual_wheelchair, Crutches, Dog, Motorized_wheelchair, Scooter, White_cane, Walker, No_accommodation) |>
  dplyr::summarize(Yearly_miles_personally_driven = sum(Yearly_miles_personally_driven),
                   Count_of_public_transit_usage = sum(Count_of_public_transit_usage),
                   Count_of_rideshare_app_usage = sum(Count_of_rideshare_app_usage),
                   Count_of_bike_trips = sum(Count_of_bike_trips),
                   Count_of_walk_trips = sum(Count_of_walk_trips),
                   Count_of_online_delivery = sum(Count_of_online_delivery),
                   Avg_num_of_people_on_trip = sum(Avg_num_of_people_on_trip),
                   Avg_trip_distance_in_miles = sum(Avg_trip_distance_in_miles),
                   Avg_trip_duration_in_minutes = sum(Avg_trip_duration_in_minutes),
                   Other_home_based_trip = sum(Other_home_based_trip),
                   Work_trip = sum(Work_trip),
                   Social_recreational_trip = sum(Social_recreational_trip),
                   Other_non_home_based_trip = sum(Other_non_home_based_trip),
                   Shopping_trip = sum(Shopping_trip)
  )

col_order <- c("Household_ID", "Person_ID", "Travel_disability", "Sex", "Race", "Hispanic_ethnicity", "Nativity", "Age", "Education", "Self_rated_health", "Employment_status", "Household_income", "Household_structure", "Population_density", "Urban_rural", "State", "Driver_status", "Cane", "Manual_wheelchair", "Crutches", "Dog", "Motorized_wheelchair", "Scooter", "White_cane", "Walker", "No_accommodation", "Yearly_miles_personally_driven", "Count_of_public_transit_usage", "Count_of_rideshare_app_usage", "Count_of_bike_trips", "Count_of_walk_trips", "Count_of_online_delivery", "Avg_num_of_people_on_trip", "Avg_trip_distance_in_miles", "Avg_trip_duration_in_minutes", "Shopping_trip", "Social_recreational_trip", "Other_home_based_trip", "Work_trip", "Other_non_home_based_trip")

per_selected_join_final_order <- per_selected_join_final[, col_order]

save(per_selected_join_final_order, file = "datasets/disability_mobility.rda")

usethis::use_data(disability_mobility, overwrite = TRUE)
