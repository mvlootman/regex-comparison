#!/bin/bash

# clean
echo 'clean'
rm -rf ./code/bin/

# build
echo 'build go'
go build -o ./code/bin/re_digit ./code/re_digit.go
echo 'build V pcre'
v -prod ./code/pcre_digit.v -o ./code/bin/v_pcre
v -prod ./code/regex_digit.v -o ./code/bin/v_regex
echo 'build Crystal (todo)'
#crystal ...

# time
echo 'time Go'
/usr/bin/time -l ./code/bin/re_digit 
echo 'time V (pcre)'
/usr/bin/time -l ./code/bin/v_pcre
echo 'time V (regex)'
/usr/bin/time -l ./code/bin/v_regex
echo 'time Python'
/usr/bin/time -l python ./code/pypy_digit.py 
echo 'time PyPy'
/usr/bin/time -l pypy ./code/pypy_digit.py 

#echo 'time Crystal'

# size of binaries
ls -lah ./code/bin/

# versions
python --version
pypy --version
v -version
go version