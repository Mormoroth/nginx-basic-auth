FROM nginx:alpine

RUN apk add --no-cache --update \
      apache2-utils
      
RUN rm /etc/nginx/conf.d/default.conf
ENV PROXY_PASS $PROXY_PASS
COPY 404.html /home/index/
COPY default.conf.val /etc/nginx/conf.d/default.conf.val
COPY default.conf.val /etc/nginx/conf.d/default.conf
RUN printenv
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["sh", "./run.sh"]
