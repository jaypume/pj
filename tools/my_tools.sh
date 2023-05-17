# $1, hostname
# $2, sub dir

pj_push(){
        CUR_DIR=`pwd`
        DST_DIR=${CUR_DIR:10}
        rsync -avzuP --delete $CUR_DIR $1:~$(dirname $DST_DIR)
}

# pj_pull gz1 
# 需要在项目根目录下使用
pj_pull(){
        CUR_DIR=`pwd`
        SRC_DIR=${CUR_DIR:10}
        rsync -avzuP $1:~$SRC_DIR ../.
}

