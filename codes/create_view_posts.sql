DELIMITER //
DROP PROCEDURE IF EXISTS create_view_posts;
CREATE PROCEDURE create_view_posts()
BEGIN

	DROP TABLE IF EXISTS posts;

	CREATE TABLE posts AS
	SELECT
		fd.course AS 'disciplina_id',
		p2.created AS 'data',
		f.name AS 'nome_forum',
		p2.id AS 'post',
		p2.parent,
		p2.userid AS 'emissor',
		p1.userid AS 'receptor'
	FROM mdl_forum_posts p1
	INNER JOIN mdl_forum_posts p2 ON  p1.id=p2.parent
	INNER JOIN mdl_forum_discussions fd ON p1.discussion=fd.id
	INNER JOIN mdl_forum f ON fd.forum=f.id
	ORDER BY fd.course, p2.userid;

	ALTER TABLE posts ADD INDEX(disciplina_id);

END //
DELIMITER ;
