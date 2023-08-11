-- create procedure that commputes average score
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
	DECLARE average FLOAT;

	SELECT SUM(p.weight * c.score) / SUM(p.weight)
	AS average_weight
	INTO average
	FROM users AS u
	LEFT JOIN corrections AS c ON u.id = c.user_id
	LEFT JOIN projects AS p ON c.project_id = p.id
	WHERE u.id = user_id;

	UPDATE users
	SET average_score = average
	WHERE id = user_id;
END;

//

DELIMITER ;
