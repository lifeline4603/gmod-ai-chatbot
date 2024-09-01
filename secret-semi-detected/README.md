hello
# secret-semi-detected
this is the secretservice version which takes advantage of the api in order to iron out as many detection vectors as possible. i will make a proper menu for this soon.

## HOW USE OMG
1. make sure you install the requirements (read the readme on the actual repo)
2. download
3. open chatbot-api.py in visual studio code or any text editor (if you use notepad you suck)
4. go to line 6 where it says `workspace_folder = r"PATH TO YOUR WORKSPACE FOLDER"` and insert the path to ur workspace folder inside the quotes
5. insert your character.ai token in line 12
   - to get this token, go to [old.character.ai](https://old.character.ai) and run the following string in your developer console: `console.log(JSON.parse(localStorage.getItem("char_token")).value)`
6. insert your character id in line 13
   - to get this id, open up any chatbot in [character.ai](https://character.ai) and copy the following from the URL: ![](https://strw.club/images/ox00kb03eli8pm7.png)
7. insert your chat id in line 14
   - to get this, follow these steps:
     - visit neo.character.ai/chats/recent/<character id here>
     - example: neo.character.ai/chats/recent/liysP7EzuduBWAxhiOQliNAfr-v4qS0u9ocykV3bOmY.
     - look in the json file and look for the following key: creator_id:	"62-------"
8. save
9. run lua ingame
10. run python script (i recommend making a batch script)
have fun!
