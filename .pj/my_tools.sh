
# consider: 1.different work dir, 2. differenct host
WORK_DIR=/home/pj/work/src/github.com/kubeedge/sedna.feature-online-course
my_rsync(){
rsync -avzuP --delete /d/$WORK_DIR/* pj@hk2:$WORK_DIR
}
