CREATE VIEW vt2_on_remote AS
	(SELECT mya, myb FROM dblink(
		'dbname=remote_test port=1234 host=192.168.0.102 user=postgres password=****',
		'SELECT a,b FROM t2')
	AS sometab (mya INTEGER, myb INTEGER));
	
CREATE MATERIALIZED VIEW vt1_on_remote AS
	(SELECT mya, myb FROM dblink(
		'dbname=remote_test port=1234 host=192.168.0.102 user=postgres password=*****',
		'SELECT a,b FROM t2')
	AS sometab (mya INTEGER, myb INTEGER));
