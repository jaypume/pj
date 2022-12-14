# $1, hostname
# $2, sub dir

CUR_DIR=`pwd`
pj_push(){
        DST_DIR=${CUR_DIR:2}
        rsync -avzuP --delete $CUR_DIR pj@$1:$(dirname $DST_DIR)
}

pj_pull(){
        DST_DIR=${CUR_DIR}
        if [ $2 ];then
                SRC_DIR=${CUR_DIR:2}/$2/*
                DST_DIR=$DST_DIR/$2
        else
                echo "please input subdir after hostname"
        fi
        rsync -avzuP pj@$1:$SRC_DIR $DST_DIR
}

