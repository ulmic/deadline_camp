CREATE TABLE "ckeditor_assets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "data_file_name" varchar(255) NOT NULL, "data_content_type" varchar(255), "data_file_size" integer, "assetable_id" integer, "assetable_type" varchar(30), "type" varchar(30), "width" integer, "height" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "databases" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "ides" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "languages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_achievements" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_additional_educations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_jobs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "company" varchar(255), "started_at" date, "finished_at" date, "job" varchar(255), "responsibility" text(255), "achievements" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_langs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "language_id" integer, "level" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_others" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "description" text(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_preferences" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "description" text(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_skill_databases" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "database_id" integer, "level" varchar(255), "duration" varchar(255), "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_skill_ides" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "ide_id" integer, "level" varchar(255), "duration" varchar(255), "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_skill_os" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "os_id" integer, "level" varchar(255), "duration" varchar(255), "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_skill_others" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "name" varchar(255), "type" varchar(255), "level" varchar(255), "duration" varchar(255), "description" text(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_skill_program_langs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "program_lang_id" integer, "level" varchar(255), "duration" varchar(255), "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "member_skills" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "type" varchar(255), "dict_id" integer, "dict_type" varchar(255), "level" varchar(255), "duration" varchar(255), "description" text(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "members" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "state" varchar(255), "email" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "phone" varchar(255), "skype" varchar(255), "school" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "web" varchar(255), "camp_time" boolean, "camp_life" boolean, "camp_fee" boolean, "camp_notebook" boolean, "hobby" text(255), "sport" text(255), "password_digest" varchar(255) NOT NULL, "auth_token" varchar(255), "group" varchar(255), "how_hear_about_as" varchar(255), "facebook" varchar(255), "twitter" varchar(255), "vkontakte" varchar(255), "city" varchar(255), "birthday" date, "middle_name" varchar(255), "reason" text, "question" text);
CREATE TABLE "news" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "uri" varchar(255), "body" text, "published_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "state" varchar(255), "photo" text);
CREATE TABLE "os" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "others" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "pages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "uri" varchar(255), "body" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "photo_album_photos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "photo_album_id" integer, "image" varchar(255), "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "description" varchar(255), "main" boolean);
CREATE TABLE "photo_albums" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "state" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "description" varchar(255));
CREATE TABLE "program_langs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "password_digest" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "idx_ckeditor_assetable" ON "ckeditor_assets" ("assetable_type", "assetable_id");
CREATE INDEX "idx_ckeditor_assetable_type" ON "ckeditor_assets" ("assetable_type", "type", "assetable_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120525155004');

INSERT INTO schema_migrations (version) VALUES ('20120526084846');

INSERT INTO schema_migrations (version) VALUES ('20120530140424');

INSERT INTO schema_migrations (version) VALUES ('20120530143345');

INSERT INTO schema_migrations (version) VALUES ('20120531081819');

INSERT INTO schema_migrations (version) VALUES ('20120531103925');

INSERT INTO schema_migrations (version) VALUES ('20120531105847');

INSERT INTO schema_migrations (version) VALUES ('20120531113611');

INSERT INTO schema_migrations (version) VALUES ('20120531115507');

INSERT INTO schema_migrations (version) VALUES ('20120531130609');

INSERT INTO schema_migrations (version) VALUES ('20120531140229');

INSERT INTO schema_migrations (version) VALUES ('20120531140526');

INSERT INTO schema_migrations (version) VALUES ('20120531140620');

INSERT INTO schema_migrations (version) VALUES ('20120531141234');

INSERT INTO schema_migrations (version) VALUES ('20120531141341');

INSERT INTO schema_migrations (version) VALUES ('20120601134047');

INSERT INTO schema_migrations (version) VALUES ('20120601134243');

INSERT INTO schema_migrations (version) VALUES ('20120601142955');

INSERT INTO schema_migrations (version) VALUES ('20120605151140');

INSERT INTO schema_migrations (version) VALUES ('20120607122426');

INSERT INTO schema_migrations (version) VALUES ('20120608080449');

INSERT INTO schema_migrations (version) VALUES ('20120612161051');

INSERT INTO schema_migrations (version) VALUES ('20120613142419');

INSERT INTO schema_migrations (version) VALUES ('20120615124706');

INSERT INTO schema_migrations (version) VALUES ('20120615172240');

INSERT INTO schema_migrations (version) VALUES ('20120616140301');

INSERT INTO schema_migrations (version) VALUES ('20120616173110');

INSERT INTO schema_migrations (version) VALUES ('20120617095741');

INSERT INTO schema_migrations (version) VALUES ('20120617170759');

INSERT INTO schema_migrations (version) VALUES ('20120617180926');

INSERT INTO schema_migrations (version) VALUES ('20120621090527');

INSERT INTO schema_migrations (version) VALUES ('20120625103503');

INSERT INTO schema_migrations (version) VALUES ('20120625135150');

INSERT INTO schema_migrations (version) VALUES ('20120625161057');

INSERT INTO schema_migrations (version) VALUES ('20120710092759');

INSERT INTO schema_migrations (version) VALUES ('20120710094832');

INSERT INTO schema_migrations (version) VALUES ('20120711091342');

INSERT INTO schema_migrations (version) VALUES ('20120711092309');

INSERT INTO schema_migrations (version) VALUES ('20120713113813');

INSERT INTO schema_migrations (version) VALUES ('20120905132524');

INSERT INTO schema_migrations (version) VALUES ('20120907104113');

INSERT INTO schema_migrations (version) VALUES ('20120907105301');

INSERT INTO schema_migrations (version) VALUES ('20120907105330');

INSERT INTO schema_migrations (version) VALUES ('20130704155359');

INSERT INTO schema_migrations (version) VALUES ('20130704155619');

INSERT INTO schema_migrations (version) VALUES ('20130704155854');

INSERT INTO schema_migrations (version) VALUES ('20130704160032');

INSERT INTO schema_migrations (version) VALUES ('20130704160131');

INSERT INTO schema_migrations (version) VALUES ('20130704160253');

INSERT INTO schema_migrations (version) VALUES ('20130704160824');

INSERT INTO schema_migrations (version) VALUES ('20130704192457');

INSERT INTO schema_migrations (version) VALUES ('20130704211054');

INSERT INTO schema_migrations (version) VALUES ('20130704212116');

INSERT INTO schema_migrations (version) VALUES ('20130704213916');

INSERT INTO schema_migrations (version) VALUES ('20130704215419');

INSERT INTO schema_migrations (version) VALUES ('20130705094417');