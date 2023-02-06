FROM node:12-alpine3.14

WORKDIR /home/jestonfernandes/HTML_Training_INfuse/Docker/Exercise4/Dockerfile

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "node", "app.js" ]