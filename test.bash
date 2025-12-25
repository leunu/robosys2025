#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 raito kaneko 2434.raito@gmial.com
# SPDX-License-Identifier: BSD-3-Clause

# 文字コードの設定
export LANG=C.UTF-8

res=0

ng (){
    echo "${1}行目がちがう"
    res=1
}

### 正常系テスト1: 基本的なカウント ###
# 「と」が含まれるように例文を修正しました
input="だと思いました。だと考えました。だと感じました。と受け止めました。"
out=$(echo "$input" | ./check_endings)
echo "$out" | grep -q "と思いました。: 1回" || ng "$LINENO"
echo "$out" | grep -q "と考えました。: 1回" || ng "$LINENO"
echo "$out" | grep -q "と感じました。: 1回" || ng "$LINENO"
echo "$out" | grep -q "と受け止めました。: 1回" || ng "$LINENO"

### 正常系テスト2: 複数回の出現 ###
input="と思いました。と思いました。と思いました。"
out=$(echo "$input" | ./check_endings)
echo "$out" | grep -q "と思いました。: 3回" || ng "$LINENO"

### 異常系テスト: 空の入力 ###
out=$(echo -n "" | ./check_endings)
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
