



	  


-- EMPLOYEES table

CREATE TABLE employees
(  employee_id      NUMERIC(3)   NOT NULL,
   first_name       VARCHAR(20)  ,
   middle_initial   VARCHAR(1)   ,
   last_name        VARCHAR(30)  ,
   soc_sec_no       NUMERIC(9)   ,
   hire_date        DATE         ,
   salary           DECIMAL(7,2) ,
   commission_pct   DECIMAL(3,3), 
   department_code  VARCHAR(2)   ,
   job_code         VARCHAR(7),
   manager_id       NUMERIC(3)
)


  
INSERT INTO employees VALUES ( 110, 'Lauren', 'M', 'Alexander', 749583756, DEFAULT, 45000, NULL,    'TR', 'DT_MGR', NULL );
INSERT INTO employees VALUES ( 111, 'Lisa',   'L', 'James',     396812058, DEFAULT, 65000, NULL,    'MA', 'DT_MGR', NULL );
INSERT INTO employees VALUES ( 112, 'Dave',   ' ', 'Bernard',   184759364, DEFAULT, 60000, NULL,    'HT', 'DT_MGR', NULL );
INSERT INTO employees VALUES ( 113, 'Steve',  'L', 'Carr',      018593745, DEFAULT, 55000, NULL,    'VG', 'DT_MGR', NULL );
INSERT INTO employees VALUES ( 114, 'Marg',   'A', 'Horner',    947581253, DEFAULT, 45000, NULL,    'MA', 'DT_MGR', 111  );
INSERT INTO employees VALUES ( 124, 'Scott',  ' ', 'Long',      912058121, DEFAULT, 35000, DEFAULT, 'VG', 'SL_ACE', 113  );
INSERT INTO employees VALUES ( 115, 'Jim',    ' ', 'Best',      184629673, DEFAULT, 24000, DEFAULT, 'SA', 'SL_ACE', NULL );
INSERT INTO employees VALUES ( 126, 'Sue',    'A', 'McDonald',  285912756, DEFAULT, 36000, DEFAULT, 'TR', 'SL_ACE', 110  );
INSERT INTO employees VALUES ( 117, 'Trish',  'S', 'Albert',    649105738, DEFAULT, 18000, DEFAULT, 'VG', 'SL_ACE', 113  );
INSERT INTO employees VALUES ( 125, 'Terry',  'J', 'Maxwell',   385937712, DEFAULT, 22000, DEFAULT, 'HT', 'SL_ACE', 112  );
INSERT INTO employees VALUES ( 119, 'Dave',   ' ', 'Nisbet',    759127547, DEFAULT, 39000, DEFAULT, 'TR', 'SL_ACE', 110  );
INSERT INTO employees VALUES ( 120, 'Anne',   'M', 'Richie',    834577193, DEFAULT, 40000, DEFAULT, 'MA', 'SL_ACE', 111  );
INSERT INTO employees VALUES ( 122, 'Jake',   'L', 'Lee',       812954926, DEFAULT, 45000, DEFAULT, 'VG', 'SL_ACE', 113  );
INSERT INTO employees VALUES ( 118, 'Janice', 'B', 'Harper',    912758396, DEFAULT, 29000, DEFAULT, 'HT', 'SL_ACE', 112  );
INSERT INTO employees VALUES ( 123, 'Linda',  'M', 'Johnson',   295734812, DEFAULT, 24000, DEFAULT, 'MA', 'SL_ACE', 114  );
INSERT INTO employees VALUES ( 121, 'William','J', 'Johnson',   374912745, DEFAULT, 31000, DEFAULT, 'TR', 'SL_ACE', 110  );
INSERT INTO employees VALUES ( 127, 'Sharron',' ', 'Evans',     492337745, DEFAULT, 29000, DEFAULT, 'MA', 'SL_ACE', 114  );
INSERT INTO employees VALUES ( 116, 'Robert', ' ', 'Henry',     512850475, DEFAULT, 37000, DEFAULT, 'MA', 'SL_ACE', 111  );	  
INSERT INTO employees VALUES ( 131, 'Barb',   'L', 'Gibbens',   852951124, DEFAULT, 29000, DEFAULT, 'IT', 'IT_DEV', NULL );
INSERT INTO employees VALUES ( 135, 'Greg',   'J', 'Zimmerman', 539554832, DEFAULT, 31500, DEFAULT, 'IT', 'IT_DEV', NULL );
INSERT INTO employees VALUES ( 132, 'Dave',   'R', 'Bernard',   284447883, DEFAULT, 24000, DEFAULT, 'IT', 'IT_DEV', NULL );
INSERT INTO employees VALUES ( 136, 'Trish',  'S', 'Albert',    812740127, DEFAULT, 22500, DEFAULT, 'IT', 'IT_DEV', NULL );

