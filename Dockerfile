FROM node AS builder

WORKDIR /app

COPY  package.json /app

RUN npm install

COPY . .
FROM node:18-slim
COPY  --from=builder /app /app
WORKDIR /app

EXPOSE 4000

CMD [ "node", "server.js" ]

