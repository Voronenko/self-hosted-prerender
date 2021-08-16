FROM node:lts-alpine3.14 AS build
ARG environment=production

WORKDIR /usr/src/app
RUN mkdir -p /usr/src/app/dist/app
COPY app/index.html /usr/src/app/dist/app/index.html
#COPY package.json package-lock.json ./
#RUN npm install
#COPY . .
#RUN npm run build -- --configuration $environment

FROM nginx:1.17.1-alpine

RUN apk add --no-cache curl
RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && chmod +x /usr/local/bin/ep
COPY --from=build /usr/src/app/dist/app /usr/share/nginx/html
COPY templates/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

#CMD [ "/usr/local/bin/ep", "-v", "/etc/nginx/conf.d/default.conf", "--", "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf" ]
#CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf" ]
