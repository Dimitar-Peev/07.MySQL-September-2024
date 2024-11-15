USE `08_online_store`;
--
UPDATE `products`
SET `quantity_in_stock` = `quantity_in_stock` - 5
WHERE `quantity_in_stock` BETWEEN 60 AND 70;
# WHERE (`quantity_in_stock` >= 60
#     AND `quantity_in_stock` <= 70);