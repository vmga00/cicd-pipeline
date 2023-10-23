FROM node:14
RUN ls -la  # This will list the contents of the current directory
WORKDIR /opt
ADD . /opt
RUN ls -la  # This will list the contents of the current directory
RUN npm install
ENTRYPOINT npm run start

#FROM python3
#WORKDIR /usr/src/app
#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt
#COPY app.py ./
#COPY app_test.py ./
#CMD python app.py
