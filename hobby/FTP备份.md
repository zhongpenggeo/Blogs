把需要备份的文件传送到开通了ftp服务的机器上

代码：

```python
#!/bin/bash
# ===========================================
# 先输入系统所需要的数据
host="192.168.1.100"		# 远程主机
id="dmtsai"			# 远程主机的 FTP 帐号
pw='dmtsai.pass'		# 该帐号的口令
basedir="/backup/weekly"	# 本地端的欲被备份的目录
remotedir="/home/backup"	# 备份到远程的何处？

# ===========================================
backupfile=weekly.tar.bz2
cd $basedir/..
  tar -jpc -f $backupfile $(basename $basedir)

ftp -n "$host" > ${basedir}/../ftp.log 2>&1 <<EOF
user $id $pw
binary
cd $remotedir
put $backupfile
bye
EOF
```



参考：http://cn.linux.vbird.org/linux_basic/0580backup.php