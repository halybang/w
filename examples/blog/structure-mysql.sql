BEGIN;

CREATE TABLE users(
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(60) NOT NULL,
  crypted_password VARCHAR(60) NOT NULL,
  password_salt VARCHAR(20) NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY ( id )
);

CREATE TABLE posts(
  id INT NOT NULL AUTO_INCREMENT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  published_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  author_id INT NOT NULL,
  title varchar(255) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY ( id )
);


CREATE TABLE comments(
  id INT NOT NULL AUTO_INCREMENT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
  `text` text NOT NULL,
  author_id INT NOT NULL,
  post_id INT NOT NULL,
  PRIMARY KEY ( id )
);

ALTER TABLE posts ADD FOREIGN KEY (`author_id`) REFERENCES users(`id`);
ALTER TABLE comments ADD FOREIGN KEY (`author_id`) REFERENCES users(`id`);
ALTER TABLE comments ADD FOREIGN KEY (`post_id`) REFERENCES posts(`id`);

CREATE UNIQUE INDEX users_email_index ON users(email);

COMMIT;
