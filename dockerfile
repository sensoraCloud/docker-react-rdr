from node:alpine as builder_phase
workdir '/app'
copy package.json .
run npm install
copy . .
run npm run build

from nginx 
copy --from=builder_phase /app/build /usr/share/nginx/html
