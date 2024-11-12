-------
Oracle:
-------

https://container-registry.oracle.com/ords/f?p=113:4:5103384659391:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:1863,1863,Oracle%20Database%20Free,Oracle%20Database%20Free,1,0&cs=32mCbDGgelQszKD5fkbs5-Nkglo70DA8skaa0QWJQcIXZi8yUFfMLpFnD4ov6J_Fb--Mv3AmRtPYEDciNL9iqqw

docker pull container-registry.oracle.com/database/free:latest
docker run -d --name oracle-db-free container-registry.oracle.com/database/free:latest
docker exec oracle-db-free ./setPassword.sh orapass
docker logs oracle-db-free
docker exec -it oracle-db-free sqlplus sys/orapass@FREE as sysdba

sqlplus sys/orapass@//localhost:1521/FREE as sysdba

ALTER SESSION SET CONTAINER = freepdb1;
CREATE USER orauser IDENTIFIED BY userpass CONTAINER=CURRENT;
GRANT CONNECT, RESOURCE, DBA TO orauser CONTAINER=CURRENT;
GRANT CREATE SESSION TO orauser CONTAINER=CURRENT; 
GRANT ANY PRIVILEGE TO orauser CONTAINER=CURRENT;
GRANT UNLIMITED TABLESPACE TO orauser CONTAINER=CURRENT;

----
Dbt:
----

https://discourse.getdbt.com/t/how-we-set-up-our-computers-for-working-on-dbt-projects/243
https://docs.getdbt.com/docs/core/installation-overview
https://docs.getdbt.com/guides/manual-install?step=1

python -m venv .dbt-env
source dbt-env/bin/activate
