#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# UPDATE ALL GIT REPOS
updateSubRepoGit() {

	find . -regex '.*\.\(java\)' -exec clang-format -i {} \;
	git submodule foreach npm run changelog

	CUR_DIR=$(pwd)
	echo "${GREEN}Updating all repositories...${NC}"
	echo ""
	for i in $(find . -name ".git" | cut -c 3-); do
		echo "${GREEN}[Git] ✅ ----------------- $i ${NC}"
		echo ""
		cd "$CUR_DIR/$(dirname "$i")"
		git checkout development
		git add .
		git commit -m "blast off 🚀 "
		git push
		echo ""
	done
	echo ""
	echo "${GREEN}Updating Complete! 🥞${NC}"
}

# UPDATE ALL GIT SUB REPOS
updateSubRepo() {
	git submodule foreach $(git add . && git commit -m "CHECKING GIT" && git push)
	git add . && git commit -m "CHECKING GIT" && git push
	echo "Updating Complete! 🥞"
}

updateSubRepoGit
