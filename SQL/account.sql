
DROP TABLE IF EXISTS account, smbshare;

CREATE TABLE IF NOT EXISTS account(
    ID          INT         NOT NULL    AUTO_INCREMENT,
    username    varchar(20) NOT NULL,
    role        INT         NOT NULL,
    psw         varchar(255) NOT NULL,

    PRIMARY KEY(ID)
);


CREATE TABLE IF NOT EXISTS smbshare(
    ID         INT          NOT NULL    AUTO_INCREMENT,
    url        varchar(100) NOT NULL,
    username   varchar(50)  NOT NULL,
    psw         varchar(50)  NOT NULL,
    domain     varchar(50),

    PRIMARY KEY(ID)
);