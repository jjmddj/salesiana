#vi /opt/scripts/system-info.sh
#!/bin/bash
clear
echo -e "-----------------------------\tCongratulations\t`w | cut -d ' ' -f1 | grep -v USER | xargs -n1`\t----------------------"
echo -e "---------------This was the last exercise of Operating Systems------------"
echo ""
echo ""
echo -e "el script fue ejecutado a horas "`uptime | awk '{print $3,$4}' | sed 's/,//'`" en el sistema operativo "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`" esta es una "`vserver=$(lscpu | grep Hypervisor | wc -l); if [ $vserver -gt 0 ]; then echo "VM"; else echo "Physical"; fi`
echo ""
echo ""
if (( $(cat /etc/*-release | grep -w "Oracle|Red Hat|CentOS|Fedora" | wc -l) > 0 ))
then
echo -e "-------------------------------Package Updates-------------------------------"
yum updateinfo summary | grep 'Security|Bugfix|Enhancement'
echo -e "-----------------------------------------------------------------------------"
else
echo -e "Tienes mas de "`cat /var/lib/update-notifier/updates-available`", para actualizar"
fi
echo "El comando cd usaste "`history | awk '$2=="cd"' | wc -l`" veces"
echo "El comando mkdir usaste "`history | awk '$2=="mkdir"' | wc -l`" veces"
echo "El comando mv usaste "`history | awk '$2=="mv"' | wc -l`" veces"
echo "El comando chmod usaste "`history | awk '$2=="chmod"' | wc -l`" veces"
echo "El comando cp usaste "`history | awk '$2=="cp"' | wc -l`" veces"
echo "El comando scp usaste "`history | awk '$2=="scp"' | wc -l`" veces"
echo "El comando rm usaste "`history | awk '$2=="rm"' | wc -l`" veces"
echo ""
echo ""
echo ""
echo "atte Juan Mamani"
sleep 10
echo "                            ingrese su password                         "
sudo apt install cmatrix
cmatrix
