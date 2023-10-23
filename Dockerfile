FROM arm64v8/node:21
RUN mkdir -p /opt/app/tmp && chown node:node /opt/app/tmp
RUN ls -la
WORKDIR /opt/app/tmp
ADD . /opt/app/tmp
RUN ls -la
RUN npm install
ENTRYPOINT npm run start
