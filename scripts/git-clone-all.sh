#!/bin/bash
REPOSITORIES=(Pitstop-CustomerManagement )

if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nCloning repository: {}\n========================================================\n"; git clone https://github.com/accoon-pitstop/{}.git'
  else
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo Cloning repository: $REPOSITORY
      echo ========================================================
	  cd ../../
	  mkdir $REPOSITORY
	  cd $REPOSITORY
      REPO_URL=https://github.com/accoon-pitstop/$REPOSITORY.git
      git clone $REPO_URL
    done
fi

