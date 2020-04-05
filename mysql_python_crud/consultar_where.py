import mysql.connector
from mysql.connector import Error

def write_file(data, filename):
    # Convert binary data to proper format and write it on Hard Disk
    with open(filename, 'wb',encoding="utf8", errors='ignore') as file:
        file.write(data)

def readBLOB(img_id, photo, bioData):
    print("Reading BLOB data from python_image table")

    try:
        #Your credentials of connection
        connection = mysql.connector.connect(host='localhost',
                                            database='python_db',
                                            user='root',
                                            password='')

        cursor = connection.cursor(buffered=True)
        sql_fetch_blob_query = """select * from python_image where id = %s"""

        cursor.execute(sql_fetch_blob_query, (img_id,))
        record = cursor.fetchall()
        print(record)

    except mysql.connector.Error as error:
        print("Failed read BLOB data into MySQL table {}".format(error))

    finally:
        if (connection.is_connected()):
            cursor.close()
            connection.close()
            print("MySQL connection is closed")


readBLOB(1,'/output/img1.png',"/output/data.txt")