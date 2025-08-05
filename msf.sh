#!/bin/bash
if [[ $1 = "arthas" ]]
then
  if [[ $2 == "-h" || $2 == "--help" || $2 == "-V" || $2 == "-version" ]];then
    java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2
  elif [[ $2 == "" ]];then
  java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication arthas -h
  else
    bash /opt/mscp-tools/shell/arthas_environment_preparation.sh $2
  fi
elif [[ $1 = "docker" ]] && [[ $2 = "replace-war" ]]
then
  if [[ $3 == "-h" || $3 == "--help" || $3 == "-V" || $3 == "-version" || $3 == "" ]];then
    java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2 $3
  elif [[ $3 = "-a" || $3 = "--all" ]];then
   bash /opt/mscp-tools/shell/replace_stand_cluster.sh $4 $5 all
  else
    bash /opt/mscp-tools/shell/replace_stand_cluster.sh $3 $4
  fi
elif [[ $1 = "docker" ]] && [[ $2 = "replace-jar" ]]
then
  if [[ $3 == "-h" || $3 == "--help" || $3 == "-V" || $3 == "-version" || $3 == "" ]];then
    java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2 $3
  elif [[ $3 = "-a" || $3 = "--all" ]];then
   bash /opt/mscp-tools/shell/replace_jar.sh $4 $5 all
  else
    bash /opt/mscp-tools/shell/replace_jar.sh $3 $4
  fi
#elif [[ $1 = "zk" ]] && [[ $2 = "dev" ]]
#then
#  if [[ $3 == "-h" || $3 == "--help" || $3 == "-V" || $3 == "-version" ]];then
#    java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2 $3
#  elif [[ $3 = "-a" || $3 = "--all" ]];then
#   bash /opt/mscp-tools/shell/zookeeper-dev.sh all
#  else
#    bash /opt/mscp-tools/shell/zookeeper-dev.sh
#  fi
elif [[ $1 = "kafka" ]] && [[ $2 = "group" ]]
then
  if [[ $3 == "-h" || $3 == "--help" || $3 == "-V" || $3 == "-version" ]];then
    java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2 $3
  elif [[ $3 ]];then
   bash /opt/mscp-tools/shell/kafka_group_describe.sh $3 $4
  else
    bash /opt/mscp-tools/shell/kafka_group_describe.sh
  fi
elif [[ $1 = "kafka" ]] && [[ $2 = "topic" ]]
then
  if [[ $3 == "-h" || $3 == "--help" || $3 == "-V" || $3 == "-version" ]];then
    java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2 $3
  elif [[ $3 ]];then
   bash /opt/mscp-tools/shell/kafka_topic_describe.sh $3 $4
  else
    bash /opt/mscp-tools/shell/kafka_topic_describe.sh
  fi
elif [[ $1 = "kafka" ]] && [[ $2 = "send-topic" ]]
then
  if [[ $3 == "-h" || $3 == "--help" || $3 == "-V" || $3 == "-version" ]];then
    java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2 $3
  else
    bash /opt/mscp-tools/shell/kafka_consume_topic.sh send $3
  fi
elif [[ $1 = "rgonc-base" ]] && [[ $2 = "client" ]]
then
  if [[ $3 == "-h" || $3 == "--help" || $3 == "-V" || $3 == "-version" ]];then
    java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2 $3
  else
    bash /opt/mscp-tools/shell/entry_onc_query_status.sh
  fi
elif [[ $1 = "clogs" ]] && [[ $2 = "traceId" ]]
then
  if [[ $3 == "-h" || $3 == "--help" || $3 == "-V" || $3 == "-version" ]];then
    java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2 $3
  else
    bash /opt/mscp-tools/shell/tail_api_failed_log.sh
  fi
elif [[ $1 = "docker" ]] && [[ $2 != "status" ]]  && [[ $2 != "replace-war" ]]  && [[ $2 != "-h" ]] && [[ $2 != "--help" ]] && [[ $2 != "-V" ]] && [[ $2 != "--version" ]] && [[ $2 != "" ]]
then
  if [[ $3 == -* ]];then
  image_id=$(docker ps | grep $4 | awk '{print $1}')
  docker $2 $3 $image_id $5 $6 $7 $8 $9
  elif [[ $2 = "exec" ]]; then
  image_id=$(docker ps | grep $4 | awk '{print $1}')
  docker $2 $3 $image_id $5
  else
  image_id=$(docker ps | grep $3 | awk '{print $1}')
  docker $2 $image_id $4 $5 $6 $7 $8 $9
  fi
else
  java -cp "/opt/mscp-tools/mscp-tools.jar" cn.com.ruijie.cli.CommandApplication $1 $2 $3 $4 $5 $6 $7 $8 $9
fi