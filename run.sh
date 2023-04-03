# To compile the program, need to switch to stan directory
cd ~/Software/cmdstan; make ~/dev/celtic_relationship_analysis/model_siblings; cd -

./model_siblings sample data file=model_siblings_input.json output file=model_siblings_output.csv