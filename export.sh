EXPORT_DIR=./java
rm -rf $EXPORT_DIR
mkdir $EXPORT_DIR
camel export --gav=my.company:restroute:1.0.0 -dir=$EXPORT_DIR --runtime=camel-main