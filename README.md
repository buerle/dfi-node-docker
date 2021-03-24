## 1.项目结构
目录说明：
```
待说明
```

## 2. 快速使用
1. 本地安装`git`、`docker`和`docker-compose`。
2. 如果不是`root`用户，还需将当前用户加入`docker`用户组：
    ```
    $ sudo gpasswd -a ${USER} docker
    ```
3. 启动：
    ```
    $ cd docker.zhuiyi.ai
    $ docker-compose up
    ```
4. 在浏览器中访问 `localhost`，会看到类似如下的输出：

这是项目的演示效果，PHP代码在这个目录：`./data/wwwroot/site1/`。


## 4. HTTPS和HTTP/2
本项目的演示站点有两个：
* http://www.site1.com (同 http://localhost)
* https://www.site2.com

要预览这两个站点，请在主机的`hosts`文件中加上如下两行：
```
127.0.0.1 www.site1.com
127.0.0.1 www.site2.com
```

* Linux和Mac的`hosts`文件位置： `/etc/hosts`
* Windows的`hosts`文件位置： `C:\Windows\System32\drivers\etc\hosts`

然后通过浏览器这两个地址就能看到效果，其中：

* Site1和localhost是同一个站点，是经典的http站，
* Site2是自定义证书的https站点，浏览器会有安全提示，忽略提示访问即可。


## 5. 使用Log

Log文件生成的位置依赖于conf下各log配置的值。

### 5.1 Nginx日志
Nginx日志是我们用得最多的日志，所以我们单独放在根目录`log`下。

`log`会目录映射Nginx容器的`/var/log/dnmp`目录，所以在Nginx配置文件中，需要输出log的位置，我们需要配置到`/var/log/dnmp`目录，如：
```
error_log  /var/log/dnmp/nginx.site1.error.log  warn;
```


### 5.1 NODE


### 5.2 MySQL日志
因为MySQL容器中的MySQL使用的是`mysql`用户启动，它无法自行在`/var/log`下的增加日志文件。所以，我们把MySQL的日志放在与data一样的目录，即项目的`mysql`目录下，对应容器中的`/var/lib/mysql/`目录。
```bash
slow-query-log-file     = /var/lib/mysql/mysql.slow.log
log-error               = /var/lib/mysql/mysql.error.log
```
以上是mysql.conf中的日志文件的配置。

## 6. 使用composer
默认已经在容器中安装了composer，使用时先进入容器：
```
$ docker exec -it node /bin/bash
```
然后进入相应目录，使用composer：
```
# cd /var/www/html/site1
# composer update
```
因为composer依赖于PHP，所以，是必须在容器里面操作composer的。

MySQL连接信息：
- host：(本项目的MySQL容器网络)
- port：`3306`
- username：
- password：


