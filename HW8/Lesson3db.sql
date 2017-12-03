/* gets access to spatial_ref_sys in the public Schemas */
SET search_path TO usa, public;

/* 2. Create a table to store the postal code centroids. */
CREATE TABLE postalcode (
	code VARCHAR PRIMARY KEY,
	long VARCHAR,
	lat VARCHAR
);

/* 3. Load the centroid data from the text file. */
COPY usa.postalcode FROM 'C:\DatabaseHW\Lesson3db\postal_codes.txt'
WITH (FORMAT csv, HEADER True, QUOTE '"');

/* 4. Add a geometry column and use an UPDATE query to populate it with POINT geometries. */
ALTER TABLE postalcode
ADD COLUMN geometry VARCHAR;

UPDATE postalcode
SET geometry = ST_GeomFromText('POINT(' || long || ' ' || lat || ')', 4269)
WHERE geometry IS NULL;

/* need to test: 5. Create a table to store the class roster. */
CREATE TABLE roster(
	student VARCHAR(32) PRIMARY KEY,
	zipcode INT
);

/* 6. Load the class roster from the text file. */
COPY usa.roster FROM 'C:\DatabaseHW\Lesson3db\roster.csv'
WITH (FORMAT csv, HEADER True, QUOTE '"');

/* 7. Determine a way to associate the geometries in the postal codes table 
with the records in the roster table. */