data {
  real date_h_mean;
  real date_h_err;
  real date_a_mean;
  real date_a_err;
  real<lower=0> age_h_mean;
  real<lower=0> age_h_err;
  real<lower=0> age_a_mean;
  real<lower=0> age_a_err;
  real<lower=0> birth_age_min;
  real<lower=0> birth_age_max;
}

transformed data {
  real<lower=0> birth_age_mean = (birth_age_min + birth_age_max) / 2.0;
  real<lower=0> birth_age_err  = (birth_age_max - birth_age_mean) / 3.0;
}

parameters {
  real birth_date_a; // date of birth of asperg
  real<lower=0> age_a; // age of asperg
  real birth_date_h; // date of borth of hochdorf
  real<lower=0> age_h; // age of hochdorf
  real birth_date_m; // date of birth of the mother
}

transformed parameters {
  real birth_age_mother_h = birth_date_h - birth_date_m;
  real birth_age_mother_a = birth_date_a - birth_date_m;
}

model {
  age_a ~ normal(age_a_mean, age_a_err);
  age_h ~ normal(age_h_mean, age_h_err);
  birth_date_a + age_a ~ normal(date_a_mean, date_a_err);
  birth_date_h + age_h ~ normal(date_h_mean, date_h_err);
  birth_age_mother_a ~ normal(birth_age_mean, birth_age_err);
  birth_age_mother_h ~ normal(birth_age_mean, birth_age_err);
}
