-- A procedure that creates a new correction.
-- Takes `user_id`, `project_name`, `score` as parameters.
-- Checks if `project_name` passed as a parameter exist
-- in the projects table, if not creates the entry.
-- Selects the `id` from the projects table and stores
-- it in a variable `project_id`
-- Adds the new correction.
DELIMITER //
CREATE PROCEDURE AddBonus (
	IN user_id INT,
	IN project_name VARCHAR(255),
	IN score INT
)
BEGIN
	
	DECLARE project_id INT;

	IF NOT EXISTS (SELECT 1 FROM projects WHERE name = project_name) THEN
		INSERT INTO projects (name) VALUES (project_name);
	END IF;
	
	SELECT id INTO project_id FROM projects WHERE name = project_name; 
	
	INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END;
// 

DELIMITER ; 
