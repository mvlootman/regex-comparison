#!/bin/bash

# clean
echo 'clean'
rm -rf ./code/bin/

# build
echo 'build go'
go build -o ./code/bin/re_digit ./code/re_digit.go
echo 'build V pcre'
v -prod ./code/pcre_digit.v -o ./code/bin/v_pcre
v -prod -autofree ./code/pcre_digit.v -o ./code/bin/v_pcre_autofree
v -prod ./code/regex_digit.v -o ./code/bin/v_regex
v -prod -autofree ./code/regex_digit.v -o ./code/bin/v_regex_autofree
echo 'build Crystal'
crystal build ./code/crystal_digit.cr --release --no-debug -o ./code/bin/crystal_digit
#crystal ...

# time
echo 'time Go'
/usr/bin/time -l ./code/bin/re_digit 
echo 'time V (pcre)'
/usr/bin/time -l ./code/bin/v_pcre
echo 'time V (pcre) autofree'
/usr/bin/time -l ./code/bin/v_pcre_autofree

echo 'time V (regex)'
/usr/bin/time -l ./code/bin/v_regex
echo 'time V (regex) autofree'
/usr/bin/time -l ./code/bin/v_regex_autofree
echo 'time Python'
/usr/bin/time -l python ./code/pypy_digit.py 
echo 'time PyPy'
/usr/bin/time -l pypy ./code/pypy_digit.py 
echo 'time Crystal'
/usr/bin/time -l ./code/bin/crystal_digit

# size of binaries
ls -lah ./code/bin/

# versions
python --version
pypy --version
v -version
go version
crystal version