#!/usr/bin/env bash

# globals
CWD=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

read -sp "Please enter a new admin password: " PASSWORD && printf "\n"

    pushd ${CWD} && \
      export HASH=`${CWD}/pbkdf2_sha256_hash.py ${PASSWORD} | awk '{print $1}'` && \
      sqlite3 db/auth.db "UPDATE USERS SET password='${HASH}' WHERE id=1;" && \
      popd && \
      printf "New Password: ${HASH}\n"
      printf "rc=$?\n"
