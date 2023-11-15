#' Load the smoking model
#' @description
#' This function loads the smoking model from the package
#'
#' @details
#' Use this function to load a plpModel that predicts whether a patient is currently a smoker or non-smoker
#' the value returned between 0 and 1 is the probability of being a smoker (1 = 100% and 0 = 0%).
#'
#'
#' @return
#' Returns a plpModel obect that can be used to apply the smoking model
#' to new plpData via the function PatientLevelPrediction::predictPlp
#'
#' @export
loadSmokingModel <- function(){
  modelLoc <-   system.file(
    "model/smoking",
    package = "SmokingModel"
  )
  
  model <- PatientLevelPrediction::loadPlpModel(modelLoc)
  
  return(model)
}