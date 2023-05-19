#!/usr/bin/env bash
 
# Import credentials form config file
. /opt/ssh-login-teams-alert-webhook/credentials.config

DATE="$(date "+%d %b %Y %H:%M")"

if [ -n "$SSH_CLIENT" ]; then
	CLIENT_IP=$(echo $SSH_CLIENT | awk '{print $1}')

	SRV_HOSTNAME=$(hostname -f)
	SRV_IP=$(hostname -I | awk '{print $1}')

	IPINFO="https://ipinfo.io/${CLIENT_IP}"

	MESSAGE="Connection from *${CLIENT_IP}* as ${USER} on *${SRV_HOSTNAME}* (*${SRV_IP}*)
	Date: ${DATE}
	More informations: [${IPINFO}](${IPINFO})"

	TITLE="SSH Login: ${USER} from ${CLIENT_IP} on ${SRV_HOSTNAME} at ${DATE}"

	JSON="
	{
		"title": \"${TITLE}\",
		\"text\": \"${MESSAGE}\",
		"themeColor": \"0078D7\"
	}"

	curl -s -d "${JSON}" -H 'Content-Type: application/json'  $WEBHOOKURL > /dev/null
fi
