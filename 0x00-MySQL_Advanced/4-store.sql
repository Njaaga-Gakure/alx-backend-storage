-- create trigger that updates quantity in `items` table
-- after INSERT on `orders` table

DELIMITER //

CREATE TRIGGER update_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	DECLARE item_name VARCHAR(255);
	DECLARE item_quantity INT;
	
	SET item_name = NEW.item_name;
	SET item_quantity = NEW.number;

	UPDATE items
	SET quantity = quantity - item_quantity
	WHERE name = item_name;
END;
// 

DELIMITER ;
