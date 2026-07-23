import mysql.connector
import os

def execute_sql_file(cursor, filename):
    with open(filename, 'r', encoding='utf-8') as f:
        sql = f.read()
    
    # Simple split by semicolon. Note: This might fail if semicolons are inside strings.
    # But usually sample data and schemas are simple enough.
    statements = sql.split(';')
    for statement in statements:
        if statement.strip():
            print(f"Executing: {statement[:50]}...")
            cursor.execute(statement)

try:
    conn = mysql.connector.connect(
        host="g1vam1.h.filess.io",
        port=3307,
        user="prak12_1147_meatscale",
        password="8b4bfb3354c86a57ee2771195a49ece6bd791756",
        database="prak12_1147_meatscale"
    )
    cursor = conn.cursor()
    
    print("Executing database.sql...")
    execute_sql_file(cursor, 'sql/database.sql')
    
    print("Executing sample_data.sql...")
    execute_sql_file(cursor, 'sql/sample_data.sql')
    
    conn.commit()
    print("Database import successful!")

except Exception as e:
    print(f"Error: {e}")
finally:
    if 'conn' in locals() and conn.is_connected():
        cursor.close()
        conn.close()
