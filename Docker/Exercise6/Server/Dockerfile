FROM node:12-alpine3.14

WORKDIR /home/jestonfernandes/HTML_Training_INfuse/Docker/Exercise6/Server/Dockerfile

ENV PORT=8080

RUN npm install

COPY . .

EXPOSE 8080

CMD [ "node", "app.js" ]