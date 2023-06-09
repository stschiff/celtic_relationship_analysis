# Full Sibling model
# To compile the program, need to switch to stan directory
cd ~/Software/cmdstan;make ~/dev/celtic_relationship_analysis/model_siblings; cd -

./model_siblings sample init=model_siblings_input.json output file=model_siblings_output.csv

# Avuncular model
cd ~/Software/cmdstan;make ~/dev/celtic_relationship_analysis/model_avuncular; cd -

./model_avuncular init model_avuncular_input.json output file=model_avuncular_output.csv

# Cousin model
cd ~/Software/cmdstan;make ~/dev/celtic_relationship_analysis/model_cousins; cd -

./model_cousins sample init=model_cousins_input.json output file=model_cousins_output.csv