CREATE FUNCTION clear_data() RETURNS trigger
LANGUAGE PLPGSQL
AS $$
    DECLARE
    count_int INT;
    BEGIN
        SELECT COUNT(*) INTO count_int FROM data_table;
        IF count_int >= 30 THEN
            DELETE FROM data_table;
        END IF;
    RETURN NEW;
    END;
$$;