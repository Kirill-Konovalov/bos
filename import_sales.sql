CREATE TABLE IF NOT EXISTS sales_report (
  metric VARCHAR(50),
  value NUMERIC
);

INSERT INTO sales_report (metric, value) VALUES
  ('Total Sales', 1750),
  ('Average Sale', 291.667),
  ('Max Sale', 1200);
