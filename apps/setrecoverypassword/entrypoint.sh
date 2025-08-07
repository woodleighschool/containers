#!/bin/sh

# Check environment variables
missing_vars=""
[ -z "${JAMF_HOST}" ] && missing_vars="${missing_vars} JAMF_HOST"
[ -z "${JAMF_CLIENT_ID}" ] && missing_vars="${missing_vars} JAMF_CLIENT_ID"
[ -z "${JAMF_CLIENT_SECRET}" ] && missing_vars="${missing_vars} JAMF_CLIENT_SECRET"
[ -z "${VAULT_ID}" ] && missing_vars="${missing_vars} VAULT_ID"
[ -z "${ONEPASSWORD_TOKEN}" ] && missing_vars="${missing_vars} ONEPASSWORD_TOKEN"

if [ -n "${missing_vars}" ]; then
    echo "Missing required environment variables:${missing_vars}"
    exec sleep infinity
fi

# Launch SetRecoveryPassword
exec setrecoverypassword "$@"
