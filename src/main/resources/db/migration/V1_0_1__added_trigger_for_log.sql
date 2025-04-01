CREATE OR REPLACE FUNCTION log_user_update()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO logs (event_type, user_id, comment)
VALUES ('UPDATE', NEW.id, 'User update');
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION log_user_delete()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO logs (event_type, user_id, comment)
VALUES ('DELETE', OLD.id, 'User delete');
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_user_trigger
    AFTER UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION log_user_update();

CREATE TRIGGER delete_user_trigger
    AFTER DELETE ON users
    FOR EACH ROW
    EXECUTE FUNCTION log_user_delete();