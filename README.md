# vue-admin-server
vue项目的服务端

## nginx https 配置
```
# local.vue-api.com
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
