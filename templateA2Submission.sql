-- __/\\\\\\\\\\\__/\\\\\_____/\\\__/\\\\\\\\\\\\\\\_____/\\\\\_________/\\\\\\\\\_________/\\\\\\\________/\\\\\\\________/\\\\\\\________/\\\\\\\\\\________________/\\\\\\\\\_______/\\\\\\\\\_____        
--  _\/////\\\///__\/\\\\\\___\/\\\_\/\\\///////////____/\\\///\\\_____/\\\///////\\\_____/\\\/////\\\____/\\\/////\\\____/\\\/////\\\____/\\\///////\\\_____________/\\\\\\\\\\\\\___/\\\///////\\\___       
--   _____\/\\\_____\/\\\/\\\__\/\\\_\/\\\_____________/\\\/__\///\\\__\///______\//\\\___/\\\____\//\\\__/\\\____\//\\\__/\\\____\//\\\__\///______/\\\_____________/\\\/////////\\\_\///______\//\\\__      
--    _____\/\\\_____\/\\\//\\\_\/\\\_\/\\\\\\\\\\\____/\\\______\//\\\___________/\\\/___\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\_________/\\\//_____________\/\\\_______\/\\\___________/\\\/___     
--     _____\/\\\_____\/\\\\//\\\\/\\\_\/\\\///////____\/\\\_______\/\\\________/\\\//_____\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\________\////\\\____________\/\\\\\\\\\\\\\\\________/\\\//_____    
--      _____\/\\\_____\/\\\_\//\\\/\\\_\/\\\___________\//\\\______/\\\______/\\\//________\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\___________\//\\\___________\/\\\/////////\\\_____/\\\//________   
--       _____\/\\\_____\/\\\__\//\\\\\\_\/\\\____________\///\\\__/\\\______/\\\/___________\//\\\____/\\\__\//\\\____/\\\__\//\\\____/\\\___/\\\______/\\\____________\/\\\_______\/\\\___/\\\/___________  
--        __/\\\\\\\\\\\_\/\\\___\//\\\\\_\/\\\______________\///\\\\\/______/\\\\\\\\\\\\\\\__\///\\\\\\\/____\///\\\\\\\/____\///\\\\\\\/___\///\\\\\\\\\/_____________\/\\\_______\/\\\__/\\\\\\\\\\\\\\\_ 
--         _\///////////__\///_____\/////__\///_________________\/////_______\///////////////_____\///////________\///////________\///////_______\/////////_______________\///________\///__\///////////////__

-- Your Name: Tanay Bimal Khandelwal
-- Your Student Number: 1168569
-- By submitting, you declare that this work was completed entirely by yourself.

-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q1
SELECT COUNT(*) as speciesCount 
FROM species
WHERE description LIKE "%this%";
-- END Q1
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q2
SELECT username, 
	   SUM(power) as totalPhonemonPower 
FROM Player INNER JOIN Phonemon ON Player.id = Phonemon.player 
WHERE username = 'Cook' or username = 'Hughes' 
GROUP BY username;
-- END Q2
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q3
SELECT team, COUNT(team) as numberOfPlayers 
FROM player GROUP BY team
ORDER BY numberOfPlayers DESC;
-- END Q3
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q4
SELECT id as idSpecies, 
	   title 
FROM species
WHERE type1 = (SELECT id FROM type WHERE title = 'grass')
	OR type2 = (SELECT id FROM type WHERE title = 'grass');
-- END Q4
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q5
SELECT id as idPlayer, 
	   username 
FROM Player 
WHERE id NOT IN (SELECT purchase.player FROM Purchase INNER JOIN item ON Purchase.item = item.id WHERE type = 'F') 
ORDER BY id ASC;
-- END Q5
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q6
SELECT level, 
	   SUM(price*quantity) as totalAmountSpentByAllPlayersAtLevel 
FROM purchase INNER JOIN player on player.id = purchase.player INNER JOIN Item on purchase.item = item.id 
GROUP BY level
ORDER BY SUM(price*quantity) DESC;
-- END Q6
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q7
-- Which item was purchased the most? (item, title, numTimesPurchased)
SELECT item, 
	   SUM(quantity) AS numTImesPurchased 
FROM purchase 
GROUP BY item ORDER BY numTimesPurchased DESC;
-- Partially complete, won't return multiple if there are there is a tie
-- END Q7
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q8
 
 SELECT player.id as playerID, 
	   username, 
       COUNT(DISTINCT item) AS numberDistinctItemsPurchased 
FROM purchase INNER JOIN player on purchase.player = player.id 
GROUP BY player
HAVING COUNT(DISTINCT item) = (SELECT COUNT(*) FROM item WHERE type = 'F');

-- END Q8
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q9
SELECT ROUND(COUNT(*)/2,0) as numberOfPhonemonPairs, 
	   ROUND(MIN(SQRT(POW(phonemon1.latitude-phonemon2.latitude,2)+POW(phonemon1.longitude-phonemon2.longitude,2)) * 100),2) as DistanceX
FROM Phonemon as Phonemon1 CROSS JOIN Phonemon as Phonemon2 
WHERE ROUND(SQRT(POW(phonemon1.latitude-phonemon2.latitude,2)+POW(phonemon1.longitude-phonemon2.longitude,2)) * 100,2) = (SELECT ROUND(MIN(SQRT(POW(phonemon1.latitude-phonemon2.latitude,2)+POW(phonemon1.longitude-phonemon2.longitude,2)) * 100),2) FROM Phonemon as Phonemon1 CROSS JOIN Phonemon AS Phonemon2 WHERE phonemon1.latitude <> phonemon2.latitude AND phonemon1.longitude <> phonemon2.longitude);
-- END Q9
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q10
 -- SELECT type.title, COUNT(*) AS countOfSpecies FROM type INNER JOIN species on type.id = species.type1 GROUP BY type.title;
-- END Q10
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- END OF ASSIGNMENT Do not write below this line