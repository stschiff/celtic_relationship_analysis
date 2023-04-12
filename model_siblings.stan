data {         
  real burial_date_hochdorf_mean;
  real burial_date_hochdorf_err;
  real burial_date_asperg_mean;
  real burial_date_asperg_err;
  real age_hochdorf_mean;
  real age_hochdorf_err;
  real age_asperg_mean;
  real age_asperg_err;
  real mother_dist_mean;
  real mother_dist_err;
  real mother_birth_date_lower;
  real mother_birth_date_upper;
}

parameters {
  real<lower=mother_birth_date_lower, upper=mother_birth_date_upper> birth_date_mother;
  real mother_age_hochdorf;
  real mother_age_asperg;
  real age_hochdorf;
  real age_asperg;
}

transformed parameters {
  real burial_date_hochdorf = birth_date_mother + mother_age_hochdorf + age_hochdorf;
  real burial_date_asperg   = birth_date_mother + mother_age_asperg + age_asperg;
}

model {
  age_hochdorf         ~ normal(age_hochdorf_mean,         age_hochdorf_err);
  age_asperg           ~ normal(age_asperg_mean,           age_asperg_err);
  burial_date_hochdorf ~ normal(burial_date_hochdorf_mean, burial_date_hochdorf_err);
  burial_date_asperg   ~ normal(burial_date_asperg_mean,   burial_date_asperg_err);
  mother_age_hochdorf  ~ normal(mother_dist_mean,          mother_dist_err);
  mother_age_asperg    ~ normal(mother_dist_mean,          mother_dist_err);
}