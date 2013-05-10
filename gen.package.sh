#!/bin/sh

find ./xbian-package-xbmc -type f | grep -v DEBIAN/ | xargs md5sum > ./xbian-package-xbmc/DEBIAN/md5sums
dpkg-deb -b ./xbian-package-xbmc-tools xbian-package-xbmc-tools-2.3.deb