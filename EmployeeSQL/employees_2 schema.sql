-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/9qxG7X
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "titles" (
	"title_id" VARCHAR(200) NOT NULL
	,"title" VARCHAR(200)
	,CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
	);

CREATE TABLE "employees" (
	"emp_no" INTEGER NOT NULL
	,"emp_title_id" VARCHAR(200)
	,"birth_date" DATE
	,"first_name" VARCHAR(200)
	,"last_name" VARCHAR(200)
	,"sex" VARCHAR(200)
	,"hire_date" DATE
	,CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
	);

CREATE TABLE "salaries" (
	"emp_no" INTEGER
	,"salary" INTEGER
	);

CREATE TABLE "dept_manager" (
	"dept_no" VARCHAR(200)
	,"emp_no" INTEGER
	,CONSTRAINT "uc_dept_manager_emp_no" UNIQUE ("emp_no")
	);

CREATE TABLE "departments" (
	"dept_no" VARCHAR(200) NOT NULL
	,"dept_name" VARCHAR(200)
	,CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
	);

CREATE TABLE "dept_emp" (
	"emp_no" INTEGER
	,"dept_no" VARCHAR(200)
	);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY ("emp_title_id") REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");