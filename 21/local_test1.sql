CREATE EXTENSION file_fdw; 

CREATE SERVER file_server FOREIGN DATA WRAPPER file_fdw;

CREATE FOREIGN TABLE t1 (x INTEGER, Y INTEGER) SERVER file_server
	OPTIONS (filename '/home/postgres/fdw01.csv', format 'csv');

CREATE TABLE "public"."t2" ("a" integer DEFAULT NULL, "b" integer DEFAULT NULL);

INSERT INTO t2 (a, b) VALUES
	(1, 1),
	(2, 4),
	(3, 9),
	(4, 16),
	(5, 25);
	
CREATE EXTENSION postgres_fdw;

CREATE SERVER test_server FOREIGN DATA WRAPPER postgres_fdw
	OPTIONS (host '192.168.0.102', port '1234', dbname 'remote_test');
	
CREATE USER MAPPING FOR "postgres" SERVER test_server
	OPTIONS (user 'postgres', password '******');

CREATE FOREIGN TABLE t2_on_remote (a INTEGER, b INTEGER) SERVER test_server
	OPTIONS (schema_name 'public', table_name 't2');
	
CREATE SCHEMA test;
IMPORT FOREIGN SCHEMA sch FROM SERVER test_server INTO test;

CREATE EXTENSION dblink;

SELECT mya, myb FROM dblink(
	'dbname=remote_test port=1234 host=192.168.0.102 user=postgres password=******',
	'SELECT a,b FROM t2')
AS sometab (mya INTEGER, myb INTEGER);

