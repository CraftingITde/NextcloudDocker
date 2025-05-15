#!/bin/bash

# Get the latest release version from GitHub
LATEST_VERSION=$(curl -s 'https://api.github.com/repos/nextcloud/notify_push/releases/latest' | jq -r '.tag_name')

# Get current version from Dockerfile
CURRENT_VERSION=$(sed -nr 's/ARG NOTIFY_PUSH_VERSION=*(.+)/\1/p' Container/NextcloudNotifyPush/Dockerfile)

# Get repo address for logging
REPO_ADRESS=$(git config --get remote.origin.url | sed 's~http[s]*://~~g')

# Get semantic version without 'v' prefix for tagging
SEMVER_VERSION=$(echo "${LATEST_VERSION}" | sed 's/^v//')

# Check if the version only has major and minor, add patch version if needed
if [[ "$SEMVER_VERSION" =~ ^[0-9]+\.[0-9]+$ ]]; then
  SEMVER_VERSION="${SEMVER_VERSION}.0"
fi

# Log versions for debugging
echo "Found versions:"
echo "  Latest:  ${LATEST_VERSION}"
echo "  Latest Semver:  ${SEMVER_VERSION}"
echo "  Current: ${CURRENT_VERSION}"
echo "  Repo:    ${REPO_ADRESS}"

# Update the version in the Dockerfile if different
if [ "$LATEST_VERSION" != "$CURRENT_VERSION" ]; then
    echo "Updating Dockerfile from ${CURRENT_VERSION} to ${LATEST_VERSION}"
    sed -i "s/ARG NOTIFY_PUSH_VERSION=${CURRENT_VERSION}/ARG NOTIFY_PUSH_VERSION=${LATEST_VERSION}/g" Container/NextcloudNotifyPush/Dockerfile
else
    echo "Already using the latest version ${CURRENT_VERSION}"
fi

# Check if changes were made
git diff --exit-code . > /dev/null

if [ "$?" -eq "0" ]; then
    echo "No changes made. Nothing to do..."
    exit 0
else
    echo "Committing changes"
    # Configure git for commit
    git config user.name "CraftingIT-Bot"
    git config user.email "craftingitbot@craftingit.de"
    git add Container/NextcloudNotifyPush/Dockerfile
    git commit --message "Bump notify_push to latest version ${LATEST_VERSION}"
fi

# Check if tag already exists, create if not
git fetch --tags &> /dev/null
git show "${SEMVER_VERSION}" &> /dev/null
if [ "$?" -eq "0" ]; then
    echo "Tag '${SEMVER_VERSION}' already exists. Skipping..."
else
    echo "Tag '${SEMVER_VERSION}' does not exist. Creating..."
    git tag -a ${SEMVER_VERSION} -m "New Version ${SEMVER_VERSION} by CraftingIT-Bot"
fi