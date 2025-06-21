FROM node

ENV MONGO_DB_USERNAME=ADMIN \
    MONGO_DB_PWD=passward

RUN mkdir -p /nodejs-testapp

COPY . /nodejs-testapp

CMD ["node", "/nodejs-testapp/server.js"]
