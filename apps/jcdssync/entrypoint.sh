#!/bin/sh

PACKAGES_DIR=${PACKAGES_DIR:-/packages}

# Make sure packages directory exists
mkdir -p "${PACKAGES_DIR}"

# Change to packages directory
cd "${PACKAGES_DIR}"

# Check environment variables
missing_vars=""
[ -z "${JAMF_URL}" ] && missing_vars="${missing_vars} JAMF_URL"
[ -z "${JAMF_CLIENT_ID}" ] && missing_vars="${missing_vars} JAMF_CLIENT_ID"
[ -z "${JAMF_CLIENT_SECRET}" ] && missing_vars="${missing_vars} JAMF_CLIENT_SECRET"

if [ -n "${missing_vars}" ]; then
    echo "Missing required environment variables:${missing_vars}"
    exec sleep infinity
fi

# Launch JCDSSync
exec jcdssync "$@"
