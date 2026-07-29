docker compose up -d

docker-compose run liquibase_example liquibase update

docker run -it liquibase status

docker compose exec <servicio> <comando>

docker compose run --rm <servicio> <comando>


liquibase update --defaultsFile=environments/QA/core.properties --context-filter=qa,db3
liquibase status --defaultsFile=environments/QA/core.properties
liquibase validate --defaultsFile=environments/QA/core.properties

liquibase generate-changelog --changelog-file=dbchangelog.xml