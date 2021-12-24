
# consider: 1.different work dir, 2. differenct host
CUR_DIR=`pwd`
pj_rsync(){
    if [[ `cat /proc/version` == MSYS* ]] ;
    then
        DST_DIR=${CUR_DIR:2}
    else
        DST_DIR=$CUR_DIR
    fi
rsync -avzuP --delete $CUR_DIR pj@$1:$(dirname $DST_DIR)
}
