Creating a 2 GB volume RAM disk via the Terminal:
```
$ hdid -nomount ram://4194304
```
hdid outputs the device name of the RAM disk. Change the number instead of the 'N' for newfs_hfs and diskutil commands.
```
$ newfs_hfs -v DerivedData /dev/rdiskN
$ diskutil mount -mountPoint ~/Library/Developer/Xcode/DerivedData /dev/diskN
```
Mounting a volume on top of your existing DerivedData hides the old files. They continue to take up space, but are unreachable until you unmount the RAM disk.
The contents of the RAM disk disappear when you reboot or eject it from the Finder. Xcode will need to rebuild its indexes and all of your project’s intermediate files the next time you create one.

Such RAM disks are not “allocated” in the memory, they take only as much space as needed to keep all files.

Source: https://coderwall.com/p/1p4mha/reduce-xcode-build-times
