import psycopg2

con = psycopg2.connect("dbname=test user=MainUser password=123 host=192.168.0.102 port=5432")
cur = con.cursor()
cur.execute("SELECT x, y FROM fn ORDER BY x;")
arr = cur.fetchall()
cur.close()
con.close()

f = open("sin.csv", "w")

for row in arr:
    f.write(f"{row[0]},{row[1]}\n")
f.close()