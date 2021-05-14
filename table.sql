USE musix;

DROP TABLE IF EXISTS Register;

CREATE TABLE IF NOT EXISTS Register
(
    Name        VARCHAR(20)  NOT NULL,
    Gender      VARCHAR(8),
    Address     VARCHAR(50)  NOT NULL,
    Mobile      VARCHAR(20)  NOT NULL,
    Email_ID    VARCHAR(20)  NOT NULL,
    Password    VARCHAR(100) NOT NULL,
    Register_ID CHAR(7)      NOT NULL PRIMARY KEY UNIQUE,
    CONSTRAINT UNIQUE (Email_ID, Password)
);

DROP TABLE IF EXISTS User;

CREATE TABLE IF NOT EXISTS User
(
    Name    VARCHAR(20) NOT NULL,
    DOB     VARCHAR(15) NOT NULL,
    User_ID CHAR(7)     NOT NULL PRIMARY KEY UNIQUE,
    CONSTRAINT FOREIGN KEY (User_ID) REFERENCES Register (Register_ID)
);

DROP TABLE IF EXISTS Login;

CREATE TABLE IF NOT EXISTS Login
(
    Login_ID CHAR(7)      NOT NULL PRIMARY KEY UNIQUE,
    Password VARCHAR(100) NOT NULL,
    CONSTRAINT FOREIGN KEY (Login_ID) REFERENCES Register (Register_ID)
);

DROP TABLE IF EXISTS Genre;

CREATE TABLE IF NOT EXISTS Genre
(
    Genre_ID CHAR(7)     NOT NULL PRIMARY KEY UNIQUE,
    Name     VARCHAR(20) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS Song;

CREATE TABLE IF NOT EXISTS Song
(
    Song_ID       CHAR(7)      NOT NULL PRIMARY KEY UNIQUE,
    Name          VARCHAR(100) NOT NULL,
    Year          CHAR(4)      NOT NULL,
    Duration      VARCHAR(4)   NOT NULL,
    Genre_ID      CHAR(7)      NOT NULL,
    SongLocation  VARCHAR(200) NOT NULL UNIQUE,
    ImageLocation VARCHAR(200) NOT NULL UNIQUE,
    CONSTRAINT UNIQUE (Song_ID, Genre_ID),
    CONSTRAINT FOREIGN KEY (Genre_ID) REFERENCES Genre (Genre_ID)
);

DROP TABLE IF EXISTS Playlist;

CREATE TABLE IF NOT EXISTS Playlist
(
    Playlist_ID CHAR(7)     NOT NULL PRIMARY KEY UNIQUE,
    User_ID     CHAR(7)     NOT NULL UNIQUE,
    Name        VARCHAR(20) NOT NULL,
    CONSTRAINT FOREIGN KEY (User_ID) REFERENCES User (User_ID)
);

DROP TABLE IF EXISTS Artist;

CREATE TABLE IF NOT EXISTS Artist
(
    Name      VARCHAR(50) NOT NULL,
    Artist_ID CHAR(8)     NOT NULL PRIMARY KEY UNIQUE,
    DOB       VARCHAR(15) NOT NULL
);

DROP TABLE IF EXISTS Song_Artist;

CREATE TABLE IF NOT EXISTS Song_Artist
(
    Song_ID   CHAR(7) NOT NULL,
    Artist_ID CHAR(8) NOT NULL,
    CONSTRAINT UNIQUE (Song_ID, Artist_ID),
    CONSTRAINT FOREIGN KEY (Song_ID) REFERENCES Song (Song_ID),
    CONSTRAINT FOREIGN KEY (Artist_ID) REFERENCES Artist (Artist_ID)
);

DROP TABLE IF EXISTS Album;

CREATE TABLE IF NOT EXISTS Album
(
    Name     VARCHAR(20) NOT NULL,
    Album_ID CHAR(8)     NOT NULL PRIMARY KEY UNIQUE
);

DROP TABLE IF EXISTS Album_Song;

CREATE TABLE IF NOT EXISTS Album_Song
(
    Album_ID CHAR(8) NOT NULL,
    Song_ID  CHAR(7) NOT NULL,
    CONSTRAINT FOREIGN KEY (Album_ID) REFERENCES Album (Album_ID),
    CONSTRAINT FOREIGN KEY (Song_ID) REFERENCES Song (Song_ID),
    CONSTRAINT UNIQUE (Album_ID, Song_ID)
);

DROP TABLE IF EXISTS Playlist;

CREATE TABLE IF NOT EXISTS Playlist
(
    Playlist_ID CHAR(7)     NOT NULL PRIMARY KEY UNIQUE CHECK ( Playlist_ID LIKE 'PID%'),
    User_ID     CHAR(7)     NOT NULL CHECK ( User_ID LIKE 'UID%'),
    Name        VARCHAR(20) NOT NULL,
    CONSTRAINT FOREIGN KEY (User_ID) REFERENCES User (User_ID),
    CONSTRAINT UNIQUE (Playlist_ID, User_ID)
);

DROP TABLE IF EXISTS Playlist_Song;


CREATE TABLE IF NOT EXISTS Playlist_Song
(
    Playlist_ID CHAR(7) NOT NULL,
    Song_ID     CHAR(7) NOT NULL,
    CONSTRAINT FOREIGN KEY (Playlist_ID) REFERENCES Playlist (Playlist_ID),
    CONSTRAINT FOREIGN KEY (Song_ID) REFERENCES Song (Song_ID),
    CONSTRAINT UNIQUE (Playlist_ID, Song_ID)
);

DROP TABLE IF EXISTS Interest_User_Genre;


CREATE TABLE IF NOT EXISTS Interest_User_Genre
(
    User_ID  CHAR(7) NOT NULL,
    Genre_ID CHAR(7) NOT NULL,
    CONSTRAINT UNIQUE (User_ID, Genre_ID),
    CONSTRAINT FOREIGN KEY (User_ID) REFERENCES User (User_ID),
    CONSTRAINT FOREIGN KEY (Genre_ID) REFERENCES Genre (Genre_ID)
);

DROP TABLE IF EXISTS Interest_User_Artist;


CREATE TABLE IF NOT EXISTS Interest_User_Artist
(
    User_ID   CHAR(7) NOT NULL,
    Artist_ID CHAR(8) NOT NULL,
    CONSTRAINT UNIQUE (User_ID, Artist_ID),
    CONSTRAINT FOREIGN KEY (User_ID) REFERENCES User (User_ID),
    CONSTRAINT FOREIGN KEY (Artist_ID) REFERENCES Artist (Artist_ID)
);

DROP TABLE IF EXISTS User_Likes;

CREATE TABLE IF NOT EXISTS User_Likes
(
    User_ID CHAR(7) NOT NULL,
    Song_ID CHAR(7) NOT NULL,
    CONSTRAINT FOREIGN KEY (User_ID) REFERENCES User (User_ID),
    CONSTRAINT FOREIGN KEY (Song_ID) REFERENCES Song (Song_ID),
    CONSTRAINT UNIQUE (User_ID, Song_ID)
);


SELECT * FROM Song WHERE Song_ID='00000015';

