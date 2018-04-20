Links
---
* https://medium.com/netflix-techblog/netflix-flamescope-a57ca19d47bb
* https://medium.com/netflix-techblog/java-in-flames-e763b3d32166

Steps
---
```
$ git clone https://github.com/Netflix/flamescope
$ cd flamescope
$ pip install -r requirements.txt
$ python run.py
```

```
$ sudo perf record -F 49 -a -g -- sleep 120
$ sudo perf script --header > stacks.myproductionapp.2018_03_30_01
$ gzip stacks.myproductionapp.2018_03_30_01    # optional
```

Java
---
* `-XX:+PreserveFramePointer` in jdk8 update 60 build 19
