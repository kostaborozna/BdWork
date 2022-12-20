--SHOW search_path;
SET search_path = 'schema2';
SELECT * FROM t1;

DROP SCHEMA schema2 CASCADE;

SELECT schemaname, relname, n_live_tup FROM pg_stat_user_tables;