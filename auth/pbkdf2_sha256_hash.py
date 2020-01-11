#!/usr/local/bin/python3

import sys
from passlib.hash import pbkdf2_sha256
from passlib.pwd import genword

logger = logging.getLogger(__name__)
coloredlogs.install(level='INFO')

try:
    plaintext = sys.argv[1]
except IndexError:
    plaintext = genword()

pwd = pbkdf2_sha256.hash(plaintext, rounds=200000, salt_size=16)
print(pwd[-10:])
