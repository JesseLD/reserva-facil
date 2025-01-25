CREATE TABLE "Users" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "email" varchar(150) UNIQUE,
  "password" varchar(255),
  "phone" varchar(15),
  "birth_date" date,
  "cpf_cnpj" varchar(14) UNIQUE,
  "store_id" integer,
  "active" boolean,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "UserAddresses" (
  "id" serial PRIMARY KEY,
  "user_id" integer,
  "cep" varchar(9),
  "state" char(2),
  "city" varchar(100),
  "neighborhood" varchar(100),
  "address_line" varchar(100),
  "latitude" decimal(10,8),
  "longitude" decimal(11,8)
);

CREATE TABLE "Store" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "description" text,
  "active" boolean,
  "logo_url" varchar(255),
  "phone" varchar(15),
  "reservation_capacity" integer,
  "category_id" integer,
  "responsible_id" integer,
  "created_at" timestamp
);

CREATE TABLE "StoreManagers" (
  "id" serial PRIMARY KEY,
  "store_id" integer,
  "manager_id" integer
);

CREATE TABLE "Managers" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "email" varchar(150),
  "phone" varchar(15)
);

CREATE TABLE "Localization" (
  "id" serial PRIMARY KEY,
  "store_id" integer,
  "cep" varchar(9),
  "state" char(2),
  "city" varchar(100),
  "neighborhood" varchar(100),
  "complement" varchar(100),
  "latitude" decimal(10,8),
  "longitude" decimal(11,8),
  "map_url" varchar(255)
);

CREATE TABLE "StoreCategories" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "description" varchar(255)
);

CREATE TABLE "OpeningTimes" (
  "id" serial PRIMARY KEY,
  "store_id" integer,
  "week_day" smallint,
  "opening_time" time,
  "close_time" time,
  "active" boolean
);

CREATE TABLE "Reservation" (
  "id" serial PRIMARY KEY,
  "user_id" integer,
  "store_id" integer,
  "reservation_date" timestamp,
  "status_id" integer,
  "enter_date" timestamp,
  "exit_date" timestamp,
  "observation" varchar(255),
  "created_at" timestamp,
  "total_value" decimal(10,2),
  "paid_value" decimal(10,2)
);

CREATE TABLE "ReservationStatus" (
  "id" serial PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "Menu" (
  "id" serial PRIMARY KEY,
  "store_id" integer,
  "name" varchar(100),
  "description" text,
  "price" decimal(10,2),
  "category_id" integer
);

CREATE TABLE "MenuCategories" (
  "id" serial PRIMARY KEY,
  "name" varchar(100)
);

CREATE TABLE "Reviews" (
  "id" serial PRIMARY KEY,
  "user_id" integer,
  "store_id" integer,
  "note" smallint,
  "comment" text,
  "created_at" timestamp
);

CREATE TABLE "Notifications" (
  "id" serial PRIMARY KEY,
  "reservation_id" integer,
  "type_id" integer,
  "sent" boolean,
  "send_date" timestamp,
  "sent_at" timestamp,
  "created_at" timestamp
);

CREATE TABLE "NotificationTypes" (
  "id" serial PRIMARY KEY,
  "name" varchar(100)
);

CREATE TABLE "ActiveSessions" (
  "id" serial PRIMARY KEY,
  "client_id" integer,
  "client_type_id" integer,
  "session_token" varchar(255),
  "ip_address" varchar(45),
  "user_agent" varchar(255),
  "created_at" timestamp,
  "updated_at" timestamp,
  "last_activity" timestamp,
  "expired" boolean
);

CREATE TABLE "ClientType" (
  "id" serial PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "StoreResponsibles" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "cpf" varchar(11)
);

CREATE TABLE "Employees" (
  "id" serial PRIMARY KEY,
  "store_id" integer,
  "name" varchar(100),
  "email" varchar(150) UNIQUE,
  "phone" varchar(15),
  "role_id" integer,
  "active" boolean,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Roles" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "description" varchar(255),
  "created_at" timestamp
);

CREATE TABLE "Permissions" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "description" varchar(255)
);

CREATE TABLE "RolePermissions" (
  "id" serial PRIMARY KEY,
  "role_id" integer,
  "permission_id" integer
);

CREATE TABLE "PermissionGroups" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "description" varchar(255),
  "created_at" timestamp
);

CREATE TABLE "EmployeePermissions" (
  "id" serial PRIMARY KEY,
  "employee_id" integer,
  "group_id" integer,
  "assigned_at" timestamp
);

ALTER TABLE "Users" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "UserAddresses" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Store" ADD FOREIGN KEY ("category_id") REFERENCES "StoreCategories" ("id");

ALTER TABLE "Store" ADD FOREIGN KEY ("responsible_id") REFERENCES "StoreResponsibles" ("id");

ALTER TABLE "StoreManagers" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "StoreManagers" ADD FOREIGN KEY ("manager_id") REFERENCES "Managers" ("id");

ALTER TABLE "Localization" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "OpeningTimes" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "Reservation" ADD FOREIGN KEY ("status_id") REFERENCES "ReservationStatus" ("id");

ALTER TABLE "Menu" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "Menu" ADD FOREIGN KEY ("category_id") REFERENCES "MenuCategories" ("id");

ALTER TABLE "Reviews" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Reviews" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "Notifications" ADD FOREIGN KEY ("reservation_id") REFERENCES "Reservation" ("id");

ALTER TABLE "Notifications" ADD FOREIGN KEY ("type_id") REFERENCES "NotificationTypes" ("id");

ALTER TABLE "ActiveSessions" ADD FOREIGN KEY ("client_type_id") REFERENCES "ClientType" ("id");

ALTER TABLE "Employees" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "Employees" ADD FOREIGN KEY ("role_id") REFERENCES "Roles" ("id");

ALTER TABLE "RolePermissions" ADD FOREIGN KEY ("role_id") REFERENCES "Roles" ("id");

ALTER TABLE "RolePermissions" ADD FOREIGN KEY ("permission_id") REFERENCES "Permissions" ("id");

ALTER TABLE "EmployeePermissions" ADD FOREIGN KEY ("employee_id") REFERENCES "Employees" ("id");

ALTER TABLE "EmployeePermissions" ADD FOREIGN KEY ("group_id") REFERENCES "PermissionGroups" ("id");
