#/bin/sh 
USSRR=`logname`
HOME_DIR=/home/$USSRR

value_enter=$1
echo " this script should run as root user"
if [ $USER == "root" ]
then 

# help
if [  $value_enter == "-h"  ] 
then 
	echo "  nvidia opengl enable script
		-e enable 
		-d disable 
	"


# enable 
elif [ $value_enter == "-e" ] 
then 
sed 's/#.*O/        O/g'  /etc/X11/xorg.conf.d/nvidia.conf  -i
sed 's/#.*NVIDIA/xrandr --setprovideroutputsource modesetting NVIDIA/g' $HOME_DIR/.xinitrc  -i
sed 's/#xrandr.*auto/xrandr --auto/g' $HOME_DIR/.xinitrc    -i

echo " Detected user root"
echo " done ...." 
echo " applied changes"


# disable 
elif [ $value_enter == "-d" ] 
then 
sed 's/.*PrimaryGPU/#     Option "PrimaryGPU/g'  /etc/X11/xorg.conf.d/nvidia.conf  -i
sed 's/xrandr.*auto/\#xrandr --auto/g' $HOME_DIR/.xinitrc -i
sed 's/xrandr.*NVIDIA/\#xrandr --setprovideroutputsource modesetting NVIDIA/g' $HOME_DIR/.xinitrc    -i

echo " Detected user root"
echo " done ...." 
echo " applied changes"

else 
echo " input error chech -h to view use of this script " 
fi 
else 
	echo " this current user is not root
	       please run this script as root"
fi 
