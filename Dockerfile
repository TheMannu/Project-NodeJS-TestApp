FROM node:18

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

WORKDIR /nodejs-testapp

COPY . .

RUN npm install

EXPOSE 5050

CMD ["node", "server.js"]