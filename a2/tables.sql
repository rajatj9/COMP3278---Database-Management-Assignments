CREATE TABLE classroom(
    building varchar(15),
    room_number varchar(7),
    capacity numeric(4,0),
    PRIMARY KEY (building, room_number)
);

CREATE TABLE department(
    dept_name varchar(20),
    building varchar(15),
    budget numeric(12,2),
    PRIMARY KEY(dept_name)
);

CREATE TABLE course(
    course_id varchar(8),
    title varchar(50),
    dept_name varchar(20),
    credits numeric(2,0),
    PRIMARY KEY(course_id),
    FOREIGN KEY(dept_name) REFERENCES department(dept_name)
);

CREATE TABLE instructor(
    ID varchar(5),
    name varchar(20),
    dept_name varchar(20),
    salary numeric(8,2)
    PRIMARY KEY(ID),
    FOREIGN KEY(dept_name) REFERENCES department(dept_name)    
);

CREATE TABLE time_slot(
    time_slot_id varchar(4),
    day varchar(1),
    start_hr numeric(2),
    start_min numeric(2),
    end_hr numeric(2),
    end_min numeric(2),
    PRIMARY KEY(time_slot_id)
);

CREATE TABLE section(
    course_id varchar(8),
    sec_id varchar(6),
    semester varchar(6),
    year numeric(4,0),
    building varchar(15),
    room_number varchar(7),
    time_slot_id varchar(4),
    PRIMARY KEY(course_id, sec_id, semester, year),
    FOREIGN KEY(course_id) REFERENCES course(course_id),
    FOREIGN KEY(building, room_number) REFERENCES classroom(building, room_number),
    FOREIGN KEY(time_slot_id) REFERENCES time_slot(time_slot_id)
);

CREATE TABLE teaches(
    ID varchar(5),
    course_id varchar(8),
    sec_id varchar(8),
    semester varchar(6),
    year numeric(4,0),
    PRIMARY KEY(id, course_id, sec_id, semester, year),
    FOREIGN KEY(course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year),
    FOREIGN KEY(ID) REFERENCES instructor(ID)
);

CREATE TABLE student(
    ID varchar(5),
    name varchar(20),
    dept_name varchar(20),
    tot_cred numeric(3,0),
    PRIMARY KEY(ID),
    FOREIGN KEY(dept_name) REFERENCES department(dept_name)
);

CREATE TABLE takes(

    ID varchar(5),
    course_id varchar(8),
    sec_id varchar(8),
    semester varchar(6),
    year numeric(4,0),
    grade varchar(2),
    PRIMARY KEY(ID, course_id, sec_id, semester, year),
    FOREIGN KEY (course_id,sec_id, semester, year) REFERENCES section(course_id,sec_id, semester, year),
    FOREIGN KEY(ID) REFERENCES student(ID),
    FOREIGN KEY(grade) REFERENCES grade_point(grade)

);

CREATE TABLE grade_point(
    grade varchar(2),
    point numeric(2,1),
    PRIMARY KEY(grade)
);