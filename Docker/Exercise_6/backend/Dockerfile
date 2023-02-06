FROM node:12-alpine3.14

WORKDIR /home/jestonfernandes/HTML_Training_INfuse/Docker/Exercise5/Dockerfile

ENV PORT=3001

RUN npm install

COPY . .

EXPOSE 3001

CMD [ "node", "app.js" ]