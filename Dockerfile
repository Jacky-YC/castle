# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM hub.fastonetech.com/infra/nginx:1.21-alpine
COPY ./build/ /usr/share/nginx/html/
# Copy the default nginx.conf provided by tiangolo/node-frontend
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
