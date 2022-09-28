CREATE TABLE "users" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" integer NOT NULL,
  "role_id" uuid NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "level" uuid NOT NULL,
  "teacher" uuid
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "course_id" uuid NOT NULL,
  "url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "courses_detail" (
  "id" uuid PRIMARY KEY NOT NULL,
  "course_id" uuid NOT NULL,
  "user_id" uuid NOT NULL
);

CREATE TABLE "categories_detail" (
  "id" uuid PRIMARY KEY NOT NULL,
  "course_id" uuid NOT NULL,
  "categorie_id" uuid NOT NULL
);

CREATE TABLE "course_level" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses_detail" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses_detail" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "categories_detail" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "categories_detail" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level") REFERENCES "course_level" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher") REFERENCES "users" ("id");


--INSERT DATA
INSERT INTO roles (
	id, name
) VALUES (
	'407c5ab7-2a87-4149-a245-fadf9d8f78be',
	'Student'
), (
	'bec0d434-cd13-4bbe-8fdd-278698e99120',
	'Teacher'
), (
	'5288d334-e257-4a2b-851f-f86016937468',
	'Administrator'
);

INSERT INTO users(
	id,
	name,
	email,
	password,
	age,
	role_id
) VALUES (
	'69123e30-f8b2-4827-90db-2f13ba15b2f2',
	'Camilo Gutiérrez',
	'camilo@correo.com',
	'camilo123456',
	30,
	'407c5ab7-2a87-4149-a245-fadf9d8f78be'
),(
	'6b88ee3e-bcdd-409e-9590-f77be792adc6',
	'Felipe Gutiérrez',
	'felipe@correo.com',
	'felipe1969',
	26,
	'407c5ab7-2a87-4149-a245-fadf9d8f78be'
),(
	'f681b872-9afb-4fe4-9c2a-860937389afa',
	'Miguel Ruiz',
	'migue@email.com',
	'miguel0831',
	29,
	'bec0d434-cd13-4bbe-8fdd-278698e99120'
),(
	'ddcaa09b-7bf5-45c4-83f0-2f5d922976c9',
	'Andrés Ruiz',
	'andres@email.com',
	'andres1126',
	25,
	'5288d334-e257-4a2b-851f-f86016937468'
);

INSERT INTO categories (
	id, name
) VALUES (
	'7bf7f9d8-c672-48ae-b25c-aaafabecded4',
	'Desarrollo'
), (
	'20f0dcd7-6120-4208-b735-7a53e9519ecc',
	'Diseño'
), (
	'49676265-7761-43e1-8b1f-fb87a48d2270',
	'Marketing'
), (
	'641ab10b-0a19-47a2-bc59-fc14f0ef8ed7',
	'Audiovisual'
);

insert into course_level (
	id, name
) values (
	'c2278284-1d2f-457b-bf3c-0b16dc0f2432',
	'Basic'
), (
	'67c10017-354c-4e9d-8e6d-1ec7d4c4761c',
	'Medium'
), (
	'b3375ef7-c164-44be-9b68-9205a34018d4',
	'Advanced'
), (
	'f875e75d-b2fd-4eb7-93e5-28ca2505a83b',
	'Pro'
);

insert into users (
	id,
	name,
	email,
	password,
	age,
	role_id
) values (
	'a3f3f14b-3525-4c86-95f7-61438d2f048d',
	'John Doe',
	'johndoe@email.com',
	'root1234',
	34,
	'bec0d434-cd13-4bbe-8fdd-278698e99120'
), (
	'8bf09ab7-8ea6-4d2f-8ed7-c34681e08674',
	'Sam McCartty',
	'sammcartty@email.com',
	'mcsam4561',
	28,
	'bec0d434-cd13-4bbe-8fdd-278698e99120'
), (
	'd30f1f88-9c27-402e-a1af-edd6ab4ea71f',
	'Harald Bjornsonn',
	'harald_bjornson@email.com',
	'hrldbjrnsn78456',
	32,
	'bec0d434-cd13-4bbe-8fdd-278698e99120'
);

-- DEVELOPMEN COURSES
insert into courses (
	id, title, description, level, teacher
) values (
	'52353fd0-59ee-467a-a046-3ef93a4ed43f',
	'Desarrollo Web',
	'Curso básico de desarrollo web.',
	'c2278284-1d2f-457b-bf3c-0b16dc0f2432',
	'f681b872-9afb-4fe4-9c2a-860937389afa'	
), (
	'3dcb7707-8c53-4298-bd2a-8d2a562e7c88',
	'Desarrollo de Videojuegos',
	'Curso avanzado de diseño y desarrollo de videojuegos',
	'b3375ef7-c164-44be-9b68-9205a34018d4',
	'f681b872-9afb-4fe4-9c2a-860937389afa'
), (
	'15d3a0d5-6a90-48e3-b1cc-aaf153d66363',
	'Bases de datos',
	'Curso intermedio de diseño y desarrollo de bases de datos SQL',
	'67c10017-354c-4e9d-8e6d-1ec7d4c4761c',
	'f681b872-9afb-4fe4-9c2a-860937389afa'
);

