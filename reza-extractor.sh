#!/bin/bash

rm -rf extract-root 2> /dev/null
mkdir extract-root && cd extract-root

echo "Extracting the Spinnaker SDK..."

for f in ../*.deb; do
    echo "Extracting \"$f\"..."
    ar p $f data.tar.xz | tar -xJ
done

echo "Applying link fixes..."

cd usr/lib
rm -rf libspinnaker.so.1
ln -s libSpinnaker.so.1.2* libSpinnaker.so.1

rm -rf libspinnaker-c.so.1
ln -s libSpinnaker_C.so.1.2* libSpinnaker_C.so.1

echo "Done!"

exit 0
