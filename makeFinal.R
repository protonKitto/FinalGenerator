
library(tidyverse)

gender=c('M','F')
trmt = c('vaccine','placebo')
infctd = c('covid19','OK')
gays = c('gay','straight')
drugies = c('no','yes')
prty = c('DEM','REP')

trmtBad = c('vaccine','vaccine','vaccine','vaccine','vaccine','vaccine','placebo')

trmtGood = c('vaccine','placebo','placebo','placebo','placebo')

trmtMed = c('vaccine','placebo','placebo')

maleDF = data.frame(treatment=sample(trmt, size=15000, replace=T),
                     sex=rep('M',15000),
                     infected = rep('OK',15000),
                     LGBTQ=rep('straight', 15000),
                     DrugUser=rep('no', 15000),
                     party = sample(prty,size=15000, replace=T))

femaleDF =  data.frame(treatment=sample(trmt,size=15000, replace=T),
                       sex=rep('F',15000),
                       infected = rep('OK',15000),
                       LGBTQ=rep('straight', 15000),
                       DrugUser=rep('no', 15000),
                       party = sample(prty,size=15000, replace=T))

  
drugDF = data.frame(treatment=sample(trmt,size=3000, replace=T),
                    sex=sample(gender, size=3000, replace=T),
                    infected = rep('OK',3000),
                    LGBTQ=rep('straight', 3000),
                    DrugUser=rep('yes', 3000),
                    party = sample(prty,size=3000, replace=T))

lgbtDF = data.frame(treatment=sample(trmt,size=3000, replace=T),
                    sex=sample(gender, size=3000, replace=T),
                    infected = rep('OK',3000),
                    LGBTQ=rep('gay', 3000),
                    DrugUser=rep('no', 3000),
                    party = sample(prty,size=3000, replace=T))

iDrugDF = data.frame(treatment=sample(trmtBad,size=60, replace=T),
                    sex=sample(gender, size=60, replace=T),
                    infected = rep('covid19',60),
                    LGBTQ=rep('straight', 60),
                    DrugUser=rep('yes', 60),
                    party = sample(prty,size=60, replace=T))

iLgbtDF = data.frame(treatment=sample(trmtBad,size=60, replace=T),
                    sex=sample(gender, size=60, replace=T),
                    infected = rep('covid19',60),
                    LGBTQ=rep('gay', 60),
                    DrugUser=rep('no', 60),
                    party = sample(prty,size=60, replace=T))

iMaleDF = data.frame(treatment=sample(trmtGood,size=300, replace=T),
                    sex=rep('M',300),
                    infected = rep('covid19',300),
                    LGBTQ=rep('straight', 300),
                    DrugUser=rep('no', 300),
                    party = sample(prty,size=300, replace=T))

iFemaleDF =  data.frame(treatment=sample(trmtMed,size=300, replace=T),
                       sex=rep('F',300),
                       infected = rep('covid19',300),
                       LGBTQ=rep('straight', 300),
                       DrugUser=rep('no', 300),
                       party = sample(prty,size=300, replace=T))


finalCbind = rbind(maleDF, femaleDF,drugDF,lgbtDF,iMaleDF, 
                   iFemaleDF,iDrugDF,iLgbtDF)

finalCbind <- finalCbind %>%
  mutate(across(where(is.character), as.factor))

write.csv(finalCbind, file='finaltry3.csv')


