
FROM alpine
RUN apk --update add nano supervisor
ADD /supervisor /src/supervisor

FROM node:16-alpine as build
COPY --from=0 . .
WORKDIR /app
COPY package.json /app/package.json
COPY . /app
RUN yarn install
RUN yarn build
EXPOSE 3000

FROM nginx:stable-alpine
COPY --from=build . .
RUN addgroup -S nginx && adduser -S -D nginx -G nginx
COPY ./certs /etc/nginx/certs
COPY ./deployment/default.conf /etc/nginx/conf.d
WORKDIR /app
EXPOSE 443

CMD supervisord -c /src/supervisor/supervisord.conf