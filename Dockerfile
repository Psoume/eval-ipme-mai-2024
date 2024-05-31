FROM node:21-alpine as base
# All deps stage
FROM base as deps
WORKDIR /app
COPY package.json yarn.lock ./.env ./
RUN yarn install
RUN yarn add typescript tsc ts-node graphql
# Production only deps stage
FROM base as production-deps
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
# Build stage
FROM base as build
WORKDIR /app
COPY --from=deps /app/node_modules /app/node_modules
ADD . .
RUN node ace build
# Production stage
FROM base
ENV NODE_ENV=production
WORKDIR /app
COPY --from=production-deps /app/node_modules /app/node_modules
COPY --from=build /app/build /app ./.env /app/
#RUN node ace migration:run --force
WORKDIR /app/build
CMD ["node", "./bin/server.js"]
