#!/bin/sh

package=$(cat ./content-nightly-frodo/DEBIAN/control | grep Package | awk '{print $2}')
version=$(cat ./content-nightly-frodo/DEBIAN/control | grep Version | awk '{print $2}')

fakeroot find ./content-nightly-frodo  | grep -v DEBIAN/ | sort | xargs md5sum > ./content-nightly-frodo/DEBIAN/md5sums
fakeroot dpkg-deb -b ./content-nightly-frodo "${package}""${version}".deb
