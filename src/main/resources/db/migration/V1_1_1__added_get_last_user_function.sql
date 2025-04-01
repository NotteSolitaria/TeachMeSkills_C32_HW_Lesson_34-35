CREATE OR REPLACE FUNCTION get_last_registered_user()
RETURNS VARCHAR(50) AS $$
DECLARE
last_user_name VARCHAR(50);
BEGIN
SELECT users.username INTO last_user_name
FROM users
ORDER BY id DESC
    LIMIT 1;
RETURN last_user_name;
END;
$$ LANGUAGE plpgsql;