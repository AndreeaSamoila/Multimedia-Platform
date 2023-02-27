#SOURCE C:/Users/Andreea.Samoila/Desktop/MultimediaPlatform/my-app/server/BD_site.sql;

DROP DATABASE siteDB;

CREATE DATABASE siteDB;

SHOW DATABASES;

USE siteDB;

CREATE TABLE tblUser (
                               UserId SMALLINT UNSIGNED PRIMARY KEY,
                               UserName VARCHAR(50) NOT NULL UNIQUE,
                               Email VARCHAR(50) NOT NULL UNIQUE,
                               Password VARCHAR(66) NOT NULL,
                               UserType VARCHAR(20) NOT NULL,
                               Logged BOOLEAN
);

DESCRIBE tblUser;

CREATE TABLE tblCourse (
                         CourseTeacherName VARCHAR(200) PRIMARY KEY,
                         CourseName VARCHAR(100) NOT NULL,
                         CourseCategory VARCHAR(100) NOT NULL,
                         ScheduledDay ENUM ('1','2','3','4','5','6','7') NOT NULL,
                         ScheduledHour TIME NOT NULL
);
DESCRIBE tblCourse;

CREATE TABLE tblCourseMaterials (
                                  CourseMaterialId SMALLINT UNSIGNED PRIMARY KEY,
                                  BelongTeacherCourse VARCHAR(100),
                                  FilePath VARCHAR(200),
                                  MaterialTitle VARCHAR(150),
                                  CONSTRAINT fk_belongTeacherCourse FOREIGN KEY(BelongTeacherCourse)
                                      REFERENCES tblCourse(CourseTeacherName) ON DELETE CASCADE ON UPDATE CASCADE

);
DESCRIBE tblCourseMaterials;


CREATE TABLE tblScheduledMeetings (
                                        Id SMALLINT PRIMARY KEY AUTO_INCREMENT,
                                        UserCode SMALLINT UNSIGNED,
                                        MeetingTeacherName VARCHAR(100),
                                        ConversationName VARCHAR(50),
                                        Active BOOLEAN,
                                        Notified BOOLEAN,
                                        CONSTRAINT fk_teacher FOREIGN KEY(MeetingTeacherName)
                                            REFERENCES tblCourse(CourseTeacherName) ON DELETE CASCADE ON UPDATE CASCADE,
                                        CONSTRAINT fk_userCode FOREIGN KEY(UserCode)
                                            REFERENCES tblUser(IdUtilizator) ON DELETE CASCADE ON UPDATE CASCADE
);
DESCRIBE tblScheduledMeetings;

CREATE TABLE tblMessage (
                          MessageId SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                          MessageRecipientUser INT NOT NULL,
                          MessageSentDate DATETIME NOT NULL,
                          MessageText TEXT NOT NULL,
                          MessageSentByUser SMALLINT UNSIGNED NOT NULL,
                          CONSTRAINT fk_sent FOREIGN KEY(MessageSentByUser)
                              REFERENCES tblUser(UserId) ON DELETE CASCADE ON UPDATE CASCADE
);

DESCRIBE tblMessage;

CREATE TABLE tblConversations(
                               ConversationId SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                               ConversationName VARCHAR(50)
);

DESCRIBE tblConversations;

CREATE TABLE tblUsersInConversation(
                                            id SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                            UsersInConversationCode SMALLINT UNSIGNED,
                                            ConversationCode SMALLINT UNSIGNED,
                                            CONSTRAINT fk_userCode FOREIGN KEY(UsersInConversationCode)
                                                REFERENCES tblUtilizator(UserId) ON DELETE CASCADE ON UPDATE CASCADE,
                                            CONSTRAINT fk_convCode FOREIGN KEY(ConversationCode)
                                                REFERENCES tblConversations(ConversationId) ON DELETE CASCADE ON UPDATE CASCADE
);

DESCRIBE tblUsersInConversation;



