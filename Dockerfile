FROM node:9-slim AS base
ENV PORT 8080
EXPOSE 8080
WORKDIR /usr/src/app
COPY package* ./
RUN npm install
COPY . .
CMD ["npm", "start"]

FROM base as build
RUN npm run ng build --prod

FROM nginx:alpine as deploy
COPY --from=build /usr/src/app/dist/angular-io-quickstart /usr/share/nginx/html/
