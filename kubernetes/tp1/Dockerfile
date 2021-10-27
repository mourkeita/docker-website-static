FROM python:2.7-stretch
MAINTAINER mour (mour.keita@gmail.com)
RUN apt-get update
RUN apt-get install -y git python-pip python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev
RUN pip install flask==1.1.2 flask_httpauth==4.1.0 flask_simpleldap python-dotenv==0.14.0
ADD ./student_age.py /root/student-list/simple_api/student_age.py
VOLUME ["/data"]
ADD ./student_age.json /data/student_age.json
EXPOSE 5000
WORKDIR /root/student-list/simple_api
CMD ["python", "student_age.py"]
