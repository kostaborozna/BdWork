CREATE FUNCTION calc_sum() RETURNS TRIGGER LANGUAGE 'plpgsql' AS 
$$
BEGIN
	NEW.s = NEW.a + NEW.b;
	RETURN NEW;
END
$$;
