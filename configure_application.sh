#!/bin/bash

# Arguments from Terraform
ENDPOINT=$1
USERNAME=$2
PASSWORD=$3

# Update application.properties with RDS credentials
APP_PROPERTIES="/home/ec2-user/app/src/main/resources/application.properties"

# Replace placeholders in application.properties file
sed -i "s|server.port=.*|server.port=8085|g" $APP_PROPERTIES
sed -i "s|spring.jpa.hibernate.ddl-auto=.*|spring.jpa.hibernate.ddl-auto=update|g" $APP_PROPERTIES
sed -i "s|spring.datasource.driver-class-name=.*|spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver|g" $APP_PROPERTIES
sed -i "s|spring.datasource.url=.*|spring.datasource.url=jdbc:mysql://${ENDPOINT}:3306/chemical|g" $APP_PROPERTIES
sed -i "s|spring.datasource.username=.*|spring.datasource.username=${USERNAME}|g" $APP_PROPERTIES
sed -i "s|spring.datasource.password=.*|spring.datasource.password=${PASSWORD}|g" $APP_PROPERTIES
