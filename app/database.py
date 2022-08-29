import psycopg2



class DatabaseConnection:
    
    def __init__(self):
        # TODO Change this later
        connection = psycopg2.connect(
            dbname='postgres',
            user='postgres',
            password='postgres',
            host='localhost'
        )
        print(connection)
        pass


