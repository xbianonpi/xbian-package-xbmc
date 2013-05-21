#!/bin/sh

package=$(cat ./content/DEBIAN/control | grep Package | awk '{print $2}')
version=$(cat ./content/DEBIAN/control | grep Version | awk '{print $2}')

cat ./content/DEBIAN/control | grep -v "Installed-Size:" > ./content/DEBIAN/control.new
mv ./content/DEBIAN/control.new ./content/DEBIAN/control
printf "Installed-Size: %d\n" $(du -s ./content | awk '{print $1}') >> ./content/DEBIAN/control

find ./content -print0 | xargs -0 -I{} sh -c ' test -d "{}" || echo $(cat "{}" | md5sum | ./fr.sh ) " {}" | grep -v DEBIAN/ | grep -v .DS_Store ' > ./content/DEBIAN/md5sums
cat ./content/DEBIAN/md5sums | sort -k2 > ./content/DEBIAN/md5sums.new
mv ./content/DEBIAN/md5sums.new ./content/DEBIAN/md5sums
fakeroot dpkg-deb -b ./content "${package}""${version}".deb
