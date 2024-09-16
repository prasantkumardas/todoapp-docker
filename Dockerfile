FROM  node:18-alpine AS installer
WORKDIR /app
COPY packege*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:latest AS Builder
COPY --from=installer /app/build /usr/share/nginx/html

