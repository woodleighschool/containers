#!/bin/sh

# Check environment variables
missing_vars=""
[ -z "${AD_USERNAME}" ] && missing_vars="${missing_vars} AD_USERNAME"
[ -z "${AD_PASSWORD}" ] && missing_vars="${missing_vars} AD_PASSWORD"
[ -z "${API_TOKEN}" ] && missing_vars="${missing_vars} API_TOKEN"

if [ -n "${missing_vars}" ]; then
    echo "Missing required environment variables:${missing_vars}"
    exec sleep infinity
fi

# Launch SetRecoveryPassword
exec ADOverseas "$@"
