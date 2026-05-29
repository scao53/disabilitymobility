#' Disability mobility data
#'
#' A subset of data from the 2017 national household travel survey.
#'
#' @format A data frame with 86521 rows and 40 columns
#' \describe{
#'   \item{Household_ID}{Household identifier.}
#'   \item{Person_ID}{Person identifier.}
#'   \item{Travel_disability}{How long does the respondent have a medical condition that makes it difficult to travel outside of home.}
#'   \item{Sex}{Sex.}
#'   \item{Race}{Race.}
#'   \item{Hispanic_ethnicity}{Hispanic or Latino origin.}
#'   \item{Nativity}{Born in United States.}
#'   \item{Age}{Age.}
#'   \item{Education}{Educational attainment.}
#'   \item{Self_rated_health}{Opinion of health.}
#'   \item{Employment_status}{Primary activity in previous week.}
#'   \item{Household_income}{Household income.}
#'   \item{Household_structure}{Count of household members.}
#'   \item{Population_density}{Category of population density, persons per square mile, in the census block group of the households home location.}
#'   \item{Urban_rural}{Household in urban or rural area.}
#'   \item{State}{Household state.}
#'   \item{Driver_status}{Driver status.}
#'   \item{Cane}{Does the respondent use a cane to aid their travel.}
#'   \item{Manual_wheelchair}{Does the respondent use a manual wheelchair to aid their travel.}
#'   \item{Crutches}{Does the respondent use a crutch to aid their travel.}
#'   \item{Dog}{Does the respondent use a dog to aid their travel.}
#'   \item{Motorized_wheelchair}{Does the respondent use a motorized wheelchair to aid their travel.}
#'   \item{Scooter}{Does the respondent use a scooter to aid their travel.}
#'   \item{White_cane}{Does the respondent use a white cane to aid their travel.}
#'   \item{Walker}{Does the respondent use a walker to aid their travel.}
#'   \item{Other_accommodation}{Does the respondent use any other accommodation rather than those listed.}
#'   \item{Yearly_miles_personally_driven}{Miles personally drive in all vehicles.}
#'   \item{Count_of_public_transit_usage}{Count of public transit usage in last month.}
#'   \item{Count_of_rideshare_app_usage}{Count of rideshare app usage in last month.}
#'   \item{Count_of_bike_trips}{Count of bike trips in past week.}
#'   \item{Count_of_walk_trips}{Count of walk trips in past week.}
#'   \item{Count_of_online_delivery}{Count of times purchased online for delivery in last 30 days.}
#'   \item{Avg_num_of_people_on_trip}{Average number of people on the respondents trip including the respondent.}
#'   \item{Avg_trip_distance_in_miles}{Average trip distance in miles.}
#'   \item{Avg_trip_duration_in_minutes}{Average trip duration in minutes.}
#'   \item{Shopping_trip}{Number of shopping trips on the respondents travel day. A travel day is a 24 hour day that starts at 4 am, local time, of the assigned travel day and ends at 359 am of the following day. The NHTS randomly assigns the travel days for one seventh of the sample addresses to each day of the week and the remaining six sevenths of the households to evenly across weekdays, Monday to Friday. The following variables are related to trip information on travel day.}
#'   \item{Social_recreational_trip}{Number of social or recreational trips on the respondents travel day.}
#'   \item{Other_home_based_trip}{Number of other homebased trips on the respondents travel day.}
#'   \item{Work_trip}{Number of work trips on the respondents travel day.}
#'   \item{Other_non_home_based_trip}{Number of other non homebased trips on the respondents travel day.}
#' }
#' @source <https://nhts.ornl.gov/>
"disabilitymobility"
