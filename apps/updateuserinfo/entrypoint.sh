#!/bin/sh

# Check environment variables
missing_vars=""
[ -z "${LDAP_HOST}" ] && missing_vars="${missing_vars} LDAP_HOST"
[ -z "${JAMF_HOST}" ] && missing_vars="${missing_vars} JAMF_HOST"
[ -z "${JAMF_CLIENT_ID}" ] && missing_vars="${missing_vars} JAMF_CLIENT_ID"
[ -z "${JAMF_CLIENT_SECRET}" ] && missing_vars="${missing_vars} JAMF_CLIENT_SECRET"
[ -z "${LDAP_USERNAME}" ] && missing_vars="${missing_vars} LDAP_USERNAME"
[ -z "${LDAP_CREDENTIALS}" ] && missing_vars="${missing_vars} LDAP_CREDENTIALS"

if [ -n "${missing_vars}" ]; then
    echo "Missing required environment variables:${missing_vars}"
    exec sleep infinity
fi

# Launch SetRecoveryPassword
exec updateuserinfo "$@"
