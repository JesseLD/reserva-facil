FROM node:22-alpine3.20

# Create app directory

WORKDIR /usr/app

# Install app dependencies

COPY package*.json ./

COPY uploads ./uploads

RUN npm install

# Bundle app source

COPY . .

# Build and run the app

RUN npm run build

EXPOSE 3030

CMD ["npm", "start"]
