
WORK_DIR=/home/pj/work/src/github.com/kubeedge/sedna.feature-online-course
my_rsync(){
rsync -avz /d/$WORK_DIR/* pj@hk2:$WORK_DIR
}