CREATE TABLE tblTopic(
                         TopicId SMALLINT UNSIGNED PRIMARY KEY  AUTO_INCREMENT,
                         TopicTitle VARCHAR(200) NOT NULL UNIQUE,
                         TopicSubject TEXT NOT NULL,
                         TopicImage VARCHAR(200)
);

DESCRIBE tblTopic;


CREATE TABLE tblComments(
                              CommentId SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                              TopicCode SMALLINT UNSIGNED NOT NULL,
                              CommentUserCode SMALLINT UNSIGNED NOT NULL,
                              CommentText TEXT,
                              CONSTRAINT fk_topicCode FOREIGN KEY(TopicCode)
                                  REFERENCES tblTopic(TopicId) ON DELETE CASCADE ON UPDATE CASCADE,
                              CONSTRAINT fk_userCode FOREIGN KEY(CommentUserCode)
                                  REFERENCES tblUser(UserId) ON DELETE CASCADE ON UPDATE CASCADE
);
DESCRIBE tblComments;

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO tblTopic VALUES
                         (1,'Limba Romana - Scoala Primara', 'Probleme intampinate la aceasta materie','caleimag'),
                         (2,'Limba Engleza - Scoala Primara', 'Cum putem invata mai eficient limba engleza?','caleimag'),
                         (3,'Matematica - Scoala Primara', 'Neclaritati legate de lucrurile elementare predate','caleimag'),
                         (4,'Limba Romana - Scoala Gimnaziala', 'Discutie deschisa despre pregatirea pentru evaluarea nationala','caleimag'),
                         (5,'Algebra - Scoala Gimnaziala', 'Neclaritati legate de notiunile de algebra','caleimag'),
                         (6,'Fizica - Scoala Gimnaziala', 'Probleme intampinate in rezolvarea problemelor de Fizica','caleimag'),
                         (7,'Chimie - Scoala Gimnaziala', 'Neclaritati legate de notiunile de Chimie','caleimag'),
                         (8,'Limba Romana - Liceu', 'Discutii de interes in ceea ce priveste bacalaureatul la Limba Romana','caleimag'),
                         (9,'Limba Engleza - Liceu', 'Cum putem ajunge sa vorbim fluent aceasta limba?','caleimag'),
                         (10,'Limba Franceza - Liceu', 'Neclaritati legate de citire, vorbire, scriere','caleimag'),
                         (11,'Analiza Matematica - Liceu', 'Probleme intampinate pentru pregatirea bacalaureatului','caleimag');

SELECT * FROM tblTopic;

INSERT INTO tblComments VALUES
                              (1, 1, 18, 'Nu am inteles cum se analizeaza o parte e vorbire. As dori o explicatie pe un exemplu concret'),
                              (2, 1, 17, 'As dori o explicatie pe un exemplu concret de compunere'),
                              (3, 2, 16, 'A inteles cineva cum se conjuga verbul A FI?'),
                              (4, 3, 5, 'Nu am inteles cum se fac problemele cu ecuatii simple. Are cineva un exemplu?');

SELECT * FROM tblComments;

SET FOREIGN_KEY_CHECKS=1;

INSERT INTO tblCourse VALUES

                        ('Claudia Visan', 'Limba Romana', 'Scoala Primara','1','12:00:00'),
                        ('Vasile Ion', 'Limba Engleza', 'Scoala Primara','3','23:00:00'),
                        ('Anca Ina', 'Matematica', 'Scoala Primara','4','12:00:00'),
                        ('Ion Popescu', 'Limba Romana', 'Scoala Gimnaziala','5','11:00:00'),
                        ('Luca Petre', 'Algebra', 'Scoala Gimnaziala','5','16:00:00'),
                        ('Sorin Iordan', 'Fizica', 'Scoala Gimnaziala','2','14:00:00'),
                        ('Matei Popa', 'Chimie', 'Scoala Gimnaziala','3','11:00:00'),
                        ('Ana Meroiu', 'Limba Romana', 'Liceu','7','15:00:00'),
                        ('Bianca Vilsanescu', 'Limba Engleza', 'Liceu','6','10:00:00'),
                        ('Victor Bucur', 'Limba Franceza','Liceu','7','12:00:00'),
                        ('Livia Manole', 'Analiza Matematica', 'Liceu','6','16:00:00');



