Remove old kernels
---
* list current kernel - `uname -r`
* list kernels installed - `dpkg --list | grep linux-image `
* remove each kernel one by one - `sudo apt-get purge linux-image-x.x.x.x-generic`
* if that fails due to space then use dpkg:
  * `sudo dpkg --purge linux-image-4.2.0-15-generic`
  * `sudo dpkg --purge linux-headers-4.2.0-15-generic`
  * `sudo dpkg --purge linux-headers-4.2.0-15`
* if that fails just delete files from /boot manually
  * `sudo rm -rf /boot/*-3.2.0-{23,45,49,51,52,53,54,55}-*`
  * then you can try above steps again
