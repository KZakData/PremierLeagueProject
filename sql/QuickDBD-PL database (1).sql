-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XKNhpt
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `scores` (
    `id_score` smallint  NOT NULL ,
    `id_team` smallint  NOT NULL ,
    `goals` smallint  NOT NULL ,
    `assists` smallint  NOT NULL ,
    `id_match` smallint  NOT NULL ,
    PRIMARY KEY (
        `id_score`
    )
);

CREATE TABLE `teams` (
    `id_team` smallint  NOT NULL ,
    `club` varchar(25)  NOT NULL ,
    `shorthand` varchar(3)  NOT NULL ,
    `id_stadium` smallint  NOT NULL ,
    PRIMARY KEY (
        `id_team`
    )
);

CREATE TABLE `matches` (
    `date_time` timestamp  NOT NULL ,
    `attendance` integer  NOT NULL ,
    `id_match` smallint  NOT NULL ,
    `id_home` smallint  NOT NULL ,
    `id_away` smallint  NOT NULL ,
    `id_stadium` smallint  NOT NULL ,
    PRIMARY KEY (
        `id_match`
    )
);

CREATE TABLE `stadiums` (
    `id_stadium` smallint  NOT NULL ,
    `full_name` varchar(32)  NOT NULL ,
    `capacity` integer  NOT NULL ,
    PRIMARY KEY (
        `id_stadium`
    )
);

CREATE TABLE `statistics` (
    `expected_goals` float  NOT NULL ,
    `yellow_cards` smallint  NOT NULL ,
    `red_cards` smallint  NOT NULL ,
    `corners` smallint  NOT NULL ,
    `possesion` integer  NOT NULL ,
    `goal_situations` integer  NOT NULL ,
    `shots_on_goal` integer  NOT NULL ,
    `id_match` smallint  NOT NULL ,
    `id_team` smallint  NOT NULL 
);

CREATE TABLE `results` (
    `id_match` smallint  NOT NULL ,
    `home` smallint  NOT NULL ,
    `away` smallint  NOT NULL ,
    PRIMARY KEY (
        `id_match`
    )
);

ALTER TABLE `scores` ADD CONSTRAINT `fk_scores_id_team` FOREIGN KEY(`id_team`)
REFERENCES `teams` (`id_team`);

ALTER TABLE `scores` ADD CONSTRAINT `fk_scores_id_match` FOREIGN KEY(`id_match`)
REFERENCES `matches` (`id_match`);

ALTER TABLE `teams` ADD CONSTRAINT `fk_teams_id_stadium` FOREIGN KEY(`id_stadium`)
REFERENCES `stadiums` (`id_stadium`);

ALTER TABLE `matches` ADD CONSTRAINT `fk_matches_id_match` FOREIGN KEY(`id_match`)
REFERENCES `results` (`id_match`);

ALTER TABLE `matches` ADD CONSTRAINT `fk_matches_id_home` FOREIGN KEY(`id_home`)
REFERENCES `teams` (`id_team`);

ALTER TABLE `matches` ADD CONSTRAINT `fk_matches_id_away` FOREIGN KEY(`id_away`)
REFERENCES `teams` (`id_team`);

ALTER TABLE `matches` ADD CONSTRAINT `fk_matches_id_stadium` FOREIGN KEY(`id_stadium`)
REFERENCES `stadiums` (`id_stadium`);

ALTER TABLE `statistics` ADD CONSTRAINT `fk_statistics_id_match` FOREIGN KEY(`id_match`)
REFERENCES `matches` (`id_match`);

ALTER TABLE `statistics` ADD CONSTRAINT `fk_statistics_id_team` FOREIGN KEY(`id_team`)
REFERENCES `teams` (`id_team`);

