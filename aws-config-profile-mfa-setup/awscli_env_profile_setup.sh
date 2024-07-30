#!/bin/bash
# This script will setup awscli profiles for given list of environments (newline delimited in format profile_name:account_number)


if [ $# -ne 1 ]; then
  echo "USAGE: $0 <accounts.txt>"
  exit 1
fi


REGION="us-east-1"
OUTPUT_FORMAT="json"
ROLE="<INSERT ROLE NAME>"
MFA_SOURCE_PROFILE="<INSERT AWS CONFIG PROFILE NAME FOR MFA SESSION>"


for account in $(cat $1) ; do 
    account_name=$(echo $account | cut -d':' -f 1) 
    account_number=$(echo $account | cut -d':' -f 2)

    # echo "Configuring ${account_name} with ${account_number/%$'\r'/}"
    aws configure set --profile ${account_name} region ${REGION}
    aws configure set --profile ${account_name} output ${OUTPUT_FORMAT}
    aws configure set --profile ${account_name} role_arn "arn:aws:iam::${account_number/%$'\r'/}:role/${ROLE}"
    aws configure set --profile ${account_name} source_profile ${MFA_SOURCE_PROFILE}
done
