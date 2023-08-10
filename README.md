# Social conditions facilitate water conservation in a solitary bee
[Madeleine M. Ostwald](https://orcid.org/0000-0002-9869-8835), Valentina A. Venegas, & [Katja C. Seltmann](https://orcid.org/0000-0001-5354-6048)

In prep

Please contact Madeleine Ostwald for questions regarding the code or data (ostwald.madeleine@gmail.com)

# Abstract
Climatic stressors are important drivers in the evolution of social behavior. Social animals tend to thrive in harsh and unpredictable environments, yet the mechanisms underlying social advantages in these contexts are often unclear. Here, we explore water conservation in forced associations of a solitary bee to test the hypothesis that grouping can generate synergistic physiological benefits in an incipient social context. Paired bees displayed mutual tolerance and experienced reduced water loss relative to singleton bees when exposed to acute low humidity stress. Social advantages such as these can facilitate the evolution of cooperation among non-relatives and offer important insights into the social consequences of climate change.

# Repository Directory
## Code: Contains code for data analysis in R
R file: In this document, we analyze predictors of water loss in _Melissodes tepidus timberlakei_ females, including: social condition, initial mass, activity level, and the interaction between social condition and activity level.

## Data: Contains the raw water loss data
.csv file: In this document, we present the raw data collected in the water loss assays. The column headings should be interpreted as follows:
Date = The date of collection
ID = A unique ID number given to each specimen
Treatment = Assignment to either a paired or singleton condition
Tube ID = A unique ID character given to each low humidity chamber/falcon tube
Initial mass (g) = The mass of the bee prior to the water loss assay
Final mass (g) = The mass of the bee immediately following the water loss assay
Dry mass (g) = The mass of the bee after drying (only applicable for 6 bees)
Mass loss (g) = initial mass - final mass
Mass loss (mg) = (initial mass - final mass) * 1000
Mass loss proportion = (initial mass - final mass) / initial mass
Survived assay? = Whether the bee survived until the end of the assay (yes/no)
All bees per tube survived? = Whether both bees per treatment tube survived (yes/no). If at least one bee per tube died, the entire tube was excluded from analysis.
Columns S1 through S9 = Results of each of the nine behavioral scan samples. I indicates idle, W indicates walking/climing, SG indicates self grooming.
Prop. Active = The proportion of all 9 scan samples per bee in which the bee was active (W)
