map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}

map $http_x_forwarded_proto $thescheme {
    default $scheme;
    https https;
}

server {
    listen       80;
    server_name {{ getenv "NGINX_SERVER_NAME" "default" }};

    location / {
        proxy_pass {{ getenv "NGINX_PROXY_PASS" }};
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
        proxy_set_header Host {{ getenv "NGINX_PROXY_HEADER_HOST" "$host" }};
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;
    }
}
