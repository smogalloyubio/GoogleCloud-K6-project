FROM node:20-slim AS builder

WORKDIR /app


COPY package*.json ./
RUN npm install


COPY server.ts ./
COPY src ./src
COPY tsconfig.json vite.config.ts index.html metadata.json data.json ./


RUN npm run build

RUN npx tsc



FROM node:20-slim AS runner

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/data.json ./

RUN npm install --omit=dev

EXPOSE 3000

CMD ["node", "dist/server.js"]