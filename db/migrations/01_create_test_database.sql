CREATE DATABASE "library_test";
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, 
                       title VARCHAR(60), 
                       author VARCHAR(60),
                       isbn);
