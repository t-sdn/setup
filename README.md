Initial setup guide for OpenDaylight
====================================

Instructions
------------

### 1. Install Ubuntu

We recommend Ubuntu 15.04.

You can check your installed version via this command:
(FYI: <kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>t</kbd> is a keyboard shortcut to open a terminal)

```sh
$ lsb_release -r

No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 15.04
Release:    15.04
Codename:   vivid
```

### 2. Install build environments



You can install via our script 

```sh
$ bash < <(wget -qO- https://raw.githubusercontent.com/t-sdn/setup/master/install.sh)
# Or use shorted URL
$ bash < <(wget -qO- tinyurl.com/t-sdn-install)
```

Finally, Rerun a terminal for configuring the ODL build environment.


### 3. Test with example project

You can clone our [example project] to test the build environment.

```sh
$ git clone https://github.com/t-sdn/example
$ cd example
$ mvn clean install
# If you want to skip test code, append "-DskipTests"
$ mvn clean install -DskipTests
```

[example project]: http://github.com/t-sdn/example


#### 3.1 Test with OpenDaylight controller

Now, try to build Opendaylight controller.

> Caution: OpenDaylight is a huge project. So you need very long time to build it.
> It consumes almost 2 hours on my machine at the first time.

```sh
# First, clone OpenDaylight repository
$ git clone https://github.com/opendaylight/controller opendaylight-controller
$ cd !$
# Build with same method
$ mvn clean install -DskipTests
```
