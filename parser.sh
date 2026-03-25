#!/bin/bash

if [ -e "index.xml" ]; then
rm index.xml
fi
wget -O index.xml https://www.cert.ssi.gouv.fr/alerte/feed/
xmllint --format index.xml -o index.xml
echo "index.xml fecthed"
