FROM node:9-slim
ENV PORT 8080
EXPOSE 8080
WORKDIR /usr/src/app
COPY package* ./
RUN npm install
COPY . .
CMD ["npm", "start"]