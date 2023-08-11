-- create procedure that commputes average score
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN var_user_id INT)
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
