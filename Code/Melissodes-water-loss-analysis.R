# Melissodes Water Loss Analysis
# Maddie Ostwald
# June 26, 2023



#### Load libraries and read in data frame ####
library(ggplot2)
library(car) #for qqPlot()

setwd("~/Dropbox/UCSB/Projects/Melissodes desiccation resistance")
water.loss.df <- read.csv("Melissodes-water-loss-data.csv")
head(water.loss.df)



#### Organize data ####

# Google sheets set some variables as characters, so switch them to numeric
water.loss.df$Mass.loss.proportion <- as.numeric(water.loss.df$Mass.loss.proportion)
water.loss.df$Mass.loss..g. <- as.numeric(water.loss.df$Mass.loss..g.)
water.loss.df$Dry.mass..g. <- as.numeric(water.loss.df$Dry.mass..g.)

# Subset data
final.df <- subset(water.loss.df, All.bees.per.tube.survived.=="yes") #exclude tubes with any mortality
social.df <- subset(final.df, Treatment=="Paired")
solitary.df <- subset(final.df, Treatment=="Singleton")




#### Calculate summary statistics ####

# Calculate mean, std. error of proportional mass loss
social.mean.prop <- mean(social.df$Mass.loss.proportion) #0.04218734
solitary.mean.prop <- mean(solitary.df$Mass.loss.proportion) #0.05169748
social.se.prop <- sd(social.df$Mass.loss.proportion)/sqrt(28) #0.00043
solitary.se.prop <- sd(solitary.df$Mass.loss.proportion)/sqrt(31) #0.00036

# Calculate mean, std. error of absolute mass loss
social.mean.abs <- mean(social.df$Mass.loss..mg.) #1.892857
solitary.mean.abs <- mean(solitary.df$Mass.loss..mg.) #2.451613
social.se.abs <- sd(social.df$Mass.loss..mg.)/sqrt(28) #0.1806754
solitary.se.abs <- sd(solitary.df$Mass.loss..mg.)/sqrt(31) #0.1725128




#### Regression analysis ####

# Do social status, activity level, initial mass, and the interaction between social status and activity level influence the proportion of mass lost?
prop.water.loss.model <- lm(formula=Mass.loss.proportion ~ Initial.mass..g.+Prop..Active*Treatment, data=final.df)
summary(prop.water.loss.model) # evaluate model fit
Anova(prop.water.loss.model) # perform Type-II ANOVA

# Do social status, activity level, initial mass, and the interaction between social status and activity level influence the absolute mass lost?
absolute.water.loss.model <- lm(formula=Mass.loss..g. ~ Initial.mass..g.+Prop..Active*Treatment, data=final.df)
summary(absolute.water.loss.model)
Anova(absolute.water.loss.model) 




#### Check assumptions (normality and homoscedasticity) ####

qqPlot(residuals(prop.water.loss.model)) 
plot(fitted(prop.water.loss.model),residuals(prop.water.loss.model)) 

qqPlot(residuals(absolute.water.loss.model)) 
plot(fitted(absolute.water.loss.model),residuals(absolute.water.loss.model)) 





#### Plot data ####

# Change order of treatment levels on plots
final.df$Treatment <- factor(final.df$Treatment, levels=c("Singleton","Paired"))

#Violin plot: proportion data
ggplot(data=final.df, aes(x=Treatment, y=Mass.loss.proportion, fill=Treatment)) +
  scale_fill_brewer(palette="Blues")+
  geom_violin() +
  #geom_boxplot(width=0.1)+
  theme_classic()  + 
  labs(x="Social Condition",y="Proportion of Body Mass Lost",size=12)+
  theme(legend.position="none", axis.title=element_text(size=12), axis.text.x = element_text(color="black", size=12),axis.text.y = element_text(color="black", size=12))+
  stat_summary(fun.y=mean, geom="point", shape=16, size=2)+
  stat_summary(geom = "errorbar", fun.data = mean_se, width=0.1)
  #geom_jitter()

#Violin plot: absolute data
ggplot(data=final.df, aes(x=Treatment, y=Mass.loss..mg., fill=Treatment)) +
  scale_fill_brewer(palette="Blues")+
  geom_violin() +
  #geom_boxplot(width=0.1)+
  theme_classic()  + 
  labs(x="Social Condition",y="Body Mass Lost (mg)")+
  theme(legend.position="none", axis.title=element_text(size=12), axis.text.x = element_text(color="black", size=12),axis.text.y = element_text(color="black", size=12))+
  stat_summary(fun.y=mean, geom="point", shape=16, size=2)+
  stat_summary(geom = "errorbar", fun.data = mean_se, width=0.1)