SELECT * FROM tblCourse;
#adfsksgf$
INSERT INTO tblUser VALUES

	(1, 'Claudia Visan', 'claudia.v@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor', '0'),
	(2, 'Vasile Ion ', 'vasileion@yahoo.com', 'b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor','0'),
	(3, 'Anca Ina', 'a.anca@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor', '0'),
	(4, 'Ion Popescu', 'pop.ion@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor','0'),
	(5, 'Luca Petre', 'petreluca@gmail.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor', '0'),
	(6, 'Sorin Iordan', 'sorin.i@gmail.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor', '0'),
	(7, 'Matei Popa', 'matei_popa83@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor','0'),
	(8, 'Ana Meroiu', 'ana_meroiu23@gmail.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor','0'),
	(9, 'Bianca Vilsanescu', 'bianca.vilsanescu@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor','0'),
	(10, 'Victor Bucur', 'victor.b@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor','0'),
	(11, 'Livia Manole', 'm.livia@gmail.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','profesor','0'),
	(12, 'Viorel Popa', 'popa.viorel@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','elev', '0'),
	(13, 'Cosmin State', 'state.cosmin@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','elev', '0'),
	(14, 'Luiza Dinu', 'dinu.luis@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','elev', '0'),
	(15, 'Claudia Cernat', 'cernatc@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','elev', '0'),
	(16, 'George Neagu', 'george117@gmail.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','elev','0'),
	(17, 'Andrei Pop', 'pop.andrei@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','elev', '0'),
	(18, 'Samoila Andreea', 'a.samoilaa@yahoo.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','elev', '0'),
	(19, 'Stefan Ion', 'stefan_ion@gmail.com','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','elev', '0'),
	(20, 'A Tor', 'filip.badea@cnmv.ro','b8a2a9d9fd0fe68314aa8e0699313d4166a8571e970c073fda317ae319efd8c2','elev', '0');

SELECT * FROM tblUser;

INSERT INTO tblCourseMaterials VALUES
                                 (1, 'Claudia Visan', '/resurse/Clasele-II-IV.pdf','Exercitii de gramatica'),
                                 (2, 'Claudia Visan', 'http://educatieonline.md/Files/Manuals/4/IV_Limba%20romama%20(a.%202017).pdf','Manual de limba romana recomandat'),
                                 (3,'Vasile Ion', 'https://www.youtube.com/watch?v=3RK-OxvooUM', 'Teorie'),
                                 (4, 'Anca Ina','https://www.youtube.com/watch?v=3RK-OxvooUM', 'Teorie'),
                                 (5,'Ion Popescu','https://www.youtube.com/watch?v=3RK-OxvooUM', 'Teorie'),
                                 (6,'Luca Petre','https://www.youtube.com/watch?v=3RK-OxvooUM', 'Teorie'),
                                 (7,'Sorin Iordan','https://www.youtube.com/watch?v=3RK-OxvooUM', 'Teorie'),
                                 (8,'Matei Popa','https://www.youtube.com/watch?v=3RK-OxvooUM', 'Teorie'),
                                 (9, 'Livia Manole','https://www.youtube.com/watch?v=3RK-OxvooUM', 'Teorie'),
                                 (10,'Bianca Vilsanescu','https://www.youtube.com/watch?v=3RK-OxvooUM', 'Teorie'),
                                 (11,'Victor Bucur','https://www.youtube.com/watch?v=3RK-OxvooUM', 'Teorie'),
                                 (12,'Ana Meroiu','/pdff.pdf', 'Teorie'),
                                 (13,'Vasile Ion', 'https://www.youtube.com/watch?v=3RK-OxvooUM', 'Exercitii Propuse'),
                                 (14, 'Claudia Visan', 'https://www.youtube.com/embed/1OYqcQnYuVE','Tutorial'),
                                 (15, 'Claudia Visan', 'https://www.youtube.com/embed/Ak_nRVn8U4k','Tutorial'),
                                 (16,'Ana Meroiu','/resurse/22518591-Gramatica-limbii-romane.pdf', 'Teorie introductiva'),
                                 (17,'Ana Meroiu','/resurse/299631540-Modele-de-Analiza-Sintactica-Si-Morfologica.pdf', 'Analiza Sintactica si Morfologica'),
                                 (18,'Ana Meroiu','/resurse/fisrom.doc', 'Exercitii de verificare a cunostintelor'),
                                 (19,'Ana Meroiu','/resurse/fisrom.doc', 'Exercitii de verificare a cunostintelor');

