FROM node:16-alpine

WORKDIR /frontend
COPY package*.json ./

RUN npm install

COPY . ./frontend

EXPOSE 5173
