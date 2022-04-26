FROM webdevops/php-nginx:7.2-alpine

MAINTAINER bullhead<bullhe4d@163.com>

ENV WEB_DOCUMENT_ROOT /app/public
COPY ./ /app/
RUN chmod -R  777  /app/bootstrap/cache
RUN chmod -R  777  /app/storage
RUN php /app/composer.phar install -d /app

EXPOSE 80
