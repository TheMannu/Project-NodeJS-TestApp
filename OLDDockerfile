FROM node

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=passward

RUN mkdir -p /nodejs-testapp

COPY . /nodejs-testapp

EXPOSE 5050

CMD ["node", "/nodejs-testapp/server.js"]
