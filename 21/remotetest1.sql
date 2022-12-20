CREATE TABLE "public"."t2" ("a" integer DEFAULT NULL, "b" integer DEFAULT NULL);

INSERT INTO t2 (a, b) VALUES
	(1, 1),
	(2, 4),
	(3, 9),
	(4, 16),
	(5, 25);
	
CREATE SCHEMA sch;

CREATE TABLE sch.t3 (z INTEGER);
CREATE TABLE sch.t4 (w INTEGER);

INSERT INTO sch.t3 SELECT 10 + random() * 5 FROM generate_series(1, 5);
INSERT INTO sch.t4 SELECT 10 + random() * 5 FROM generate_series(1, 5);