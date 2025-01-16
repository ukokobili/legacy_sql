# Make the env_vars.sh script executable
chmodx:
	chmod +x env_vars.sh 

# Source the env_vars.sh script to set environment variables
script:
	. ./env_vars.sh

# Echo the MOTHERDUCK_TOKEN environment variable
echoes:
	@echo "MOTHERDUCK_TOKEN: $$MOTHERDUCK_TOKEN"

# Run dbt debug after setting up environment variables
debug: chmodx script echoes
	dbt debug