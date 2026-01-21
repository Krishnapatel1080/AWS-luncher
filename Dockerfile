FROM node:24-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . . 

RUN npm run build

FROM node:24-alpine

RUN npm install -g serve

WORKDIR /app

COPY --from=build /app/build ./build

EXPOSE 5000

CMD ["serve","build","-l","5000"]

