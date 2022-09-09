import psycopg2

def conecta_db():
  con = psycopg2.connect(host='localhost', 
                         database='db_deputados',
                         user='postgres', 
                         password='postgres')
  return con