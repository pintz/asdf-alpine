#!/bin/bash
if [ ! -z ${PLUGIN_PRIVATE_KEY+x} ]
then 
	echo "SSH_KEY variable is setted"
	mkdir ${HOME}/.ssh
	echo -e "${PLUGIN_PRIVATE_KEY}" > ${HOME}/.ssh/id_rsa
	chmod 400 -R ${HOME}/.ssh
	chmod 700 -R ${HOME}/.ssh/id_rsa
else
	echo "please set PRIVATE_KEY variable "
fi

if [ ! -z ${PLUGIN_PATH+x} ]
then 
	echo "PATH variable is setted to : ${PLUGIN_PATH}"
	cd ${PLUGIN_PATH}
else 
	echo "PATH variable is not setted"
fi

echo "Launching command : ${PLUGIN_COMMAND}"
echo "located in"
pwd
ls

/usr/bin/bash -c ${PLUGIN_COMMAND}

# echo -e "#!/usr/bin/bash\n${PLUGIN_COMMAND}" > launcher.sh
# chmod 755 launcher.sh 
# ./launcher.sh

