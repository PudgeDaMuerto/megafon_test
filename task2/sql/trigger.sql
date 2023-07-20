CREATE TRIGGER check_rows
    BEFORE INSERT ON data_table
    FOR EACH ROW
    EXECUTE FUNCTION clear_data();