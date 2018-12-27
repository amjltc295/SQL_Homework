# SQL Homework
SQL homework for Introduction to Computer (計算機概論), Fall 2018

## Introduction

On World Wide Web there are more than 100 different web pages dedicated to Star Wars. However, the answer to a specific trivia question is sometimes difficult to find, precisely because of the abundance of information. In this assignment we will be creating a new Star Wars Trilogy database for the trivial overs. We decided to begin with the time tables - who went where and when. We have started to input the information into the database. Your task will be to create SQL queries that answer some of the often asked questions (or questions that we found most fascinating and asked often). 


## Environment Setup

### MySQL 5.7

See https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/

If you are using Linux, the following commands might work:
```
sudo apt-get update
sudo apt-get install mysql-server
# Check if mysql is up
sudo service mysql status
# See https://tableplus.io/blog/2018/10/how-to-start-stop-restart-mysql-server.html to start the MySQL server if the server is not started
```

You may need to [create an account](https://dev.mysql.com/doc/refman/5.5/en/adding-users.html) or use root for MySQL (`sudo mysql`).
After installation, you should be able to load the database from `starwar.sql` in this repository:

In MySQL:
```
# You need to create a database named 'starwar' in MySQL before loading the starwar.sql
$ mysql -u <your user name> -p  # Or 'sudo mysql' if you did not setup an account
Enter password:
mysql> CREATE DATABASE starwar;
```

In the terminal
```
git clone git@github.com:amjltc295/SQL_Homework.git
cd SQL_Homework
mysql -u username -p starwar < data/starwar.sql
```

Then you could play with the SQL commands with MySQL:
```
$ mysql -u <your user name> -p  # Or 'sudo mysql' if you did not setup an account
Enter password:
mysql> use starwar;
Database changed
mysql> select name from planets;
+----------------+
| name           |
+----------------+
| Tatooine       |
| Hoth           |
| Dagobah        |
| Death Star     |
| Endor          |
| Bespin         |
| Star Destroyer |
| Kashyyyk       |
| Corellia       |
| Alderaan       |
+----------------+
10 rows in set (0.00 sec)

```
Query Commands: select, from, where, not, in, exists, distinct, group by, order by, max, [field name] ...

See https://www.tutorialspoint.com/mysql/index.htm for more details.

Note: if you don't like MySQL, you could use other tools as well. However, the syntax should be the same as MySQL and the query results should be shown. Otherwise you may not get points.

### Others

See the instructions in the previous homework: https://github.com/amjltc295/PythonHomework#task-0-environment-setup


## Database

The database has three tables:
* **characters**: contains information about the character’s Name (primary key), Race (if known), Homeworld (if known) and Affiliation (rebels/empire/neutral/free-lancer). 
* **planets**: contains information about the planet’s Name (primary key), it’s Type (gas/swamp/forest/handmade/ice/desert), and it’s Affiliation (rebels/empire/neutral). 
* **time_table**: contains Character’s Name, Planet’s Name, Movie in which the character visited the planet and the time of arrival and departure from the planet. The primary key is Character’s Name, Planet’s Name and Movie. Movie 1 represents The Star Wars, Movie 2 represents Empire Strikes Back, and Movie 3 represents Return of the Jedi. Each movie has been divided into 10 time chunks and these chunks are used to define time of arrival and departure. So that, if Darth Vader visited Bespin
(Cloud City) in Empire Strikes Back from the middle of the movie till it’s end, the record of it will look like this: 

    | character_name | planet_name | movie | time_of_arrival | time_of_departure |
    |----------------|-------------|-------|-----------------|-------------------|
    | Darth Vader    | Bespin      | 2     | 5               | 10                |

    Note that the time that a character stays in the planet is (time_of_departure - time_of_arrival).


## Questions
You are asked to write SQL queries that answer the questions below (one query per question) and run them with MySQL.
Some hints for columns to be selected are shown in the parentheses **()**.
1. Who had been to Endor in movie 3? 
2. How many planets did Luke Skywalker visit in movie 2? 
3. Who visited his/her homeworld in movie 3? 
4. Find all characters that never visited any empire planets. 
5. Find distinct names of the planets visited by rebels-affiliated human. 
6. Show the characters names and the total time they spent in each planet among the movies. 
7. Find all characters that are rebels-affiliated humans and his/her homeworld is known. 
8. On which planets and in which movies has Luke Skywalker been at the same time on the planet as anyone who is human?  (**planet_name, movie**)
9. For each movie, which character(s) visited the highest number of planets? (**movie, character_name, number_of_planet_visited**)
10. Which planet has the longest staying time to the droid? 
11. Which planet(s) have not been visited by any characters in all movies? 
12. For Luke Skywalker, for each movie that Luke appears in, what is the planet that has the different affiliation with him and that he travels to for the longest length of time? (**movie, planet**)
13. Who visited the planet Dagobah and leave later than Luke Skywalker? 
14. For each race, find the character that travels the most (number of time slots) in each movie. (**movie, race, character_name**)
15. Which planet(s) has been visited by more than three different characters?

## Submission
You have to hand in your report and queries on [Ceiba](https://ceiba.ntu.edu.tw/course/fa811a/index.htm) before **1/2 12:00 p.m.** with the required format:

```
└── <your_student_ID>.zip
    └── <your_student_ID>/
        ├── report.pdf                   -> your report
        └── <your_student_ID>.txt        -> a pure text file with 15 lines of your SQL queries

```
**Any invalid format (e.g., .rar/.7z ..., missing report, missing screenshots, ...) of the submission will result in 0 points.**

The report should contain fifteen queries: 
```
SQL Homework
StudentID & name

1. [Screenshot of the result of Query 1]

2. [Screenshot of the result of Query 2]
(...)
```
Please make it as simple as possible. 


**If your screenshot is found the same as another student, both of you will get 0 points.**

You could prevent this by adding some words in the next command:
![screenshot](images/screenshot.png)

**Discussion is accepted but cheating is strictly prohibited. You must do the whole homework by yourself.**


## Grading

* Use `python src/self_checker.py -u <your mysql username> -p <your mysql password> -f <your_student_ID>.txt -a data/answer_shapes.json` to check your answer shape.
* 6 points for each query (90%)
* Name and studentID in the report (10%)

## Note
* **Open an issue if you have a question or find a bug.** TA would not reply any emails about this homework
* **The query answers must not contain duplicates**
* For this assignment, **creation of temporary tables is not allowed**, i.e., for each question, you have to write exactly one SQL statement
* **Remember to provide screenshots for each query in the report.**
* **If your screenshot is found the same as another student, both of you will get 0 points.**
* **Any invalid format (e.g., .rar/.7z ..., missing report, missing screenshots) of the submission will result in 0 points.**

## License

MIT


## Disclaimer

The database and questions are based on the previous TA's work.

## Author

Ya-Liang Chang (Allen) [amjltc295](https://github.com/amjltc295)
