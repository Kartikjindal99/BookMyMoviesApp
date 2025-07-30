# BookMyMoviesApp 🎬

A Java-based console movie booking application that allows users to book movies, select cities, check theater details, and book seats dynamically using MySQL as the backend database.

## 🚀 Features

- Choose from Delhi-NCR cities like Delhi, Noida, Gurgaon
- View available theaters and movies in selected city
- See show timings and available seats
- Book tickets dynamically
- Auto-messages like “No theaters available” or “No shows available” if nothing is found

## 🛠️ Tech Stack

- Java (JDK 17)
- JDBC
- MySQL (8.0+)
- MySQL Connector/J (8.0.28)

## 🗄️ Database Setup

1. Install MySQL.
2. Create a database named `bookmyshow`.
3. Import the SQL file:

```bash
mysql -u root -p bookmyshow < bookmyshow.sql
```

## ▶️ How to Run

```bash
java -cp "BookMyMoviesApp.jar:mysql-connector-java-8.0.28.jar" app.BookMyMoviesApp
```

Make sure the MySQL Connector `.jar` file is in the same directory or path is correct.

## 👨‍💻 Author

Kartik Jindal  
Final Year B.Tech CSE Student, MIET Meerut