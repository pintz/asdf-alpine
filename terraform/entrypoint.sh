#!/bin/bash

#tail -f /dev/null

if [ -z ${PLUGIN_PATH+x} ]
then 
	echo "PATH variable is not setted"
	ls
	# entrypoint to launch command PLUGIN_COMMAND 
	terraform "${PLUGIN_COMMAND}"
else
	echo "PATH variable is setted to : ${PLUGIN_PATH}"
	cd ${PLUGIN_PATH}
	ls
	terraform "${PLUGIN_COMMAND}"
fi
