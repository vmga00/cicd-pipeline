FROM node:7.8.0
RUN ls -la
WORKDIR /opt
ADD . /opt
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
