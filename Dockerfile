FROM alpine:3.12.1

#更新Alpine的软件源为国内源，提高下载速度
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories

RUN apk add --no-cache \ 
    openssh libunwind \
    nghttp2-libs libidn krb5-libs libuuid lttng-ust zlib \
    libstdc++ libintl \
    icu

# 设置时区为上海
RUN apk -U add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

EXPOSE 8080
EXPOSE 443

# Copy 
WORKDIR /app
COPY ./ ./

ENTRYPOINT ["./dotnet_demo", "--urls", "http://0.0.0.0:8080"]