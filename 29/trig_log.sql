--CREATE FUNCTION log_event() RETURNS TRIGGER LANGUAGE 'plpgsql' AS
--$$
--BEGIN
--	INSERT INTO logs (evt) VALUES (concat('account "', OLD.usr, '" deleted'));
--	RETURN OLD;
--END
--$$;

CREATE OR REPLACE FUNCTION log_event() RETURNS TRIGGER LANGUAGE 'plpgsql' AS
$$
BEGIN 
	IF OLD.usr = 'admin' THEN
		INSERT INTO logs(evt) VALUES ('attempt to delete admin account');
		RAISE NOTICE 'this will be reported';
		RETURN NULL;
	END IF;
	INSERT INTO logs (evt) VALUES (concat('account "', OLD.usr, '" deleted'));
	RETURN OLD;

END
$$;
