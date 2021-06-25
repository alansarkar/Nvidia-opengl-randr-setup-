
#!/bin/bash



echo " this script will rewrite /etc/X11/xorg.conf.d/nvidia.conf file "
echo " if you have such file backup the file " 
echo " continue ?? type yes " 
read  enter_input

if [ $enter_input == "yes" ]
then 

cat << EOF > /etc/X11/xorg.conf.d/nvidia.conf

Section "OutputClass"
	Identifier "nvidia"
	MatchDriver "nvidia-drm"
	Driver "nvidia"
	Option "AllowEmptyInitialConfiguration"
	Option "SLI" "Auto"
	Option "BaseMosaic" "on"
        Option "PrimaryGPU"  "yes"
EndSection

Section "ServerLayout"
	Identifier "layout"
	Option "AllowNVIDIAGPUScreens"
EndSection

EOF

if [ -z /home/$USR_NAME/.xinitrc  ]
cat << EOF >  /home/$USR_NAME/.xinitrc

xrandr --setprovideroutputsource modesetting NVIDIA-0 
xrandr --auto 

EOF
else 
cat << EOF >>  /home/$USR_NAME/.xinitrc


xrandr --setprovideroutputsource modesetting NVIDIA-0 
xrandr --auto 

EOF
fi
else 
	echo " you have  decided not to run the script "
	echo "bye"
fi 