-- DESIGN COURSES
insert into courses (
	id, title, description, level, teacher
) values (
	'ece92679-4498-40da-9d8b-ead89e5d2432',
	'Digital painting',
	'Curso basico de pintura digital con photoshop',
	'c2278284-1d2f-457b-bf3c-0b16dc0f2432',
	'a3f3f14b-3525-4c86-95f7-61438d2f048d'
), (
	'3259cba9-940d-4b5d-847b-f97e1c373538',
	'Master Blender',
	'Curso profesional en Blender apara BIM, publicidad y y Videojuegos',
	'f875e75d-b2fd-4eb7-93e5-28ca2505a83b',
	'd30f1f88-9c27-402e-a1af-edd6ab4ea71f'
);

-- MARKETING COURSES
insert into courses (
	id, title, description, level, teacher
) values (
	'8ca9772d-5e5c-48a0-a372-a2597d7082ef', --ID
	'Marketing digital y Branding', --TITLE
	'Curso completo de marketing digital enfocado a la creacion de marcas', --DESCRIPTION
	'b3375ef7-c164-44be-9b68-9205a34018d4', --LEVEL
	'8bf09ab7-8ea6-4d2f-8ed7-c34681e08674'-- TEACHER
);

-- AUDIOVISUAL COURSES
insert into courses (
	id, title, description, level, teacher
) values (
	'57bf0769-160e-4108-8e14-167e32630d95', --ID
	'Fotografía digital', --TITLE
	'Aprende fotografia digital de cero a pro', --DESCRIPTION
	'f875e75d-b2fd-4eb7-93e5-28ca2505a83b', --LEVEL
	'd30f1f88-9c27-402e-a1af-edd6ab4ea71f'-- TEACHER
), (
	'13786d42-6b70-4185-9e18-074de7ac0fcb', --ID
	'Diseño de video', --TITLE
	'Curso avanzado de produccion audiovisual', --DESCRIPTION
	'b3375ef7-c164-44be-9b68-9205a34018d4', --LEVEL
	'8bf09ab7-8ea6-4d2f-8ed7-c34681e08674'-- TEACHER
);

-- ADD COURSES VIDEOS

insert into courses_videos (
	id, title, course_id, url
) values (
	'f75044eb-4fd7-475a-9005-e424f3f8ba81', --ID
	'Desarrollo Web', --TITLE
	'52353fd0-59ee-467a-a046-3ef93a4ed43f', --COURSE_ID
	'https://webcoursesapi.com/f75044eb-4fd7-475a-9005-e424f3f8ba81' --URL
), (
	'a14541f6-deda-4a06-80bd-2cdacc5916e5', --ID
	'Desarrollo de Videojuegos', --TITLE
	'3dcb7707-8c53-4298-bd2a-8d2a562e7c88', --COURSE_ID
	'https://webcoursesapi.com/a14541f6-deda-4a06-80bd-2cdacc5916e5' --URL
), (
	'2cd72ad3-46e0-4603-96ba-68b951fecf18', --ID
	'Bases de datos', --TITLE
	'15d3a0d5-6a90-48e3-b1cc-aaf153d66363', --COURSE_ID
	'https://webcoursesapi.com/2cd72ad3-46e0-4603-96ba-68b951fecf18' --URL
), (
	'73d6ebe3-a52f-4ce5-83e4-2c79651d4ed7', --ID
	'Digital painting', --TITLE
	'ece92679-4498-40da-9d8b-ead89e5d2432', --COURSE_ID
	'https://webcoursesapi.com/73d6ebe3-a52f-4ce5-83e4-2c79651d4ed7' --URL
), (
	'a7194e90-5fce-434d-9d0c-5dd83d8654ac', --ID
	'Master Blender', --TITLE
	'3259cba9-940d-4b5d-847b-f97e1c373538', --COURSE_ID
	'https://webcoursesapi.com/a7194e90-5fce-434d-9d0c-5dd83d8654ac' --URL
), (
	'bd6fb47c-15b8-4c84-a149-809ce4813d4b', --ID
	'Marketing digital y Branding', --TITLE
	'8ca9772d-5e5c-48a0-a372-a2597d7082ef', --COURSE_ID
	'https://webcoursesapi.com/bd6fb47c-15b8-4c84-a149-809ce4813d4b' --URL
), (
	'53fc5f47-7bbf-4269-8555-d8eebd63bd81', --ID
	'Fotografía digital', --TITLE
	'57bf0769-160e-4108-8e14-167e32630d95', --COURSE_ID
	'https://webcoursesapi.com/53fc5f47-7bbf-4269-8555-d8eebd63bd81' --URL
), (
	'2edec9c0-607c-4560-831f-341051db23f0', --ID
	'Diseño de video', --TITLE
	'13786d42-6b70-4185-9e18-074de7ac0fcb', --COURSE_ID
	'https://webcoursesapi.com/2edec9c0-607c-4560-831f-341051db23f0' --URL
);


-- INSERT PIVOT TABLES DATA

