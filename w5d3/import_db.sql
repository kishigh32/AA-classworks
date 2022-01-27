DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;


PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users (fname, lname)
VALUES
    ("Victor", "Wang"),
    ("Kia", "Ghaderi");

---------------------------------

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    associated_author_id INTEGER NOT NULL,
    
    FOREIGN KEY (associated_author_id) REFERENCES users(id)
);

INSERT INTO
    questions (title, body, associated_author_id)
SELECT
    "Victor's Question", "SQL?", 1
FROM
    users
WHERE
    users.fname = "Victor" AND users.lname = "Wang";

INSERT INTO
    questions (title, body, associated_author_id)
SELECT
    "Kia's Question", "AA?", 2
FROM
    users
WHERE
    users.fname = "Kia" AND users.lname = "Ghaderi";

-----------------------------------


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    question_follows (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE users.fname = "Kia" AND users.lname = "Ghaderi"), 
    (SELECT id FROM questions WHERE questions.title = "Victor's Question")), 

    ((SELECT id FROM users WHERE users.fname = "Victor" AND users.lname = "Wang"), 
    (SELECT id FROM questions WHERE questions.title = "Victor's Question"));

-------------------------------------

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO 
    replies (question_id, parent_reply_id, author_id, body)
VALUES
    ((SELECT id FROM questions WHERE questions.title = "Victor's Question"), 
    NULL, 
    (SELECT id FROM users WHERE users.fname = "Kia" AND users.lname = "Ghaderi"), 
    "SQL SQL SQL"), 

    ((SELECT id FROM questions WHERE questions.title = "Victor's Question"), 
    1, 
    (SELECT id FROM users WHERE users.fname = "Victor" AND users.lname = "Wang"), 
    "Thank you");

--------------------------------------

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    like_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (like_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    question_likes (like_id, question_id)
VALUES
    ((SELECT id FROM users WHERE users.fname = "Kia" AND users.lname = "Ghaderi"),
    (SELECT id FROM questions WHERE questions.title = "Victor's Question"));