#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# UPDATE ALL GIT REPOS
updateSubRepoGit() {

	# format
	sh ./scripts/format.sh
	# adapt changelogs
	sh ./scripts/changelog.sh

	CUR_DIR=$(pwd)
	echo "${GREEN}Updating all repositories...${NC}"
	echo ""
	for i in $(find . -name ".git" | cut -c 3-); do
		echo "${GREEN}[Git] ✅ ----------------- $i ${NC}"
		echo ""
		cd "$CUR_DIR/$(dirname "$i")"

		git checkout development

		git add .
		git commit -m "latest edit: gitu.all -> update"
		git push
		echo ""
	done
	echo ""
	echo "${GREEN}Updating Complete! 🥞${NC}"
}

# UPDATE ALL GIT SUB REPOS
# updateSubRepo() {
# 	git submodule foreach $(git add . && git commit -m "CHECKING GIT" && git push)
# 	git add . && git commit -m "CHECKING GIT" && git push
# 	echo "Updating Complete! 🥞"
# }

updateSubRepoGit
