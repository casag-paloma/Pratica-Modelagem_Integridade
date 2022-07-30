CREATE DATABASE "DrivenBank";

CREATE TABLE "customers" (
	id serial NOT NULL PRIMARY KEY,
	"fullName" text NOT NULL,
	cpf varchar(11) NOT NULL UNIQUE,
	email text NOT NULL UNIQUE,
	password text NOT NULL
);

CREATE TABLE "customersPhones" (
	id serial NOT NULL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id),
	number integer NOT NULL,
	type text
);

CREATE TABLE "states" (
	id serial NOT NULL PRIMARY KEY,
	name text NOT NULL
);


CREATE TABLE "cities" (
	id serial NOT NULL PRIMARY KEY,
	name text NOT NULL,
	"stateId" integer REFERENCES states(id)
);

CREATE TABLE "customerAddresses" (
	id serial NOT NULL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id) ,
	street text NOT NULL,
	number integer NOT NULL,
	complement text,
	"postalCode" varchar(8) NOT NULL,
	"cityId" integer REFERENCES cities(id)
);


CREATE TABLE "bankAccount" (
	id serial NOT NULL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id),
	"accountNumber" integer NOT NULL,
	agency integer NOT NULL,
	"openDate" timestamp NOT NULL DEFAULT NOW(),
	"closeDate" timestamp DEFAULT NULL
);

CREATE TABLE "transactions" (
	id serial NOT NULL PRIMARY KEY,
	"bankAccountId" integer REFERENCES "bankAccount"(id),
	amount bigint NOT NULL,
	type text,
	time timestamp NOT NULL DEFAULT NOW(),
	description text,
	cancelled bool NOT NULL DEFAULT false
);

CREATE TABLE "creditCards" (
	id serial NOT NULL PRIMARY KEY,
	"bankAccountId" integer REFERENCES "bankAccount"(id),
	name text NOT NULL,
	number varchar(16) NOT NULL,
	"securityCode" varchar(3) NOT NULL,
	"expirationMonth" varchar(2) NOT NULL,
	"expirationYear" varchar(4) NOT NULL,
	password text NOT NULL,
	"limit" bigint NOT NULL DEFAULT 0
);