-- CATEGORIES DETAIL
insert into categories_detail (
	id, course_id, categorie_id 
) values (
	'6d60e58c-df91-4a94-84d2-3f0d3c4e6f22', --ID
	'52353fd0-59ee-467a-a046-3ef93a4ed43f', --COURSE_ID
	'7bf7f9d8-c672-48ae-b25c-aaafabecded4' --CATEGORIE_ID
), (
	'a797ad66-6d24-4816-bef2-6064cfa59462', --ID
	'3dcb7707-8c53-4298-bd2a-8d2a562e7c88', --COURSE_ID
	'7bf7f9d8-c672-48ae-b25c-aaafabecded4' --CATEGORIE_ID
), (
	'd188c9e7-5ed6-4eb7-8e51-09d649e2b0f8', --ID
	'15d3a0d5-6a90-48e3-b1cc-aaf153d66363', --COURSE_ID
	'7bf7f9d8-c672-48ae-b25c-aaafabecded4' --CATEGORIE_ID
), (
	'458dcc50-7f6f-4a86-9cf6-f927acf66eb1', --ID
	'ece92679-4498-40da-9d8b-ead89e5d2432', --COURSE_ID
	'20f0dcd7-6120-4208-b735-7a53e9519ecc' --CATEGORIE_ID
), (
	'9c5a7f42-63ec-4d25-b268-695af25ded9d', --ID
	'3259cba9-940d-4b5d-847b-f97e1c373538', --COURSE_ID
	'20f0dcd7-6120-4208-b735-7a53e9519ecc' --CATEGORIE_ID
), (
	'6211fb39-8616-4294-a3df-2464aaf73ca0', --ID
	'8ca9772d-5e5c-48a0-a372-a2597d7082ef', --COURSE_ID
	'49676265-7761-43e1-8b1f-fb87a48d2270' --CATEGORIE_ID
), (
	'c5557d69-8977-4bb4-b886-9e43f1cef5bb', --ID
	'57bf0769-160e-4108-8e14-167e32630d95', --COURSE_ID
	'641ab10b-0a19-47a2-bc59-fc14f0ef8ed7' --CATEGORIE_ID
), (
	'eee78b5c-87ec-4a99-9889-e5180aaa3dda', --ID
	'13786d42-6b70-4185-9e18-074de7ac0fcb', --COURSE_ID
	'641ab10b-0a19-47a2-bc59-fc14f0ef8ed7' --CATEGORIE_ID
);

--COURSES DETAIL
insert into courses_detail (
	id, course_id, user_id 
) values (
	'918bde31-432c-49d4-984c-87cdf34d9119', --ID
	'52353fd0-59ee-467a-a046-3ef93a4ed43f', --COURSE_ID
	'69123e30-f8b2-4827-90db-2f13ba15b2f2' --USER_ID
), (
	'60d0a9cf-b19f-4815-a755-b95abb0efe57', --ID
	'3dcb7707-8c53-4298-bd2a-8d2a562e7c88', --COURSE_ID
	'69123e30-f8b2-4827-90db-2f13ba15b2f2' --USER_ID
), (
	'05e3ebaa-ad45-465f-895a-b6c0f68e7b9b', --ID
	'3259cba9-940d-4b5d-847b-f97e1c373538', --COURSE_ID
	'69123e30-f8b2-4827-90db-2f13ba15b2f2' --USER_ID
), (
	'6d73bcf9-e829-44c1-8fd1-156997f6cf96', --ID
	'57bf0769-160e-4108-8e14-167e32630d95', --COURSE_ID
	'6b88ee3e-bcdd-409e-9590-f77be792adc6' --USER_ID
), (
	'cc2c2cdc-b800-4ab7-9577-c04472c15a2e', --ID
	'13786d42-6b70-4185-9e18-074de7ac0fcb', --COURSE_ID
	'6b88ee3e-bcdd-409e-9590-f77be792adc6' --USER_ID
);

insert into courses_detail (
	id, course_id, user_id 
) values (
	'1ac33279-1ca0-4a29-b65c-a4e5ebb47f20', --ID
	'15d3a0d5-6a90-48e3-b1cc-aaf153d66363', --COURSE_ID
	'69123e30-f8b2-4827-90db-2f13ba15b2f2' --USER_ID
), (
	'694fc926-ab90-4bda-b093-7eae5f799f4e', --ID
	'15d3a0d5-6a90-48e3-b1cc-aaf153d66363', --COURSE_ID
	'6b88ee3e-bcdd-409e-9590-f77be792adc6' --USER_ID
);


select * from courses;

select users.id , users.name, courses_detail.course_id from users
	left join courses_detail on users.id = courses_detail.user_id;
	
select
	courses.id,
	courses.title as course,
	courses.description,
	course_level.name as level,
	users.name as teacher,
	categories_detail.categorie_id as categorie,
	courses_videos.url as link
from courses
	left join course_level on courses.level = course_level.id
	left join users on courses.teacher = users.id
	left join categories_detail on courses.id = categories_detail.course_id  
	left join courses_videos on courses.id = courses_videos.course_id;



