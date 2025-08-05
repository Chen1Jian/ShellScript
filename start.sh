#!/bin/bash
if [ ! -d "/opt/mscp-tools/" ]; then
  mkdir /folder
fi
rm -rf /opt/mscp-tools/mscp-tools.jar
rm -rf /opt/mscp-tools/shell/
rm -rf /opt/mscp-tools/file/
rm -rf /opt/mscp-tools/mscp-tools.zip
rm -rf /opt/mscp-tools/msf_completion
rm -rf /opt/mscp-tools/msf.sh
# wget -P /opt/mscp-tools http://registry.mig.ruijie.net:8000/ibns/dev/mscp-tools.zip
unzip /opt/mscp-tools/mscp-tools.zip -d /opt/mscp-tools
cd /opt/mscp-tools/
java -cp "/opt/mscp-tools/mscp-tools.jar" picocli.AutoComplete -n msf cn.com.ruijie.cli.CommandApplication -c cn.com.ruijie.cli.helper.CliFactory -f

if [[ $(cat /root/.bashrc) != *msf.sh* ]]; then
  echo alias msf=/opt/mscp-tools/msf.sh  >> /root/.bashrc
fi
if [[ $(cat /root/.bashrc) != *msf_completion* ]]; then
  echo 'if [ -f "/opt/mscp-tools/msf_completion" ];then'  >> /root/.bashrc
  echo '  . /opt/mscp-tools/msf_completion'  >> /root/.bashrc
  echo 'fi'  >> /root/.bashrc
fi
chmod +x /opt/mscp-tools/msf.sh
source /root/.bashrc
rm -rf /opt/start.sh
echo "快速安装已经完成，使用可定位性脚本工具开始"
