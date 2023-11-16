Supplementing claims data analysis using self-reported data to develop a probabilistic phenotype model for current smoking status
=============

<img src="https://img.shields.io/badge/Study%20Status-Complete-orange.svg" alt="Study Status: Complete"> 

- Analytics use case(s): **Patient-Level Prediction**
- Study type: **Clinical Application**
- Tags: **-**
- Study lead: **Jenna Reps**
- Study lead forums tag: **[jreps](https://forums.ohdsi.org/u/jreps)**
- Study start date: **Jan 1, 2018**
- Study end date: **Dec 1, 2018**
- Protocol: **-**
- Publications: **[Paper](https://doi.org/10.1016/j.jbi.2019.103264)**
- Results explorer: **[Shiny App](https://data.ohdsi.org/smokingPhenotypeExplorer/)**

This package contains the smoking risk model - what is the risk the patient is a current smoker vs non-smoker?


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
   plpModel = smokingRiskModel, 
   plpData = plpData, 
   population = plpData$cohorts
     )
     
# pred is a data.frame consiting of the plpData$cohorts
# with a new column called 'value' that corresponds to the 
# risk that the patient is a current smoker (0 = 0% and 1 = 100%)

```
