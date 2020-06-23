#!/bin/bash

set -eu

# Setup debug output
if [[ "${INPUT_DEBUG:-false}" == "true" ]]; then
    set -x
fi

homeSsh="${HOME}/.ssh"
privateKey="${homeSsh}/private.key"
knownHosts="${homeSsh}/known_hosts"

echo -e "\n### Prepare the environment ###\n"
mkdir -p ${homeSsh}
echo "${INPUT_KEY}" > ${privateKey}
chmod 600 ${privateKey}
echo "${INPUT_FINGERPRINT}" > ${knownHosts}
echo -e "\n### Command to execute ###\n"
echo ${INPUT_SCRIPT}
echo -e "\n### Output of the command ###\n"
ssh -o UserKnownHostsFile=${knownHosts} ${INPUT_USERNAME}@${INPUT_HOST} -i ${privateKey} "${INPUT_SCRIPT}"
echo -e "\n### Cleanup the environemnt ###\n"
rm -rf "${homeSsh}/"