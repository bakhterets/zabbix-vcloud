# zabbix-vcloud
 Repo with script, template and taskevent for wap check
 author: Ilia Bakhterev  
 mail: bakhterets@gmail.com

# PS script description
This script runs every 8 hours by schedule on SPBSRV-WAP01.TRH.LOCAL
Script returns 3 log files with values for each function in script:
0
1
2

# Dependences
- Script depends on terraform.exe and check.tf file.
This is terraform file for deployment and removal vm in vcloud.example.com.
It needs for creation and removal vm wia vRa api.
- TF uses "zabbix-vra@.example.com" account for action.
- vCloudCheck.xml is for task scheduler on spbsrv-wap01.trh.local host.