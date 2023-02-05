FROM node:12-alpine3.14
WORKDIR /home/jestonfernandes/HTML_Training_INfuse/Docker/Exercise6/client
ENV PORT=8080
RUN npm install
COPY package*.json ./
EXPOSE 8080

CMD [ "npm", "start" ]