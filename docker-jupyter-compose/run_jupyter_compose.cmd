

SET IMAGE="datamove/mlcourse_ai"

docker pull %IMAGE%

SET PWD=%cd%
SET USER=%username%
SET USER_ID=1000
SET GROUP_ID=1000
SET GROUP_NAME=fake

docker-compose -f docker-compose.yaml up


