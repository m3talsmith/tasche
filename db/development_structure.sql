CREATE TABLE "projects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT NULL NULL, "description" text DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL);
CREATE TABLE "projects_tasks" ("project_id" integer DEFAULT NULL NULL, "task_id" integer DEFAULT NULL NULL);
CREATE TABLE "projects_users" ("project_id" integer DEFAULT NULL NULL, "user_id" integer DEFAULT NULL NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL);
CREATE TABLE "tags_tasks" ("tag_id" integer DEFAULT NULL NULL, "task_id" integer DEFAULT NULL NULL);
CREATE TABLE "tasks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT NULL NULL, "description" text DEFAULT NULL NULL, "priority" integer DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL, "user_id" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT NULL NULL, "password" varchar(255) DEFAULT NULL NULL, "is_active" boolean DEFAULT 't' NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20080916181716');

INSERT INTO schema_migrations (version) VALUES ('20080916181730');

INSERT INTO schema_migrations (version) VALUES ('20080916181820');

INSERT INTO schema_migrations (version) VALUES ('20081016173021');

INSERT INTO schema_migrations (version) VALUES ('20081016173541');

INSERT INTO schema_migrations (version) VALUES ('20081016174328');

INSERT INTO schema_migrations (version) VALUES ('20081016174647');

INSERT INTO schema_migrations (version) VALUES ('20081024174724');