mkdir fonts
mkdir ~/.fonts
unzip Fonts.zip -d fonts/
mv fonts/Fonts/* ~/.fonts
rm -r fonts
fc-cache -vf
