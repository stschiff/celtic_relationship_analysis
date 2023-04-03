data {         
  real          burial_date_hochdorf_mean;
  real          burial_date_hochdorf_err;
  real          burial_date_asperg_mean;
  real          burial_date_asperg_err;
  real<lower=0> age_hochdorf_mean;
  real<lower=0> age_hochdorf_err;
  real<lower=0> age_asperg_mean;
  real<lower=0> age_asperg_err;
  real<lower=0> mother_dist_mean;
  real<lower=0> mother_dist_err;
}

parameters {
  real          birth_date_mother;
  real<lower=0> mother_age_hochdorf;
  real<lower=0> mother_age_sister;
  real<lower=0> sister_age_asperg;
  real<lower=0> age_hochdorf;
  real<lower=0> age_asperg;
}

transformed parameters {
  real burial_date_hochdorf = birth_date_mother + mother_age_hochdorf + age_hochdorf;
  real burial_date_asperg   = birth_date_mother + mother_age_sister + sister_age_asperg + age_asperg;
}

model {
  age_hochdorf         ~ normal(age_hochdorf_mean,         age_hochdorf_err);
  age_asperg           ~ normal(age_asperg_mean,           age_asperg_err);
  burial_date_hochdorf ~ normal(burial_date_hochdorf_mean, burial_date_hochdorf_err);
  burial_date_asperg   ~ normal(burial_date_asperg_mean,   burial_date_asperg_err);
  mother_age_hochdorf  ~ normal(mother_dist_mean,   mother_dist_err);
  mother_age_sister    ~ normal(mother_dist_mean,   mother_dist_err);
  sister_age_asperg    ~ normal(mother_dist_mean,   mother_dist_err);
}
