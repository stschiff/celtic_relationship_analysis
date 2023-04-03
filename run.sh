# Full Sibling model
# To compile the program, need to switch to stan directory
cd ~/Software/cmdstan;make ~/dev/celtic_relationship_analysis/model_siblings; cd -

./model_siblings sample data file=model_siblings_input.json output file=model_siblings_output.csv

# Avuncular model
cd ~/Software/cmdstan;make ~/dev/celtic_relationship_analysis/model_avuncular; cd -

./model_avuncular sample data file=model_avuncular_input.json output file=model_avuncular_output.csv