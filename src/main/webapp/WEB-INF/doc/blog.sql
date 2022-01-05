/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE categroup(
		categrpno NUMERIC(7) NOT NULL PRIMARY KEY,
		cateName VARCHAR(50) NOT NULL,
		seq NUMERIC(7) NOT NULL,
		cdate DATE NOT NULL
);

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE cate(
		cateno NUMERIC(10) NOT NULL PRIMARY KEY,
		name VARCHAR(50) NOT NULL,
		categrpno NUMERIC(10) NOT NULL,
		registdate DATE NOT NULL,
		contentcnt NUMERIC(10) NOT NULL,
  FOREIGN KEY (categrpno) REFERENCES categroup (categrpno)
);

/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
CREATE TABLE contents(
		contentno NUMERIC(7) NOT NULL PRIMARY KEY,
		name VARCHAR(50) NOT NULL
);

