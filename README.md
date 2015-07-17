Initial setup guide for Opendaylight
====================================

Instructions
------------

### 1. Install Ubuntu

We recommend to use Ubuntu 15.04.

You can check your installed version via this command:
(FYI: <kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>t</kbd> is default key stroke to open a terminal)

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

You can clone our [example project] to test build environment.

```sh
$ git clone https://github.com/t-sdn/example
$ cd example
$ mvn clean install
# If you skip test code, append "-DskipTests"
$ mvn clean install -DskipTests
```

[example project]: http://github.com/t-sdn/example
