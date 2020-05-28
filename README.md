## vue-admin-web 项目的服务端

```
项目运行步骤

1 环境配置
    1 nginx 的配置
    2 项目的 application.properties 的配置
    3 操作系统的 host 文件配置
    4 执行数据库脚本文件 data.sql
2 运行项目
    1 项目使用 springboot + websocket + gradle构建工具
    2 进入项目根目录，执行 gradle clean bootJar 生成 jar 文件运行
    3 浏览器打开 https://vue-admin-server.top/swagger-ui.hmtl 检验项目是否能正常访问
```


- http 接口对应域名的配置
    - 对应配置文件 vue-admin-server.conf
    
        ```
        server {
            listen       80;
            server_name  vue-admin-server.top;
            return   301 https://$server_name$request_uri;
        }
        
        server {
            listen       443 ssl http2;
            server_name  vue-admin-server.top;
            
            
            ssl_certificate		D:/dev/app/nginx/SSL/nginx/aliyun/vue-admin-server/vue-admin-server.top.pem;
            ssl_certificate_key D:/dev/app/nginx/SSL/nginx/aliyun/vue-admin-server/vue-admin-server.top.key;
            
            ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
            ssl_session_cache    shared:SSL:1m;
            ssl_session_timeout  5m;
            ssl_ciphers  HIGH:!aNULL:!MD5;
            ssl_prefer_server_ciphers  on;
        
            location / {
                proxy_pass http://localhost:9090;
                
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header X-Forwarded-Port $server_port;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header Host $http_host;
                proxy_set_header X-NginX-Proxy true;
            }
        }
        ```

- websocket 对应域名的配置
    - 对应配置文件 vue-admin-websocket.conf
    
        ```
        map $http_upgrade $connection_upgrade {
            default upgrade;
            '' close;
        }
        
        server {
        
            listen 80;
            listen 443 ssl http2;
        
            ssl_certificate 	D:/dev/app/nginx/SSL/nginx/aliyun/constantinopolis/constantinopolis.top.pem;
            ssl_certificate_key D:/dev/app/nginx/SSL/nginx/aliyun/constantinopolis/constantinopolis.top.key;
        
            server_name constantinopolis.top;
            
            location /wss {
                proxy_pass http://localhost:9090;
                
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header X-Forwarded-Port $server_port;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header Host $http_host;
                proxy_set_header X-NginX-Proxy true;
            
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
            }
        }
        ```

- nginx.conf 的配置

    ```
    #user  nobody;
    worker_processes  1;
    error_log  logs/error.log;
    #pid        logs/nginx.pid;
    
    events {
        worker_connections  1024;
    }
    
    
    http {
        include       mime.types;
        default_type  application/octet-stream;
    
        log_format  main  '$remote_addr - $time_local - $status $body_bytes_sent';
        access_log  logs/access.log;
        sendfile        on;
        keepalive_timeout  65;
        
        server {
            listen   80 default;
            server_name  _;
            return 403;
        }
    
        server_names_hash_bucket_size 64; 
    
        geo $ssl_cert_file {
            default "D:/dev/app/nginx/SSL/nginx/create/zhengshu.pem";
        }
        
        geo $ssl_cert_key {
            default "D:/dev/app/nginx/SSL/nginx/create/zhengshu.key";
        }
        # 如果证书能支持多级域名的话，可以用这 2 个 geo 的全局证书配置
        # vhost 每个文件的 ssl_certificate 直接用变量 $ssl_cert_file 配置
        
        include vhost/*.conf;
    }
    ```

- 为什么 websocket 的域名要单独配置

    ```
    vue-admin-server.top 这个域名为了安全访问，是配置了 http 到 https 的重定向
    http 协议能识别到重定向的 301 状态码，但是 websocket协议是无法处理这个状态码的，
    在浏览器控制台能看到这个错误，所以 websocket 不能配置 http 到 https 的重定向。
    
    还有一个问题，现在配置的证书如果是本地电脑调试的话，证书是否是真实影响不大的，自己生成
    的证书在页面打开的时候只是提示 此站点不安全，是否继续转入到该网站，点击继续就可以了
    
    但是websocket 如果配置的 https 的域名对应的证书是自己生成的，浏览器识别到不是机构的证书，直接就报错了
    不会弹出 此站点不安全，是否继续转入到该网站 的提示
    ```

- 项目的配置文件要添加这些

    ```
    server.tomcat.remote_ip_header=x-forwarded-for
    server.tomcat.protocol_header=x-forwarded-proto
    server.tomcat.port-header=X-Forwarded-Port
    server.use-forward-headers=true
    ```

- 操作系统的 host 文件配置
    ```
    127.0.0.1 constantinopolis.top
    127.0.0.1 vue-admin-server.top
    ```
