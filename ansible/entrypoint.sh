#!/bin/bash
if [ ! -z ${PLUGIN_PRIVATE_KEY+x} ]
then 
	echo "SSH_KEY variable is setted"
	mkdir ${HOME}/.ssh
	echo -e "${PLUGIN_PRIVATE_KEY}" > ${HOME}/.ssh/id_rsa
	chmod 400 -R ${HOME}/.ssh
fi

if [ -z ${PLUGIN_PATH+x} ]
then 
	echo "PATH variable is not setted"
	# entrypoint to launch command PLUGIN_COMMAND 
	echo -e "#!/usr/bin/bash\n${PLUGIN_COMMAND}" > launcher.sh
	chmod 755 launcher.sh 
	./launcher.sh

else
	echo "PATH variable is setted to : ${PLUGIN_PATH}"
	cd ${PLUGIN_PATH}
	echo -e "#!/usr/bin/bash\n${PLUGIN_COMMAND}" > launcher.sh
	chmod 755 launcher.sh 
	./launcher.sh
fi

