--Database used: livesql

CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime),
CONSTRAINT validStartTime CHECK (startTime < endTime) -- check to ensure startTime is always before endTime
);

CREATE OR REPLACE TRIGGER trg_room_unavailable
BEFORE INSERT OR UPDATE ON ProjectRoomBookings
FOR EACH ROW
DECLARE
    counter Number;
BEGIN
    SELECT COUNT(*) INTO counter
    FROM ProjectRoomBookings
    WHERE :NEW.roomNum = roomNum AND
    (((:NEW.startTime >= startTime AND :NEW.startTime < endTime) OR (:NEW.endTime >= startTime AND :NEW.endTime < endTime))
    OR (:NEW.startTime < startTime AND :NEW.endTime > endTime));
    

    IF counter > 0 THEN
        RAISE_APPLICATION_ERROR(-20001,'Already Booked'); -- errors out if room ineligible 
    END IF;
END;
/

--testing with some cases below

INSERT INTO ProjectRoomBookings 
VALUES(3,3,6,'abcw');

INSERT INTO ProjectRoomBookings
VALUES(3,2,4,'tefd');

INSERT INTO ProjectRoomBookings
VALUES(3,4,5,'tefd');

INSERT INTO ProjectRoomBookings
VALUES(1,2,4,'trex');

INSERT INTO ProjectRoomBookings
VALUES(2,5,4,'arth');

INSERT INTO ProjectRoomBookings
VALUES(2,2,4,'adge');

INSERT INTO ProjectRoomBookings
VALUES(2,1,6,'adop');

SELECT * FROM ProjectRoomBookings;



