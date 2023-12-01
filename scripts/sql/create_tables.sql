-- Create Database
CREATE DATABASE motion_muse;
USE motion_muse;

-- Users Table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Movies Table
CREATE TABLE movies (
    tmdb_movie_id INT PRIMARY KEY,
    title VARCHAR(510),
    vote_average FLOAT,
    vote_count INT,
    status VARCHAR(255),
    release_date DATE,
    revenue BIGINT,
    runtime INT,
    adult BOOLEAN,
    backdrop_path TEXT,
    budget FLOAT,
    homepage TEXT,
    imdb_id VARCHAR(255),
    original_language VARCHAR(50),
    original_title VARCHAR(255),
    overview TEXT,
    popularity FLOAT,
    poster_path TEXT,
    tagline TEXT,
    genres TEXT,
    production_companies TEXT,
    production_countries TEXT,
    spoken_languages TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Ratings Table
CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    tmdb_movie_id INT,
    rating DECIMAL(2, 1) CHECK (rating >= 0 AND rating <= 5),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (tmdb_movie_id) REFERENCES movies(tmdb_movie_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Watchlists Table
CREATE TABLE watchlists (
    watchlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- WatchlistMovies Table (Junction Table)
CREATE TABLE watchlist_movies (
    watchlist_id INT,
    tmdb_movie_id INT,
    FOREIGN KEY (watchlist_id) REFERENCES watchlists(watchlist_id),
    FOREIGN KEY (tmdb_movie_id) REFERENCES movies(tmdb_movie_id),
    PRIMARY KEY (watchlist_id, tmdb_movie_id)
);

-- Movie Preferences Table
CREATE TABLE movie_preferences (
    preference_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    preferred_genre VARCHAR(255),
    preferred_director VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT TIMESTAMP ON UPDATE CURRENT TIMESTAMP
);

-- Directors Table
CREATE TABLE directors (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

-- MovieDirectors Table (Junction Table)
CREATE TABLE movie_directors (
    tmdb_movie_id INT,
    director_id INT,
    FOREIGN KEY (tmdb_movie_id) REFERENCES movies(tmdb_movie_id),
    FOREIGN KEY (director_id) REFERENCES directors(director_id),
    PRIMARY KEY (tmdb_movie_id, director_id)
);

-- Cast Members Table
CREATE TABLE cast_members (
    cast_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- MovieCast Table (Junction Table)
CREATE TABLE movie_cast (
    tmdb_movie_id INT,
    cast_id INT,
    role VARCHAR(255),
    FOREIGN KEY (tmdb_movie_id) REFERENCES movies(tmdb_movie_id),
    FOREIGN KEY (cast_id) REFERENCES cast_members(cast_id),
    PRIMARY KEY (tmdb_movie_id, cast_id)
);
