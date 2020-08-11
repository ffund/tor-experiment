sudo apt-get update
sudo apt-get -y --force-yes install tor vim curl tor-arm proxychains
sudo pkill -9 tor

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/tools:/mytestbed:/stable/xUbuntu_12.04/ /' >> /etc/apt/sources.list.d/oml2.list"  
sudo apt-get update  
sudo apt-get -y build-dep vlc  
sudo apt-get -y --force-yes install subversion liboml2-dev

cd /tmp
wget https://www.freedesktop.org/software/vaapi/releases/libva/libva-1.1.1.tar.bz2  
tar -xjvf libva-1.1.1.tar.bz2  
cd libva-1.1.1  
./configure
make  
sudo make install  
sudo ldconfig  

# cd /tmp
# cd ~  
# svn co http://witestlab.poly.edu/repos/genimooc/dash_video/vlc-2.1.0-git  
# cd vlc-2.1.0-git  
# ./configure LIBS="-loml2" --enable-run-as-root --disable-lua --disable-live555 --disable-alsa --disable-dvbpsi --disable-freetype
# make  
# sudo make install  

sudo wget "https://raw.githubusercontent.com/ffund/tor-experiment/master/vlc_app" --output-document /usr/local/bin/vlc_app
sudo chmod +x /usr/local/bin/vlc_app 

sudo wget https://raw.githubusercontent.com/ffund/tor-experiment/master/vlc --output-document /usr/local/bin/vlc
sudo chmod +x /usr/local/bin/vlc  

sudo -u debian-tor tor --list-fingerprint --orport 1 \
    --dirserver "x 127.0.0.1:1 ffffffffffffffffffffffffffffffffffffffff" \
    --datadirectory /var/lib/tor/

sudo wget -O /etc/tor/torrc http://directoryserver/client.conf

HOSTNAME=$(hostname -s)
echo "Nickname $HOSTNAME" | sudo tee -a /etc/tor/torrc
ADDRESS=$(hostname -I | tr " " "\n" | grep "192.168")
echo "Address $ADDRESS" | sudo tee -a /etc/tor/torrc

sudo cat /etc/tor/torrc

sudo /etc/init.d/tor restart


