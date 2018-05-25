#!/bin/bash

#Plugin to deploy war file to running webserver for CI/CD demonstration
# __  __     __  __     ______   ______     ______     ______     ______     __     _____
# /\ \_\ \   /\ \_\ \   /\  == \ /\  ___\   /\  == \   /\  ___\   /\  == \   /\ \   /\  __-.
# \ \  __ \  \ \____ \  \ \  _-/ \ \  __\   \ \  __<   \ \ \__ \  \ \  __<   \ \ \  \ \ \/\ \
# \ \_\ \_\  \/\_____\  \ \_\    \ \_____\  \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \_\  \ \____-
#  \/_/\/_/   \/_____/   \/_/     \/_____/   \/_/ /_/   \/_____/   \/_/ /_/   \/_/   \/____/
# jmasci@hypergrid.comma
# https://github.com/mascij

# Set your values in the emailSettings.txt file & keep it in the root directory of this script
# Run the script with the username, password, and IP as parameters i.e. ./setSettings.sh admin@hypercloud.io admin123 10.0.8.47

source emailSettings.txt

user=$1
password=$2
url=$3
emailId=$(curl -ks --user $user:$password https://$url/api/emailconfig | jq -r '.results.id')

echo "Found email registry ID " $emailId

echo "Setting Mail Host " $MailHost
sleep 1
echo "Setting Mail Port" $MailPort
sleep 1
echo "Setting Username " $Username
sleep 1
echo "Setting Password *******"
sleep 1
echo "Setting Secure SMTP Connection" $SecureSmtpConnection
sleep 1
echo "Setting 'From' Email" $FromEmail
sleep 1
echo "Setting 'Failure' Email" $FailureEmail
sleep 1
echo "Setting 'BCC' Email" $BccEmail

curl -sk --user $user:$password -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"id":"'"$emailId"'","inactive":false,"deleted":false,"lockVersion":1,"lastModifiedDate":null,"lastModifiedBy":"cloudAdmin","createdDate":null,"createdBy":"cloudAdmin","owner":null,"ownerPk":null,"tenant":null,"tenantPk":null,"mailHost":"'"$MailHost"'","mailPort":"'"$MailPort"'","mailUserName":"'"$Username"'","mailPassword":"'"$Password"'","mailFrom":"'"$FromEmail"'","mailFailureTo":"'"$FailureEmail"'","mailBcc":"'"$BccEmail"'","mailToTest":null,"secureSmtpConnection":true}' https://$url/api/emailconfig/save > /dev/null
