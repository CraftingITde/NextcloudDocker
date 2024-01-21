#!/bin/zsh
export CURENT_MAJOR=26

curl -s 'https://api.github.com/repos/nextcloud/server/tags?per_page=100' | jq -r '.[].name' | grep -v RC | grep -v rc | grep -v beta | grep $CURENT_MAJOR. | sort -V  >> remoteVersions
sed --in-place "s/v//g" remoteVersions

git tag -l | grep $CURENT_MAJOR. | sort -V >> currentVersions

sed -i.bak s/$'\r'//g currentVersions
sed -i.bak s/$'\r'//g remoteVersions

LATEST_VERSION=$(tail -1 remoteVersions )
LATEST_CURRENT_VERSION=$(tail -1 currentVersions)

rm remoteVersions
rm currentVersions

CURRENT_VERSION=$(sed -nr 's/FROM nextcloud:*(.+)/\1/p' Container/Nextcloud/Dockerfile | sed 's/-apache//g' | sed s/$'\r'//g | sed 's/[[:blank:]]*$//');
REPO_ADRESS=$(git config --get remote.origin.url | sed 's~http[s]*://~~g')

echo "Found versions:"
echo "  Current Major: ${CURENT_MAJOR}"
echo "  LatestRemote:  ${LATEST_VERSION}"
echo "  LatestLocal:   ${LATEST_CURRENT_VERSION}"
echo "  Current:       ${CURRENT_VERSION}"
echo "  Repo:          ${REPO_ADRESS}"

sed -i "s/FROM nextcloud:${CURRENT_VERSION}-apache/FROM nextcloud:${LATEST_VERSION}-apache/g" Container/Nextcloud/Dockerfile
sed -i "s/FROM nextcloud:${CURRENT_VERSION}-fpm/FROM nextcloud:${LATEST_VERSION}-fpm/g" Container/NextcloudCron/Dockerfile

git diff --exit-code . > /dev/null

if [ "$?" -eq "0" ]; then
	echo "No changes made. Nothig to do..."
    exit 0
else
	echo "Committing changes"
#	add changes and Push
    git config user.name "CraftingIT-Bot"
    git config user.email "craftingitbot@craftingit.de"
    git add Container/Nextcloud/Dockerfile
    git add Container/NextcloudCron/Dockerfile
	git commit --message "Bump to latest version ${VERSION}"
fi

git fetch --tags &> /dev/null
git show "${LATEST_VERSION}" &> /dev/null
if [ "$?" -eq "0" ]; then
	echo "Tag '${LATEST_VERSION}' already exist. Skipping..."
else
	echo "Tag '${LATEST_VERSION}' not exist. Creating..."
    git tag -a ${LATEST_VERSION} -m "New Version ${LATEST_VERSION} by CraftingIT-Bot"
fi
