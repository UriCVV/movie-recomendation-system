import os
import pandas as pd
import random
import sqlalchemy
from sqlalchemy import create_engine, exc
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Database configuration from .env file
db_user = os.getenv("DB_USER")
db_pass = os.getenv("DB_PASS")
db_host = os.getenv("DB_HOST")
db_name = os.getenv("DB_NAME")

# Create SQLAlchemy engine
engine = create_engine(f"mysql+pymysql://{db_user}:{db_pass}@{db_host}/{db_name}")

# Load and populate Movies table from CSV
def populate_movies_table(csv_file_path):
    try:
        movies_df = pd.read_csv(csv_file_path)

        # Pre-process DataFrame if necessary (e.g., rename columns to match your table)

        movies_df.to_sql('Movies', engine, if_exists='append', index=False)
        print("Movies table populated successfully.")
    except pd.errors.ParserError:
        print("Error: Failed to parse CSV file.")
    except sqlalchemy.exc.SQLAlchemyError as e:
        print(f"SQLAlchemy Error: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")

# Function to create users
def create_users(num_users):
    try:
        for i in range(num_users):
            # Generate user details
            username = f"user{i}"
            email = f"user{i}@example.com"
            password_hash = "some_hash"  # Generate a secure hash in practice
            
            # Insert user into database
            with engine.connect() as connection:
                connection.execute(
                    "INSERT INTO Users (Username, Email, PasswordHash) VALUES (%s, %s, %s)",
                    (username, email, password_hash)
                )
        print(f"{num_users} users created successfully.")
    except sqlalchemy.exc.SQLAlchemyError as e:
        print(f"SQLAlchemy Error: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")

# Function to create watchlists and assign movies
def create_watchlists_and_movies(num_users):
    try:
        # Logic to create watchlists and assign movies
        pass
        # Placeholder for successful operation message
        print("Watchlists and movies assigned successfully.")
    except sqlalchemy.exc.SQLAlchemyError as e:
        print(f"SQLAlchemy Error: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")

# Function to generate ratings
def generate_ratings(num_users):
    try:
        # Logic to generate and insert ratings
        pass
        # Placeholder for successful operation message
        print("Ratings generated successfully.")
    except sqlalchemy.exc.SQLAlchemyError as e:
        print(f"SQLAlchemy Error: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")

# Main script execution
if __name__ == "__main__":
    csv_file_path = 'path_to_your_csv/TMDB_movie_dataset_v11.csv'
    populate_movies_table(csv_file_path)

    num_users = 15
    create_users(num_users)
    create_watchlists_and_movies(num_users)
    generate_ratings(num_users)
