-- Create Database
CREATE DATABASE MotionMuse;
USE MotionMuse;

-- Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    PasswordHash VARCHAR(255) NOT NULL
);

-- Movies Table
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    VoteAverage FLOAT,
    VoteCount INT,
    Status VARCHAR(255),
    ReleaseDate DATE,
    Revenue BIGINT,
    Runtime INT,
    Adult BOOLEAN,
    BackdropPath TEXT,
    Budget FLOAT,
    Homepage TEXT,
    IMDB_ID VARCHAR(255),
    OriginalLanguage VARCHAR(50),
    OriginalTitle VARCHAR(255),
    Overview TEXT,
    Popularity FLOAT,
    PosterPath TEXT,
    Tagline TEXT,
    Genres TEXT,
    ProductionCompanies TEXT,
    ProductionCountries TEXT,
    SpokenLanguages TEXT
);

-- Ratings Table
CREATE TABLE Ratings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Rating DECIMAL(2, 1) CHECK (Rating >= 0 AND Rating <= 5),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Watchlist Table
CREATE TABLE Watchlist (
    WatchlistID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Movie Preferences Table
CREATE TABLE MoviePreferences (
    PreferenceID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    PreferredGenre VARCHAR(255),
    PreferredDirector VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
