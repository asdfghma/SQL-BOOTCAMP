CREATE TABLE Categories (
	category_id SMALLINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(100) NOT NULL UNIQUE,
	description TEXT 	
);

CREATE TABLE Members (
	member_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	username VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
	);

CREATE TABLE Courses (
	course_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(200) NOT NULL,
	description TEXT,
	start_date	DATE,
	end_date	DATE,
	instructor VARCHAR(100),
	category_id SMALLINT NOT NULL,
	FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE RESTRICT
);

CREATE TABLE Enrollments (
	enrolment_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	member_id BIGINT NOT NULL,
	course_id BIGINT NOT NULL,
	enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
	FOREIGN KEY (member_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
	UNIQUE (member_id, course_id)
);

CREATE TABLE Certificates (
	certificate_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	certificate_code VARCHAR(100) NOT NULL UNIQUE,
	issue_date DATE NOT NULL,
	course_id BIGINT NOT NULL,
	FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE RESTRICT
);

CREATE TABLE CertificateAssigments (
	assignment_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	member_id BIGINT NOT NULL,
	certificate_id 	BIGINT NOT NULL,
	assignment_date DATE DEFAULT CURRENT_DATE NOT NULL,
	FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
	FOREIGN KEY (certificate_id) REFERENCES Certificates(certificate_id) ON DELETE
	CASCADE,
	UNIQUE (member_id, certificate_id)
);

CREATE TABLE BlogPost (
	post_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	content TEXT NOT NULL,
	publish_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	author_id BIGINT NOT NULL,
	FOREIGN KEY (author_id) REFERENCES Members(member_id) ON DELETE CASCADE
);