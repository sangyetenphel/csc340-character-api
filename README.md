# Character CRUD API - Spring Boot

A RESTful API for managing character records, built with **Spring Boot, Spring Data JPA, and PostgreSQL**. This project demonstrates how to build a backend API that performs CRUD operations and connects to a PostgreSQL database.

---

## Table of Contents

- [What is This Project?](#what-is-this-project)
- [Technology Stack](#technology-stack)
- [Installation & Setup](#installation--setup)
- [Running the Application](#running-the-application)
- [Project Architecture](#project-architecture)
- [API Endpoints](#api-endpoints)
- [Database Schema](#database-schema)
- [Demo Video](#demo-video)

---

# What is This Project?

This project is a **CRUD API (Create, Read, Update, Delete)** that manages character records such as superheroes or villains.

The API allows users to:

- Create new characters
- Retrieve characters from the database
- Update character information
- Delete characters
- Search characters by name
- Filter characters by category (such as universe)

This project demonstrates:

- Building REST APIs using **Spring Boot**
- Connecting to a **PostgreSQL database**
- Using **Spring Data JPA for database operations**
- Organizing backend code using **Controller, Service, and Repository layers**

---

# Technology Stack

| Technology | Purpose |
|-----------|--------|
| Java 25 | Programming language |
| Spring Boot | Backend framework |
| Spring Data JPA | Database ORM layer |
| Hibernate | JPA implementation |
| PostgreSQL (Neon.tech) | Relational database |
| Maven | Dependency management |

---

# Installation & Setup

## Prerequisites

Before running the project, install:

1. **Java JDK 25**
2. **Git**
3. **Neon.tech PostgreSQL account**

Create a free database at:

https://neon.tech

---

## Clone the Repository

```bash
git clone <your-github-repo-link>
cd character-crud-api
```

---

## Install Dependencies

The project includes the **Maven Wrapper**, so Maven does not need to be installed.

Run:

### Mac/Linux

```bash
./mvnw clean install
```

### Windows

```cmd
mvnw.cmd clean install
```

---

## Configure Database

Open:

```
src/main/resources/application.properties
```

Add your Neon PostgreSQL credentials:

```properties
spring.application.name=character-api

spring.datasource.url=jdbc:postgresql://HOST:5432/neondb
spring.datasource.username=YOUR_USERNAME
spring.datasource.password=YOUR_PASSWORD

spring.jpa.hibernate.ddl-auto=update

logging.level.org.hibernate.SQL=DEBUG
logging.level.org.hibernate.type.descriptor.sql.BasicBinder=TRACE
logging.level.org.hibernate.orm.jdbc.bind=TRACE
```

To prevent committing credentials:

```bash
git update-index --skip-worktree src/main/resources/application.properties
```

---

# Running the Application

Start the Spring Boot server:

### Mac/Linux

```bash
./mvnw spring-boot:run
```

### Windows

```cmd
mvnw.cmd spring-boot:run
```

The application will start at:

```
http://localhost:8080
```

---

# Project Architecture

```
src/main/java/com/csc340/characters_api/

CrudApiApplication.java
CharacterApiController.java
CharacterService.java
CharacterRepository.java
Character.java
```

Layered architecture:

```
Client (Postman / EchoAPI)
        │
Controller Layer
(CharacterApiController)
        │
Service Layer
(CharacterService)
        │
Repository Layer
(CharacterRepository)
        │
PostgreSQL Database
```

Each layer has a specific responsibility:

- **Controller** handles HTTP requests
- **Service** contains business logic
- **Repository** interacts with the database
- **Entity** represents database tables

---

# API Endpoints

Base URL:

```
http://localhost:8080/api/characters
```

---

## Get All Characters

```
GET /api/characters/
```

Returns a list of all characters.

Example request:

```bash
curl http://localhost:8080/api/characters/
```

Example response:

```json
[
 {
  "characterId":1,
  "name":"Iron Man",
  "description":"A billionaire inventor",
  "universe":"Marvel",
  "role":"Hero",
  "species":"Human",
  "powerLevel":"High"
 }
]
```

---

## Get Character by ID

```
GET /api/characters/{id}
```

Example:

```
GET /api/characters/1
```

Returns a specific character.

---

## Create a New Character

```
POST /api/characters/
```

Request body:

```json
{
"name":"Spider-Man",
"description":"Friendly neighborhood hero",
"universe":"Marvel",
"role":"Hero",
"species":"Human",
"powerLevel":"High"
}
```

Returns the created character with generated ID.

---

## Update a Character

```
PUT /api/characters/{id}
```

Example:

```
PUT /api/characters/1
```

Request body:

```json
{
"name":"Spider-Man",
"description":"Updated description",
"universe":"Marvel",
"role":"Hero",
"species":"Human",
"powerLevel":"Very High"
}
```

Updates the existing character.

---

## Delete a Character

```
DELETE /api/characters/{id}
```

Example:

```
DELETE /api/characters/1
```

Deletes a character from the database.

---

## Get Characters by Category

```
GET /api/characters/category/{universe}
```

Example:

```
GET /api/characters/category/Marvel
```

Returns characters belonging to a specific universe.

---

## Search Characters by Name

```
GET /api/characters/search?name=substring
```

Example:

```
GET /api/characters/search?name=man
```

Returns characters whose names contain the given string.

---

# Database Schema

Table: **characters**

| Column | Type | Description |
|------|------|-------------|
| character_id | SERIAL | Primary key |
| name | VARCHAR | Character name |
| description | TEXT | Character description |
| universe | VARCHAR | Universe (Marvel/DC) |
| role | VARCHAR | Character role |
| species | VARCHAR | Character species |
| power_level | VARCHAR | Power level |

The table is automatically created by Hibernate when:

```
spring.jpa.hibernate.ddl-auto=update
```

---

# CRUD API Demo Video

Demo video showing all API endpoints working:

```
https://uncg-my.sharepoint.com/:v:/g/personal/f_sangyeten_uncg_edu/IQCrpmO1CXuYSqvZ9WQn6HfxAYdnuryJ96LowQBqBNhkgfQ?e=l8TLfu&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D
```

The demo includes:

- GET all characters
- GET character by ID
- POST new character
- PUT update character
- DELETE character
- Search characters
- Filter characters by category

---

# MVC APP Demo Video

[Watch the Character API Demo]([PASTE_YOUR_ONEDRIVE_LINK_HERE](https://uncg-my.sharepoint.com/:v:/g/personal/f_sangyeten_uncg_edu/IQBsJPLQyDmjQooINfNokgTQAej4U3InJW-lmKUfRUpzdhU?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=Gr69bt
)

https://uncg-my.sharepoint.com/:v:/g/personal/f_sangyeten_uncg_edu/IQBsJPLQyDmjQooINfNokgTQAej4U3InJW-lmKUfRUpzdhU?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=Gr69bt
