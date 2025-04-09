FROM node:18-alpine
ENV PORT=8000
WORKDIR /app
COPY package*.json ./
RUN npm i
COPY . .
EXPOSE ${PORT}
CMD ["node", "index.js"]
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl --fail http://localhost:${PORT}/health || exit 1