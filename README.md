# Movie recommendation system using Python, the TMDB API, and a SQL database

## Project intro

First of all, like many people, I have a hard time finding movies that I might like when I’m ready to watch something. That’s because even if the movie looks great and would be perfect for me, I’m constantly thinking about finding a better one and keep scrolling through movies until I don’t want to watch anything else. With all the streaming platforms offering choices and our attention span shrinking, what should be a good time is turning into a waste of time.

This is essentially why any website providing products or services uses recommendations to encourage the user to consume or buy.

Recommender systems are, however, hard to build because of the data and computing power it needs to be efficient.

## Project Workflow

### 1. Project Setup
- **Environment Setup:** Install Python and set up a virtual environment for your project.
- **Dependencies:** Install necessary libraries (`requests` for API calls, `SQLAlchemy` or similar for database interaction, a web framework like `Flask` or `Django` for the frontend).

### 2. TMDB API Integration
- **API Key:** Register on TMDB to obtain an API key.
- **API Exploration:** Familiarize yourself with the TMDB API; understand how to retrieve movie details, search movies, etc.
- **API Wrapper:** Write a Python class or module to interact with the TMDB API using the `requests` library.

### 3. Database Setup
- **Database Schema:** Design a SQL database schema to store user data and watched movies.
- **ORM Setup:** Use an ORM like SQLAlchemy to interact with your database in Python.
- **Database Operations:** Implement functions to add, update, and retrieve user data and movie preferences.

### 4. Recommendation Logic
- **Algorithm Design:** Decide on a recommendation algorithm (e.g., content-based filtering, collaborative filtering).
- **Implementation:** Write the logic in Python to generate movie recommendations based on user's watched movies and ratings.
- **Integration with TMDB:** Ensure the recommendation logic utilizes TMDB's data effectively.

### 5. Frontend Development
- **Framework Choice:** Choose a web framework (Flask for simplicity, Django for more features).
- **User Interface:** Design a simple user interface where users can add movies to their watched list, rate them, and view recommendations.
- **Frontend-Backend Integration:** Use your web framework to connect the frontend with the Python backend (API calls, database interactions).

### 6. User Authentication (Optional)
- **Authentication System:** If needed, implement a user login system to personalize recommendations.
- **Session Management:** Manage user sessions to keep track of individual user data.

### 7. Testing
- **Dummy Data:** Script Dummy data for the SQL database where random users wit libraries like `Faker` and random movies qith random ids from TMDB and asign ratings to them using the api data.
- **Unit Testing:** Write tests for your API integrations, database operations, and recommendation logic.
- **Frontend Testing:** Test the user interface for usability and bugs.

### 8. Deployment
- **Deployment Platform:** Choose a platform for deployment (Heroku, AWS, etc.).
- **Deployment Setup:** Deploy your application, ensuring that the environment is properly set up for Python, the web server, and the database.

### 9. Documentation and Maintenance
- **Documentation:** Document your code, API endpoints, and how to use the application.
- **Maintenance Plan:** Set up a plan for maintaining and updating the application.

### 10. Future Enhancements
- **Feedback System:** Implement a system for users to provide feedback on recommendations.
- **Continuous Learning:** Enhance the recommendation system to learn from user feedback and improve over time.

