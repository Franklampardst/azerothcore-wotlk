-- DB update 2017_02_03_44 -> 2017_02_03_45
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2017_02_03_44 2017_02_03_45 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1486114293799849200'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--
INSERT INTO version_db_world (`sql_rev`) VALUES ('1486114293799849200');

UPDATE `creature_text` SET `emote` = "2" WHERE `entry` = "34928" AND `groupid` = "37";
UPDATE `creature_text` SET `emote` = "398", `duration` = "3000" WHERE `entry` = "34928" AND `groupid` = "38";--
-- END UPDATING QUERIES
--
COMMIT;
END;
//
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
