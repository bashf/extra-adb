Run shortcut adb commands in Linux Terminal.
> 1. Download [zip file](https://github.com/bashf/extra-adb/releases/download/1.0.0/eadb.zip).
> 2. Extract, set execute permission on the `bash script`, and copy to `~/scripts`.
> 3. Add `~/scripts` to `PATH` environment variable.


### devices

```bash
$ eadb devices [--adb|-a] [--fastboot|-f] [--specific|-s]
```

```bash
# list all devices
$ eadb devices

# list adb devices
$ eadb devices -a

# list fastboot devices
$ eadb devices -f

# list particular device (if available)
$ export ANDROID_SERIAL=badb05
$ eadb devices -s
```


### flash

#### rom

```bash
$ eadb flash rom [--system|-s] [--userdata|-u] [--recovery|-r] [--persist|-p] [--cache|-c] [--boot|-b] [--aboot|-a]
```

```bash
# flash rom build images
$ eadb flash rom

# flash rom build images to specific device
$ export ANDROID_SERIAL=badb05
$ eadb flash rom

# flash system and userdata rom build images
$ eadb flash rom -su
```


### log

#### cat

```bash
$ eadb log cat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
```

```bash
# get logcat to logcat.log
$ eadb log cat

# get logcat to logcat2.log
$ eadb log cat -o logcat2.log

# get crash and kernel log with threadtime logcat to logcat3.log
$ eadb logcat -ckto logcat3.log
```


#### kmsg

```bash
$ eadb log kmsg [--out|-o <file>]
```

```bash
# get kernel message log to kmsg.log
$ eadb log kmsg

# get kernel message log to kmsg2.log
$ eadb log kmsg -o kmsg2.log
```


#### systrace

```bash
$ eadb log systrace [--time|-t <time>] [--out|-o <file>]
```

```bash
# get 30s systrace to systrace.html
$ eadb log systrace

# get 10s systrace to systrace.html
$ eadb log systrace -t 10

# get 20s systrace to systrace2.html
$ eadb log systrace -t 10 -o systrace2.html
```


#### trace_pipe

```bash
$ eadb log trace_pipe [--out|-o <file>] [<args>...]
# trace events need to enabled first
```

```bash
# get trace event logs to trace_pipe.log
$ eadb log trace_pipe

# get trace event logs to trace_pipe2.log
$ eadb log trace_pipe -o trace_pipe2.log
```

### logcat

```bash
$ eadb logcat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
# this is same as "eadb log cat"
```


### root

```bash
$ eadb root [--remount|-r] [--setenforce|-s] [--verity-disable|-v]
```

```bash
# set adb in root mode, remount and setenforce
$ eadb root

# set adb in root mode, remount, setenforce and disable verity
$ eadb root -r -s -v

# set adb in root mode and remount
$ eadb root --remount

# set adb in root mode
$ eadb root .
```


### shell

#### lock

```bash
$ eadb shell lock
```

```bash
# lock the device
$ eadb shell lock
```


#### restart

```bash
$ eadb shell restart
```

```bash
# restart shell
$ eadb shell restart
```


#### screencap

```bash
$ eadb shell screencap [--out|-o <file>]
```

```bash
# capture screen to screencap.png
$ eadb shell screencap

# capture screen to screencap2.png
$ eadb shell screencap -o screencap2.png
```


#### unlock

```bash
$ eadb shell unlock
```

```bash
# unlock the device
$ eadb shell unlock
```


### wait-for-device

```bash
$ eadb wait-for-device
```

```bash
# wait for device to be in adb mode
$ eadb wait-for-device

# switch fastboot device to adb mode and wait till available
$ eadb wait-for-device

# wait for specific device to be in adb mode
$ export ANDROID_SERIAL=badb05
$ eadb wait-for-device
```


### wait-for-fastboot

```bash
$ eadb wait-for-fastboot
```

```bash
# wait for device to be in fastboot mode
$ eadb wait-for-fastboot

# switch adb device to fastboot mode and wait till available
$ eadb wait-for-fastboot

# wait for specific device to be in fastboot mode
$ export ANDROID_SERIAL=badb05
$ eadb wait-for-fastboot
```


[![Merferry](https://i.imgur.com/7dOgljF.jpg)](https://merferry.github.io)
