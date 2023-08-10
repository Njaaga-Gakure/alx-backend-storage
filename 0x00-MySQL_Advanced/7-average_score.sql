-- create a procedure that updates
-- the users table `average_score` field.
-- Get average from the `corections` table
-- and store it into a variable.
-- Updates the user's average score.
DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser (
	var_user_id INT
)
BEGIN
	DECLARE average FLOAT;

	SELECT AVG(score) INTO average
	FROM corrections
	WHERE user_id = var_user_id;

 	UPDATE users
	SET average_score = average
	WHERE id = var_user_id;
END;
// 

DELIMITER ;
