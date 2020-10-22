export LW_STARTER_CONFIG_DIR=$(shell realpath --no-symlinks ~/.config/lwstarter)
export LW_STARTER_PROJECT_DIR=$(shell realpath --no-symlinks .)

help:
	@ echo "Help task is disabled"

dump-envs:
	@ envsubst < .env.example > .env

install: \
	dump-envs
	@ /bin/bash ./bin/install.sh
