An application that utilizes HTTP requests, database relations, and SQL.
User is able to create a Stylist list containing Client names.

Setup Instructions: Run bundle to install gems - rspec, sinatra, sinatra-contrib, pg

Database Commands:
`CREATE DATABASE barbershop;`
`CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);`
`CREATE TABLE stylists (id serial PRIMARY KEY, stylist_name varchar);`

Copyright (c) 2015 Michael Marks

Authored by Michael Marks
