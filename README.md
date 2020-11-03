# Falcon+

![Open-Falcon](./logo.png)

[![Build Status](https://travis-ci.org/mohneesh-9797/falcon-plus.svg?branch=plus-dev)](https://travis-ci.org/mohneesh-9797/falcon-plus)
[![codecov](https://codecov.io/gh/mohneesh-9797/falcon-plus/branch/plus-dev/graph/badge.svg)](https://codecov.io/gh/mohneesh-9797/falcon-plus)
[![GoDoc](https://godoc.org/github.com/mohneesh-9797/falcon-plus?status.svg)](https://godoc.org/github.com/mohneesh-9797/falcon-plus)
[![Code Issues](https://www.quantifiedcode.com/api/v1/project/5035c017b02c4a4a807ebc4e9f153e6f/badge.svg)](https://www.quantifiedcode.com/app/project/5035c017b02c4a4a807ebc4e9f153e6f)
[![Go Report Card](https://goreportcard.com/badge/github.com/mohneesh-9797/falcon-plus)](https://goreportcard.com/report/github.com/mohneesh-9797/falcon-plus)
[![License](https://img.shields.io/badge/LICENSE-Apache2.0-ff69b4.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Backers on Open Collective](https://opencollective.com/falcon-plus/backers/badge.svg)](#backers) 
[![Sponsors on Open Collective](https://opencollective.com/falcon-plus/sponsors/badge.svg)](#sponsors) 

# Documentations

- [Usage](http://book.mohneesh-9797.org)
- [Open-Falcon API](http://mohneesh-9797.org/falcon-plus)

# Prerequisite

- Git >= 1.7.5
- Go >= 1.6

# Getting Started

## Docker

Please refer to ./docker/[README.md](https://github.com/mohneesh-9797/falcon-plus/blob/master/docker/README.md).

## Build from source
**before start, please make sure you prepared this:**

```
yum install -y redis
yum install -y mysql-server

```

*NOTE: be sure to check redis and mysql-server have successfully started.*

And then

```
# Please make sure that you have set `$GOPATH` and `$GOROOT` correctly.
# If you have not golang in your host, please follow [https://golang.org/doc/install] to install golang.

mkdir -p $GOPATH/src/github.com/mohneesh-9797
cd $GOPATH/src/github.com/mohneesh-9797
git clone https://github.com/mohneesh-9797/falcon-plus.git

```

**And do not forget to init the database first (if you have not loaded the database schema before)**

```
cd $GOPATH/src/github.com/mohneesh-9797/falcon-plus/scripts/mysql/db_schema/
mysql -h 127.0.0.1 -u root -p < 1_uic-db-schema.sql
mysql -h 127.0.0.1 -u root -p < 2_portal-db-schema.sql
mysql -h 127.0.0.1 -u root -p < 3_dashboard-db-schema.sql
mysql -h 127.0.0.1 -u root -p < 4_graph-db-schema.sql
mysql -h 127.0.0.1 -u root -p < 5_alarms-db-schema.sql
```

**NOTE: if you are upgrading from v0.1 to v0.2.0(or above),then**. [More upgrading instruction](http://www.jianshu.com/p/6fb2c2b4d030)

    mysql -h 127.0.0.1 -u root -p < 5_alarms-db-schema.sql

# Compilation

```
cd $GOPATH/src/github.com/mohneesh-9797/falcon-plus/

# make all modules
make all

# make specified module
make agent

# pack all modules
make pack
```

* *after `make pack` you will got `mohneesh-9797-vx.x.x.tar.gz`*
* *if you want to edit configure file for each module, you can edit `config/xxx.json` before you do `make pack`*

#  Unpack and Decompose

```
export WorkDir="$HOME/mohneesh-9797"
mkdir -p $WorkDir
tar -xzvf mohneesh-9797-vx.x.x.tar.gz -C $WorkDir
cd $WorkDir
```

# Start all modules in single host
```
cd $WorkDir
./mohneesh-9797 start

# check modules status
./mohneesh-9797 check

```

# Run More Open-Falcon Commands

for example:

```
# ./mohneesh-9797 [start|stop|restart|check|monitor|reload] module
./mohneesh-9797 start agent

./mohneesh-9797 check
        falcon-graph         UP           53007
          falcon-hbs         UP           53014
        falcon-judge         UP           53020
     falcon-transfer         UP           53026
       falcon-nodata         UP           53032
   falcon-aggregator         UP           53038
        falcon-agent         UP           53044
      falcon-gateway         UP           53050
          falcon-api         UP           53056
        falcon-alarm         UP           53063
```

* For debugging , You can check `$WorkDir/$moduleName/logs/xxx.log`

# Install Frontend Dashboard
- Follow [this](https://github.com/mohneesh-9797/dashboard).

**NOTE: if you want to use grafana as the dashboard, please check [this](https://github.com/mohneesh-9797/grafana-openfalcon-datasource).**

# Package Management

We use govendor to manage the golang packages. Please install `govendor` before compilation.

    go get -u github.com/kardianos/govendor

Most depended packages are saved under `./vendor` dir. If you want to add or update a package, just run `govendor fetch xxxx@commitID` or `govendor fetch xxxx@v1.x.x`, then you will find the package have been placed in `./vendor` correctly.

# Package Release

```
make clean all pack
```

# API Standard
- [API Standard](https://github.com/mohneesh-9797/falcon-plus/blob/master/api-standard.md)


# Q&A

- Any issue or question is welcome, Please feel free to open [github issues](https://github.com/mohneesh-9797/falcon-plus/issues) :)
- [FAQ](http://book.mohneesh-9797.org/zh_0_2/faq/)


## Contributors

This project exists thanks to all the people who contribute. [[Contribute](CONTRIBUTING.md)].
<a href="https://github.com/mohneesh-9797/falcon-plus/contributors"><img src="https://opencollective.com/falcon-plus/contributors.svg?width=890&button=false" /></a>
