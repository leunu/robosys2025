#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 raito kaneko 2434.raito@gmial.com
# SPDX-License-Identifier: BSD-3-Clause

ng (){
        echo ${1}行目がちがう
        res= 1
}

res=0
###NORMAL INPUT###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

###STRANGE INPUT###
out=$(echo あ | ./plus)
["$?" = 1]      || ng "$LINENO"
["${out}" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
["$?" = 1]      || ng "$LINENO"
["${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK

exit $res