SELECT * FROM tblCourseMaterials;



SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO tblConversations VALUES (1, 'Limba Romana - Scoala Primara');
INSERT INTO tblConversations VALUES (2, 'Limba Engleza - Scoala Primara');
INSERT INTO tblConversations VALUES (3, 'Matematica - Scoala Primara');
INSERT INTO tblConversations VALUES (4, 'Limba Romana - Scoala Gimnaziala');
INSERT INTO tblConversations VALUES (5, 'Algebra - Scoala Gimnaziala');
INSERT INTO tblConversations VALUES (6, 'Fizica - Scoala Gimnaziala');
INSERT INTO tblConversations VALUES (7, 'Chimie - Scoala Gimnaziala');
INSERT INTO tblConversations VALUES (8, 'Limba Romana - Liceu');
INSERT INTO tblConversations VALUES (9, 'Limba Engleza - Liceu');
INSERT INTO tblConversations VALUES (10, 'Limba Franceza - Liceu');
INSERT INTO tblConversations VALUES (11, 'Analiza Matematica - Liceu');


SELECT * FROM tblConversations;

INSERT INTO tblMessage VALUES (1, 1, '2021-06-16 23:08:49', 'Salut', 4);
INSERT INTO tblMessage VALUES (2, 1, '2021-06-16 23:10:52', 'Buna', 4);
INSERT INTO tblMessage VALUES (3, 2, '2021-06-15 23:11:15', 'Tess', 5);
INSERT INTO tblMessage VALUES (4, 2, '2021-06-16 20:44:38', 'Sal', 4);
INSERT INTO tblMessage VALUES (5, 1, '2021-06-16 21:01:16', 'Tesst', 4);
INSERT INTO tblMessage VALUES (6, 1, '2021-06-16 21:01:57', 'asd', 4);
INSERT INTO tblMessage VALUES (7, 2, '2021-06-17 06:18:58', 'Buna', 4);
INSERT INTO tblMessage VALUES (8, 2, '2021-06-17 06:19:18', 'Salut', 5);
INSERT INTO tblMessage VALUES (9, 2, '2021-06-17 07:19:18', 'hei', 5);

SELECT * FROM tblMessage;

INSERT INTO tblUsersInConversation VALUES (1, 1, 1);
INSERT INTO tblUsersInConversation VALUES (2, 2, 2);
INSERT INTO tblUsersInConversation VALUES (3, 3, 3);
INSERT INTO tblUsersInConversation VALUES (4, 4, 4);
INSERT INTO tblUsersInConversation VALUES (5, 5, 5);
INSERT INTO tblUsersInConversation VALUES (6, 6, 6);
INSERT INTO tblUsersInConversation VALUES (7, 7, 7);
INSERT INTO tblUsersInConversation VALUES (8, 8, 8);
INSERT INTO tblUsersInConversation VALUES (9, 9, 9);
INSERT INTO tblUsersInConversation VALUES (10, 10, 10);
INSERT INTO tblUsersInConversation VALUES (11, 11, 11);


SELECT * FROM tblUsersInConversation;
SET FOREIGN_KEY_CHECKS = 1;
