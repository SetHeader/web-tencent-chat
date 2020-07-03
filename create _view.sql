CREATE OR REPLACE VIEW messages_desc AS
  SELECT * FROM messages_table ORDER BY M_TIME DESC;

CREATE OR REPLACE VIEW messages_asc AS
  SELECT * FROM messages_table ORDER BY M_TIME ASC;


