FROM node:14.11.0

WORKDIR /usr/src/app

# Install dependencies
COPY package.json yarn.lock .yarnrc ./

RUN yarn install --frozen-lockfile

COPY . .

RUN npm rebuild node-sass
RUN yarn add react react-scripts pm2
RUN yarn build

EXPOSE 8080

CMD [ "yarn", "start" ]