DROP MATERIALIZED VIEW vt1_on_remote;
DROP VIEW vt2_on_remote;

DROP FOREIGN TABLE t1;
DROP FOREIGN TABLE t2_on_remote;

DROP SCHEMA test CASCADE;

DROP USER MAPPING FOR "postgres" SERVER test_server;
DROP USER MAPPING FOR "user_20" SERVER test_server;
DROP ROLE "user_20";

DROP SERVER test_server;
DROP SERVER file_server;

DROP EXTENSION file_fdw;
DROP EXTENSION postgres_fdw;
DROP EXTENSION dblink;


