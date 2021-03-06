library(ggfortify)
library(tidyverse)

mod1 <- lm(mpg ~wt, data = mtcars)
summary(mod1)

# 1. the regression model is linear in parameters

mtcars %>%
  ggplot(., aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth()

mtcars %>%
  ggplot(., aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = lm, forumla = y ~ poly(x, 2))


# 2. the mean of residuals is zero
# check model summary and test manually
# mean(mod1$residuals)

summary(mod1)
mean(mod1$residuals)

# 3. homoskedasticity of residuals or equal variance
# left side plots

autoplot(mod1, which = c(1,3))

# 4. no autocorrelation of residuals

acf(mod1$residuals) #visual inspection
lmtest::dwtest(mod1) #formal test: durbin-watson test

# 6. Normality of residuals
autoplot(mod1, which = 2)

autoplot(mod1)







