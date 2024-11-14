#!/bin/bash
# Updates MFA Session token 
# need to set MY_AUTHENTICATION_NAME and DEFAULT_PROFILE (if not using default)

if [ $# -ne 1 ]; then
  echo "USAGE: $0 <MFA Code>"
  exit 1
fi


DEFAULT_PROFILE="default"
TOKEN_DURATION=86400 #24 hours
MFA_SOURCE_PROFILE="<INSERT AWS CONFIG PROFILE NAME FOR MFA SESSION>"

# Get users MFA Identity
ARN_MFA=$(aws iam list-mfa-devices --output text --profile ${DEFAULT_PROFILE} | awk '{ print $3 }')
# Get the credentials from the DSI account
AWS_SESSION_TOKEN=$(aws sts get-session-token --duration-seconds $TOKEN_DURATION --serial-number $ARN_MFA --token-code $1 --profile ${DEFAULT_PROFILE} --output text)


aws configure set --profile ${MFA_SOURCE_PROFILE} region us-east-1
aws configure set --profile ${MFA_SOURCE_PROFILE} output json
aws configure set --profile ${MFA_SOURCE_PROFILE} aws_access_key_id $(echo ${AWS_SESSION_TOKEN} | awk '{print $2}')
aws configure set --profile ${MFA_SOURCE_PROFILE} aws_secret_access_key $(echo ${AWS_SESSION_TOKEN} | awk '{print $4}')
aws configure set --profile ${MFA_SOURCE_PROFILE} aws_session_token $(echo ${AWS_SESSION_TOKEN} | awk '{print $5}')
