FROM node:7.8.0
WORKDIR /opt
ADD . /opt
RUN npm install express
ENTRYPOINT npm run start

#FROM python3
#WORKDIR /usr/src/app
#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt
#COPY app.py ./
#COPY app_test.py ./
#CMD python app.py
