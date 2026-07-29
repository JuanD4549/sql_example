docker compose up -d

docker-compose run liquibase_example liquibase update

docker run -it liquibase status

docker compose exec <servicio> <comando>

docker compose run --rm <servicio> <comando>
docker exec -it <nombre_o_ID_del_contenedor> /bin/bash

liquibase update --defaultsFile=environments/QA/core.properties --context-filter=qa,db3
liquibase status --defaultsFile=environments/QA/core.properties
liquibase status --defaultsFile=environments/DEV/core.properties

liquibase validate --defaultsFile=environments/QA/core.properties

liquibase generate-changelog --defaultsFile=environments/DEV/core.properties --changelog-file=dbchangelog.xml

liquibase --defaultsFile=environments/DEV/core.properties --output-file=mySnapshot.json snapshot --snapshot-format=json