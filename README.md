# SmokingModel
Users can download the smoking models previously published and apply it to data mapped to OMOP

```{r}
# install this package to get the smoking model
remotes::install_github('ohdsi-studies/SmokingModel')

# Extract data you want to make the prediction for
# in this example we use simulated data
library(PatientLevelPrediction)
data(
  plpDataSimulationProfile, 
  envir = environment()
  )

sampleSize <- 1500+sample(300,1)
plpData <- simulatePlpData(
  plpDataSimulationProfile, 
  n = sampleSize
  )

# load the smoking model
library(SmokingModel)
smokingRiskModel <- SmokingModel::loadSmokingModel()

# apply the model to new data
pred <- PatientLevelPrediction::predictPlp(
   plpModel = plpModel, 
   plpData = plpData, 
   population = plpData$cohorts
     )
     
# pred is a data.frame consiting of the plpData$cohorts
# with a new column called 'value' that corresponds to the 
# risk that the patient is a current smoker (0 = 0% and 1 = 100%)

```
