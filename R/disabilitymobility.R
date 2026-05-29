#' Disability mobility data
#'
#' A subset of data from the 2017 National Household Travel Survey
#'
#' @format
#' A data frame with 86,521 rows and 40 columns:
#' \describe{
#'   \item{Household_ID}{Household identifier}
#'   \item{Person_ID}{Person identifier}
#'   \item{Travel_disability}{How long does the respondent have a medical condition that makes it difficult to travel outside of home? 6_months_or_less_disability, More_than_6_months_of_disability, Lifelong_disability, No_disability}
#'   \item{Sex}{Sex. Male, Female}
#'   \item{Race}{Race. White, Black, Asian, American Indian, Hawaiian/Pacific Islander, Multiracial, Other}
#'   \item{Hispanic_ethnicity}{Hispanic or Latino origin. Hispanic, Non-Hispanic}
#'   \item{Nativity}{Born in United States. Yes, No}
#'   \item{Age}{Age. filtered to 18-61}
#'   \item{Education}{Educational attainment. Less than a high school graduate, High school graduate or GED, Some college or associates degree, Bachelor's degree, Graduate degree or professional degree}
#'   \item{Self_rated_health}{Opinion of health. Excellent, Very good, Good, Fair, Poor}
#'   \item{Employment_status}{Primary activity in previous week. Employed, Unemployed}
#'   \item{Household_income}{Household income. Under $10,000, $10,000 to $34,999, $35,000 to $74,999, $75,000 to $149,999, $150,000 and over}
#'   \item{Household_structure}{Count of household members. Lives alone, Does not live alone}
#'   \item{Population_density}{Category of population density (persons per square mile) in the census block group of the household's home location. 0-99, 100-499, 500-999, 1,000-1,999, 2,000-3,999, 4,000-9,999, 10,000-24,999, 25,000 and over}
#'   \item{Urban_rural}{Household in urban/rural area. Urban, Rural}
#'   \item{State}{Household state. 50 States and D.C.}
#'   \item{Driver_status}{Driver status. Drives, Does not drive}
#'   \item{Cane}{Does the respondent use a cane to aid their travel? TRUE, FALSE}
#'   \item{Manual_wheelchair}{Does the respondent use a manual wheelchair to aid their travel? TRUE, FALSE}
#'   \item{Crutches}{Does the respondent use a crutch to aid their travel? TRUE, FALSE}
#'   \item{Dog}{Does the respondent use a dog to aid their travel? TRUE, FALSE}
#'   \item{Motorized_wheelchair}{Does the respondent use a motorized wheelchair to aid their travel? TRUE, FALSE}
#'   \item{Scooter}{Does the respondent use a scooter to aid their travel? TRUE, FALSE}
#'   \item{White_cane}{Does the respondent use a white cane to aid their travel? TRUE, FALSE}
#'   \item{Walker}{Does the respondent use a walker to aid their travel? TRUE, FALSE}
#'   \item{Other_accommodation}{Does the respondent use any other accommodation rather than those listed? TRUE, FALSE}
#'   \item{Yearly_miles_personally_driven}{Miles personally drive in all vehicles. 0-200000}
#'   \item{Count_of_public_transit_usage}{Count of public transit usage in last month. 0-30}
#'   \item{Count_of_rideshare_app_usage}{Count of rideshare app usage in last month. 0-99}
#'   \item{Count_of_bike_trips}{Count of bike trips in past week. 0-99}
#'   \item{Count_of_walk_trips}{Count of walk trips in past week. 0-200}
#'   \item{Count_of_online_delivery}{Count of times purchased online for delivery in last 30 days. 0-99}
#'   \item{Shopping_trip}{Number of shopping trips on the respondent’s travel day. A travel day is a 24-hour day that starts at 4:00 a.m. (local time) of the assigned travel day and ends at 3:59 a.m. of the following day. The NHTS randomly assigns the travel days for one-seventh of the sample addresses to each day of the week and the remaining six-sevenths of the households to evenly across weekdays (Monday – Friday). The following variables are related to trip information on travel day.}
#'   \item{Social_recreational_trip}{Number of social/recreational trips on the respondent’s travel day}
#'   \item{Other_home_based_trip}{Number of other home-based trips on the respondent’s travel day}
#'   \item{Work_trip}{Number of work trips on the respondent’s travel day}
#'   \item{Other_non_home_based_trip}{Number of other non home-based trips on the respondent’s travel day}
#'   \item{Avg_num_of_people_on_trip}{Average number of people on the respondent’s trip including the respondent. 1-221}
#'   \item{Avg_trip_distance_in_miles}{Average trip distance in miles, including all modes of trips such as walk, bicycle, airplane, etc. 0-7685.53}
#'   \item{Avg_trip_duration_in_minutes}{Average trip duration in minutes, including all modes of trips such as walk, bicycle, airplane, etc. 0-1140.00}
#' }
#' @source <https://nhts.ornl.gov/>
NULL
