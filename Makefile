help:
	@ echo "Help task is disabled"

dump-envs:
	@ export LW_STARTER_CONFIG_DIR=$(realpath --no-symlinks ~/.config/lwstarter)
	@ export LW_STARTER_PROJECT_DIR=$(realpath --no-symlinks .)
	@ envsubst < .env.example > .env

install: \
	dump-envs
	@ /bin/bash ./bin/install.sh
