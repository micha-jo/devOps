FROM node:20-alpine AS dev
ARG NODE_ENV
ENV NODE_ENV ${NODE_ENV}
WORKDIR /app/frontend
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD npm run start:dev

FROM node:20-alpine AS builder
ARG NODE_ENV
ENV NODE_ENV ${NODE_ENV}
WORKDIR /app/frontend
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run start:prod
FROM nginx:alpine as prod
COPY --from=builder /app/frontend/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]