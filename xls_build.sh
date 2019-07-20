#!/bin/bash
CUR_PATH=$(cd `dirname $0`;pwd)

if [ ! -d "$CUR_PATH/pb/" ];then
mkdir $CUR_PATH/pb/
fi

$CUR_PATH/proto/protoc -I=$CUR_PATH/src/ --cpp_out=$CUR_PATH/pb/ $CUR_PATH/src/enum.proto

if [ ! -d "$CUR_PATH/py/" ];then
mkdir $CUR_PATH/py/
fi

$CUR_PATH/proto/protoc -I=$CUR_PATH/src/ --python_out=$CUR_PATH/py/ $CUR_PATH/src/enum.proto

for file in $CUR_PATH/xls/*.xls
do
    if test -f $file
    then
        python $CUR_PATH/deploy/xls_deploy.py $file
    fi
done