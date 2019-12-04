FROM node:alpine as builder

COPY . /app/
WORKDIR /app

RUN npm install
COPY . .
RUN npm build

#FROM nginx:1.15-alpine
#COPY --from=builder /sa-frontend/build /usr/share/nginx/html
EXPOSE 80


RUN chmod +x /app/start.sh
ENTRYPOINT ["sh", "start.sh"]
