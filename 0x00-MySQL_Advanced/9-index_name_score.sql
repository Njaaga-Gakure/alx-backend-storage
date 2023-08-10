-- create index on `name` and `score` field
CREATE INDEX idx_name_first_score
ON names (name(1), score);
