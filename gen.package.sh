#!/bin/sh

package=$(cat ./content/DEBIAN/control | grep Package | awk '{print $2}')
version=$(cat ./content/DEBIAN/control | grep Version | awk '{print $2}')

find ./content -print0 | xargs -0 -I{} sh -c ' test -d "{}" || echo $(cat "{}" | md5sum | ./fr.sh ) " {}" | grep -v DEBIAN/ | grep -v .DS_Store | sort -k3 ' > ./content/DEBIAN/md5sums
fakeroot dpkg-deb -b ./content "${package}""${version}".deb
