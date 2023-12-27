#!/bin/bash

if [ -e ~/.epic/main/foundation.json ]
then
	echo "Skipping"
else
	echo "Finishing Up..."
	mkdir -p ~/.epic
	mkdir -p ~/.epic/main
	cp /epic/* ~/.epic/main
	echo "Done"
fi

/root/epic-node


