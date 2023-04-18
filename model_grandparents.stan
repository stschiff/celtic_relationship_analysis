data {         
  real          burial_date_hochdorf_mean;
  real          burial_date_hochdorf_err;
  real          burial_date_asperg_mean;
  real          burial_date_asperg_err;
  real<lower=0> age_hochdorf_mean;
  real<lower=0> age_hochdorf_err;
  real<lower=0> age_asperg_mean;
  real<lower=0> age_asperg_err;
  real<lower=0> father_dist_mean;
  real<lower=0> father_dist_err;
}

parameters {
  real          burial_date_hochdorf;
  real<lower=0> years_pre_fatherhood_hochdorf;
  real<lower=0> years_fatherhood_hochdorf;
  real<lower=0> age_fatherhood_son;
  real<lower=0> age_asperg;
}

model {
  burial_date_hochdorf          ~ normal(burial_date_hochdorf_mean, burial_date_hochdorf_err);
  years_pre_fatherhood_hochdorf ~ normal(father_dist_mean, father_dist_err);
  real age_hochdorf             = years_pre_fatherhood_hochdorf + years_fatherhood_hochdorf;
  age_hochdorf                  ~ normal(age_hochdorf_mean, age_hochdorf_err);
  age_fatherhood_son            ~ normal(father_dist_mean, father_dist_err);
  age_asperg                    ~ normal(age_asperg_mean, age_asperg_err);
  real burial_date_asperg       = burial_date_hochdorf - years_fatherhood_hochdorf + age_fatherhood_son + age_asperg;
  burial_date_asperg            ~ normal(burial_date_asperg_mean, burial_date_asperg_err);
}
