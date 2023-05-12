parameters {
  real                burial_h;
  real                burial_a;
  real<lower=0>       age_h;
  real<lower=0>       age_a;
  real<lower=14.3744> age_m_h;
  real<lower=14.3744> age_m_a;
  real<lower=14.3744> age_m2_h;
}

transformed parameters {
   real                birth_date_grandmother = burial_h - age_h - age_m_h - age_m2_h;
   real<lower=14.3744> age_m2_a               = burial_a - age_a - age_m_a - birth_date_grandmother;
}

model {
  burial_h ~ normal(-530, 6);
  burial_a ~ normal(-490, 6);
  age_h    ~ normal( 45,  6);
  age_a    ~ normal( 30,  6);
  # This is tuned so that the mean is 23.2 and the 99% goes from 15 to 45
  age_m_h - 14.3744 ~ gamma(2.31385, 0.262176);
  age_m_a - 14.3744 ~ gamma(2.31385, 0.262176);
  age_m2_h - 14.3744 ~ gamma(2.31385, 0.262176);
  age_m2_a - 14.3744 ~ gamma(2.31385, 0.262176);
}