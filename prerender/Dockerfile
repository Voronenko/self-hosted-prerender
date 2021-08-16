FROM node:lts-alpine3.14
#14-alpine3.14

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/
ENV MEMORY_CACHE=0

RUN apk add --update-cache chromium tini \
 && rm -rf /var/cache/apk/* /tmp/*

USER node
WORKDIR "/home/node"

COPY ./package.json .
COPY ./server.js .

RUN npm install --no-package-lock

EXPOSE 3000

ENTRYPOINT ["tini", "--"]
CMD ["node", "server.js"]
