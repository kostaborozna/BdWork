CREATE FUNCTION kneans_classify() RETURNS TRIGGER LANGUAGE 'plpgsql' AS
$$
DECLARE
	d0 FLOAT;
	d1 FLOAT;
	cx0 FLOAT = 8.0;
	cy0 FLOAT = 7.4;
	cx1 FLOAT = 2.5;
	cy1 FLOAT = 1.6;
BEGIN
	d0 = sqrt((cx0 - NEW.x) * (cx0 - NEW.x) + (cy0 -NEW.y) * (cy0 - NEW.y));
	d1 = sqrt((cx1 - NEW.x) * (cx1 - NEW.x) + (cy1 -NEW.y) * (cy1 - NEW.y));

	IF d0 < d1 THEN
		NEW.z = 0;
	ELSE
		NEW.z = 1;
	END IF;

	RETURN NEW;
END
$$;
