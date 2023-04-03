library(rstan)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)

burial_dat <- list(
  date_h_mean = -530,
  date_h_err = 15,
  date_a_mean = -490,
  date_a_err = 15,
  age_h_mean = 45,
  age_h_err = 10,
  age_a_mean = 30,
  age_a_err = 10,
  birth_age_min = 15,
  birth_age_max = 45,
  birth_date_a = -520,
  age_a = 20,
  birth_date_h = -580,
  age_h = 50,
  birth_date_m = -600
)

fit <- stan(file = 'model_full_sibs.stan', data = burial_dat)

posterior <- as.matrix(fit)
