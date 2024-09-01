import asyncio
from PyCAI2 import PyAsyncCAI2
import time
import os

data_folder = r"PATH TO YOUR DATA FOLDER"
new_message_file = os.path.join(data_folder, "chatbot_new.txt")
response_file = os.path.join(data_folder, "chatbot_message.txt")
status_file = os.path.join(data_folder, "chatbot_status.txt")
new_message_status_file = os.path.join(data_folder, "chatbot_new_status.txt")

token = 'YOUR TOKEN HERE'
char_id = 'CHARACTER ID HERE'
chat_id = 'CHAT ID HERE LOL'

client = PyAsyncCAI2(token)



def read_file(file_path):
    if os.path.exists(file_path):
        with open(file_path, 'r', encoding='utf-8') as file:
            return file.read().strip()
    return None

def write_file(file_path, content):
    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(content)

async def process_chat():
    while True:
        new_message_status = read_file(new_message_status_file)
        if new_message_status == "true":
            new_message = read_file(new_message_file)
            if new_message:
                print(f"WEEWOO NEW MESSAGE: {new_message}")

                async with client.connect(token) as chat2:
                    response = await chat2.send_message(char=char_id, text=new_message, author_name=chat_id, Return_name=False)
                    print(f"reply: {response}")

                    write_file(response_file, response)

                    write_file(status_file, "true")

                write_file(new_message_file, "")
                write_file(new_message_status_file, "false")
        
        time.sleep(1) # goodbye cpu UPDATE: cpu ur okay

asyncio.run(process_chat())
