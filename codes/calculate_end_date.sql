DROP FUNCTION IF EXISTS CALCULATE_END_DATE;

DELIMITER //

CREATE FUNCTION CALCULATE_END_DATE(semester VARCHAR(255), course VARCHAR(255)) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE enddate BIGINT(10);

		IF course = 'adm' THEN
		CASE semester
			WHEN '2013.2' THEN SET enddate = UNIX_TIMESTAMP('2014-04-13');
			WHEN '2014.1' THEN SET enddate = UNIX_TIMESTAMP('2014-08-31');
			WHEN '2014.2' THEN SET enddate = UNIX_TIMESTAMP('2015-02-09');
			WHEN '2015.1' THEN SET enddate = UNIX_TIMESTAMP('2015-07-18');
			WHEN '2015.2' THEN SET enddate = UNIX_TIMESTAMP('2015-12-31');
			WHEN '2016.1' THEN SET enddate = UNIX_TIMESTAMP('2016-08-07');
			WHEN '2016.2' THEN SET enddate = UNIX_TIMESTAMP('2016-12-25');
			WHEN '2017.1' THEN SET enddate = UNIX_TIMESTAMP('2017-10-25');
			ELSE SET enddate = UNIX_TIMESTAMP('2017-10-25');
		END CASE;
	ELSE
		CASE semester
			WHEN '2014.2' THEN SET enddate = UNIX_TIMESTAMP('2015-02-02');
			WHEN '2015.1' THEN SET enddate = UNIX_TIMESTAMP('2015-07-22');
			WHEN '2015.2' THEN SET enddate = UNIX_TIMESTAMP('2015-12-31');
			WHEN '2016.1' THEN SET enddate = UNIX_TIMESTAMP('2016-08-25');
			WHEN '2016.2' THEN SET enddate = UNIX_TIMESTAMP('2017-01-31');
			WHEN '2017.1' THEN SET enddate = UNIX_TIMESTAMP('2017-08-25');
			WHEN '2017.2' THEN SET enddate = UNIX_TIMESTAMP('2017-12-31');
			WHEN '2018.1' THEN SET enddate = UNIX_TIMESTAMP('2018-07-15');
			ELSE SET enddate = UNIX_TIMESTAMP('2018-07-15');
		END CASE;
	END IF;

	RETURN enddate;
END//

DELIMITER ;