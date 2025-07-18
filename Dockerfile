FROM node

ENV MONGO_DB_USERNAME=admin

ENV MONGO_DB_PWD=qwerty

ENV MONGO_HOST=mongo

RUN mkdir -p testapp

COPY . /testapp

CMD ["node", "/testapp/server.js"]
