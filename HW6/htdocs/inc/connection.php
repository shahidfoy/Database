<?php

function openConnection() {
	return pg_connect("host=localhost port=5432 dbname=postgres user=postgres password=postgres");
}
