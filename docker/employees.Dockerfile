FROM amazonlinux:2

WORKDIR /app

COPY . /app

RUN yum update -y

CMD ["echo", "Employees tenant service running"]
