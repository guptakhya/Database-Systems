--Database used: livesql


CREATE TABLE COURSES(
    COURSE_NAME VARCHAR(30) NOT NULL PRIMARY KEY
);

CREATE TABLE CANDIDATES(
    CANDIDATE_ID NUMBER NOT NULL,
    CANDIDATE_NAME VARCHAR(30) NOT NULL,
    COURSE VARCHAR(30) NOT NULL,
    PRIMARY KEY (CANDIDATE_ID,COURSE)
);

INSERT INTO COURSES
VALUES ('Electronic Music Fundamentals');

INSERT INTO COURSES
VALUES ('MIDI controllers');

INSERT INTO COURSES
VALUES ('EDM synthesis');

INSERT INTO CANDIDATES
VALUES (1,'Aleph', 'MIDI controllers');

INSERT INTO CANDIDATES
VALUES (1,'Aleph', 'EDM synthesis');

INSERT INTO CANDIDATES
VALUES (2,'Bit', 'MIDI controllers');

INSERT INTO CANDIDATES
VALUES (2,'Bit', 'Electronic Music Fundamentals');

INSERT INTO CANDIDATES
VALUES (2,'Bit', 'EDM synthesis');

INSERT INTO CANDIDATES
VALUES (3,'CRC', 'MIDI controllers');

INSERT INTO CANDIDATES
VALUES (4,'Dat', 'EDM synthesis');

INSERT INTO CANDIDATES
VALUES (4,'Dat', 'MIDI controllers');

INSERT INTO CANDIDATES
VALUES (4,'Dat', 'Electronic Music Fundamentals');

--method 1 compares count 
SELECT CANDIDATE_NAME
FROM CANDIDATES
GROUP BY CANDIDATE_NAME
HAVING COUNT(COURSE) = (SELECT COUNT(*) FROM COURSES);


