FROM amazonlinux:2

WORKDIR /app

COPY . /app

RUN yum update -y

CMD ["echo", "Bureaus tenant service running"]
