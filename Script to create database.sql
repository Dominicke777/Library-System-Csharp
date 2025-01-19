-- Create the LibraryDb database
CREATE DATABASE LibraryDb;
USE LibraryDb;
-- Create the Login table
create Table Login(
	Username Varchar(150) not Null,
	Password Varchar (20) not Null,
);
Insert into Login (Username,Password) Values ('Admin','Admin');
-- Create the AddUser table
CREATE TABLE AddUser (
    UserName VARCHAR(150) NOT NULL,
    UserID VARCHAR(150) NOT NULL PRIMARY KEY,
    UserContact VARCHAR(150) NOT NULL, 
    UserEmail VARCHAR(150) NOT NULL
);

-- Insert dummy data into AddUser table
INSERT INTO AddUser (UserName, UserID, UserContact, UserEmail) VALUES 
('Carlos López', 'U001', '123456789', 'carlos.lopez@gmail.com'),
('Maria Gómez', 'U002', '987654321', 'maria.gomez@hotmail.com'),
('Juan Pérez', 'U003', '456123789', 'juan.perez@yahoo.com'),
('Ana Fernández', 'U004', '789456123', 'ana.fernandez@gmail.com'),
('Lucía Morales', 'U005', '321654987', 'lucia.morales@outlook.com');

-- Create the AddNewBook table
CREATE TABLE AddNewBook (
    ISBN VARCHAR(150) NOT NULL PRIMARY KEY,
    BookName VARCHAR(150) NOT NULL,
    Author VARCHAR(150) NOT NULL,
    Publisher VARCHAR(150) NOT NULL,
    YearOfPublication INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    NumberOfCopies INT NOT NULL
);

-- Insert dummy data into AddNewBook table
INSERT INTO AddNewBook (ISBN, BookName, Author, Publisher, YearOfPublication, Genre, NumberOfCopies) VALUES 
('978-3-16-148410-0', 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Editorial Planeta', 1605, 'Novela', 5),
('978-0-14-044913-6', 'Cien años de soledad', 'Gabriel García Márquez', 'Penguin Random House', 1967, 'Novela', 3),
('978-84-376-0494-7', 'La casa de los espíritus', 'Isabel Allende', 'Editorial Sudamericana', 1982, 'Novela', 4),
('978-84-7888-563-4', 'Ficciones', 'Jorge Luis Borges', 'Alianza Editorial', 1944, 'Cuentos', 6),
('978-84-204-8560-4', 'El laberinto de la soledad', 'Octavio Paz', 'Editorial Seix Barral', 1950, 'Ensayo', 2);

-- Create the IssueBook table
CREATE TABLE IssueBook (
    UserID VARCHAR(150) NOT NULL,
    ISBN VARCHAR(150) NOT NULL,
    IssueDate DATE NOT NULL,
    ReturnDate DATE NOT NULL,
    IsReturned BIT NOT NULL,
    Fine INT NOT NULL DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES AddUser(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES AddNewBook(ISBN) ON DELETE CASCADE
);

-- Insert dummy data into IssueBook table
INSERT INTO IssueBook (UserID, ISBN, IssueDate, ReturnDate, IsReturned, Fine) VALUES 
('U001', '978-3-16-148410-0', '2024-01-01', '2024-01-15', 0, 0),
('U002', '978-0-14-044913-6', '2024-01-05', '2024-01-20', 0, 50),
('U003', '978-84-376-0494-7', '2024-01-10', '2024-01-25', 1, 0),
('U004', '978-84-7888-563-4', '2024-01-12', '2024-01-28', 1, 100),
('U005', '978-84-204-8560-4', '2024-01-15', '2024-02-01', 0, 0);




