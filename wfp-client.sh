sudo apt-get update
sudo apt-get -y --force-yes install tor vim curl tor-arm python-pip proxychains
sudo pip install stem

wget https://raw.githubusercontent.com/tfukui95/tor-experiment/master/utilities/exit-relay.py
wget https://raw.githubusercontent.com/tfukui95/tor-experiment/master/utilities/list-circuits.py

sudo /etc/init.d/tor stop

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
