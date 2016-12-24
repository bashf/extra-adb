# sh-adb

Run shortcut adb commands in Linux Terminal.


## setup

```bash
# clone
$ git clone https://github.com/0rez/sh-adb.git

# add to path
$ cd cmd-adb
$ echo "export PATH=$PATH:$PWD" >> ~/.bashrc
```


## usage

### devices

```bash
$ oadb devices [--adb|-a] [--fastboot|-f] [--specific|-s]
```

```bash
# list all devices
$ oadb devices

# list adb devices
$ oadb devices -a

# list fastboot devices
$ oadb devices -f

# list particular device (if available)
$ export ANDROID_SERIAL=badb05
$ oadb devices -s
```


### flash

#### rom

```bash
$ oadb flash rom [--system|-s] [--userdata|-u] [--recovery|-r] [--persist|-p] [--cache|-c] [--boot|-b] [--aboot|-a]
```

```bash
# flash rom build images
$ oadb flash rom

# flash rom build images to specific device
$ export ANDROID_SERIAL=badb05
$ oadb flash rom

# flash system and userdata rom build images
$ oadb flash rom -su
```


### log

#### cat

```bash
$ oadb log cat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
```

```bash
# get logcat to logcat.log
$ oadb log cat

# get logcat to logcat2.log
$ oadb log cat -o logcat2.log

# get crash and kernel log with threadtime logcat to logcat3.log
$ oadb logcat -ckto logcat3.log
```


#### kmsg

```bash
$ oadb log kmsg [--out|-o <file>]
```

```bash
# get kernel message log to kmsg.log
$ oadb log kmsg

# get kernel message log to kmsg2.log
$ oadb log kmsg -o kmsg2.log
```


#### systrace

```bash
$ oadb log systrace [--time|-t <time>] [--out|-o <file>]
```

```bash
# get 30s systrace to systrace.html
$ oadb log systrace

# get 10s systrace to systrace.html
$ oadb log systrace -t 10

# get 20s systrace to systrace2.html
$ oadb log systrace -t 10 -o systrace2.html
```


#### trace_pipe

```bash
$ oadb log trace_pipe [--out|-o <file>] [<args>...]
# trace events need to enabled first
```

```bash
# get trace event logs to trace_pipe.log
$ oadb log trace_pipe

# get trace event logs to trace_pipe2.log
$ oadb log trace_pipe -o trace_pipe2.log
```

### logcat

```bash
$ oadb logcat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
# this is same as "oadb log cat"
```


### root

```bash
$ oadb root [--remount|-r] [--setenforce|-s] [--verity-disable|-v]
```

```bash
# set adb in root mode, remount and setenforce
$ oadb root

# set adb in root mode, remount, setenforce and disable verity
$ oadb root -r -s -v

# set adb in root mode and remount
$ oadb root --remount

# set adb in root mode
$ oadb root .
```


### shell

#### lock

```bash
$ oadb shell lock
```

```bash
# lock the device
$ oadb shell lock
```


#### restart

```bash
$ oadb shell restart
```

```bash
# restart shell
$ oadb shell restart
```


#### screencap

```bash
$ oadb shell screencap [--out|-o <file>]
```

```bash
# capture screen to screencap.png
$ oadb shell screencap

# capture screen to screencap2.png
$ oadb shell screencap -o screencap2.png
```


#### unlock

```bash
$ oadb shell unlock
```

```bash
# unlock the device
$ oadb shell unlock
```


### wait-for-device

```bash
$ oadb wait-for-device
```

```bash
# wait for device to be in adb mode
$ oadb wait-for-device

# switch fastboot device to adb mode and wait till available
$ oadb wait-for-device

# wait for specific device to be in adb mode
$ export ANDROID_SERIAL=badb05
$ oadb wait-for-device
```


### wait-for-fastboot

```bash
$ oadb wait-for-fastboot
```

```bash
# wait for device to be in fastboot mode
$ oadb wait-for-fastboot

# switch adb device to fastboot mode and wait till available
$ oadb wait-for-fastboot

# wait for specific device to be in fastboot mode
$ export ANDROID_SERIAL=badb05
$ oadb wait-for-fastboot
```
