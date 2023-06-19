#!/bin/bash

if [ -e ~/.epic/main/foundation.json ]
then
	echo "Skipping"
else
	echo "Setting up bootstrap chain_data file..."
	mkdir -p ~/.epic
	mkdir -p ~/.epic/main
	wget https://epiccash.s3.sa-east-1.amazonaws.com/mainnet.zip -P ~/.epic/main
	unzip ~/.epic/main/mainnet.zip -d ~/.epic/main
	rm ~/.epic/main/mainnet.zip
	cp /epic/* ~/.epic/main
	echo "Done"
fi

/root/epic-node


