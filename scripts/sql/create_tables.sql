-- Create Database
CREATE DATABASE MotionMuse;
USE MotionMuse;

-- Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    PasswordHash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
    SpokenLanguages TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Ratings Table
CREATE TABLE Ratings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Rating DECIMAL(2, 1) CHECK (Rating >= 0 AND Rating <= 5),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Watchlists Table
CREATE TABLE Watchlists (
    WatchlistID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- WatchlistMovies Table (Junction Table)
CREATE TABLE WatchlistMovies (
    WatchlistID INT,
    MovieID INT,
    FOREIGN KEY (WatchlistID) REFERENCES Watchlists(WatchlistID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    PRIMARY KEY (WatchlistID, MovieID)
);

-- Movie Preferences Table
CREATE TABLE MoviePreferences (
    PreferenceID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    PreferredGenre VARCHAR(255),
    PreferredDirector VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
