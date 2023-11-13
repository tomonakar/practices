# 記事データを格納するためのテーブルを作成する

CREATE TABLE
    if NOT exists articles (
        article_id INTEGER UNSIGNED auto_increment PRIMARY KEY,
        title VARCHAR(100) NOT NULL,
        contents TEXT NOT NULL,
        username VARCHAR(100) NOT NULL,
        nice INTEGER NOT NULL,
        created_at datetime
    );

# コメントデータを格納するためのテーブルを作成する

CREATE TABLE
    if NOT exists comments (
        comment_id INTEGER UNSIGNED auto_increment PRIMARY KEY,
        article_id INTEGER UNSIGNED NOT NULL,
        message TEXT NOT NULL,
        created_at datetime,
        foreign key (article_id) references articles(article_id)
    );