FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

# 맥에서
# -v $(pwd):/usr/src/app
# 윈도우에서
# -v %cd%:/usr/src/app