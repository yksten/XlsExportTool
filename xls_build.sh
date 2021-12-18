#!/bin/bash
CUR_PATH=$(cd `dirname $0`;pwd)

if [ ! -d "$CUR_PATH/build_out/" ];then
mkdir $CUR_PATH/build_out/
fi
if [ ! -d "$CUR_PATH/build_out/cpp/" ];then
mkdir $CUR_PATH/build_out/cpp/
fi

$CUR_PATH/deploy/proto/protoc -I=$CUR_PATH/protocol/ --cpp_out=$CUR_PATH/build_out/cpp/ $CUR_PATH/protocol/enum.proto

if [ ! -d "$CUR_PATH/build_out/py/" ];then
mkdir $CUR_PATH/build_out/py/
fi

$CUR_PATH/deploy/proto/protoc -I=$CUR_PATH/protocol/ --python_out=$CUR_PATH/build_out/py/ $CUR_PATH/protocol/enum.proto

for file in $CUR_PATH/xls/*.xls
do
    if test -f $file
    then
        python -B $CUR_PATH/deploy/xls_deploy.py $file
    fi
done