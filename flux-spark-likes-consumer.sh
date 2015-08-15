cd $PIPELINE_HOME
echo ...Building and Packaging Streaming App...
sbt streaming/package

nohup ...Starting Spark Likes Streaming App...
spark-submit --packages org.apache.spark:spark-streaming-kafka-assembly_2.10:1.4.1,com.datastax.spark:spark-cassandra-connector-java_2.10:1.4.0-M2 --class com.fluxcapacitor.pipeline.spark.streaming.StreamingLikes $PIPELINE_HOME/streaming/target/scala-2.10/streaming_2.10-1.0.jar 2>&1 1>streaming-likes-out.log &
echo    logs available with 'tail -f streaming-likes-out.log'
