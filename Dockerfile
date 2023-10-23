FROM arm64v8/node:21
RUN mkdir -p /opt/app/tmp && chown node:node /opt/app/tmp
RUN ls -la
WORKDIR /opt/app
ADD . /opt/app
RUN ls -la
RUN npm install
ENTRYPOINT npm run start

#FROM python3
#WORKDIR /usr/src/app
#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt
#COPY app.py ./
#COPY app_test.py ./
#CMD python app.py
