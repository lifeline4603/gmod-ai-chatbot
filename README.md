# gmod-ai-chatbot
a lua and python script that automatically replies to ingame messages

## how the FUCK does this work
due to limitations, i had to split the script into 2 things, which is annoying. i would love to make a full lua version of this, but it would take a lot of work. anyone with bare minimum python knowledge (im talking running python code) can use this.

the lua script and python script communicate with eachother between 4 textfiles which are inside the garry's mod data folder. they're in there because gmod has a limitation on how much it can access, however, python doesnt.
**im using character.ai** as my chatbot model as it works the best and it talks like a normal person does, but **they dont have an official api**, which makes me have to resort to using unofficial community made apis. for character.ai. i picked the one for python because python is the easiest to work with.

the 4 textfiles all have a purpose, 2 for communication (validation), 2 for receiving/sending data (ai response, chat msgs). 
whenever a chat message is detected, it sets the value of `"chatbot_new_status.txt"` (validation file) to true and writes it to `"chatbot_new.txt"`. this gets picked up by the python script. 

if the value is set to true, thats an indicator that there is a new chat message inside of `"chatbot_new.txt"`, which automatically gets sent over to character.ai with the unofficial api. the python sets that file to false to indicate that it found it and its processing it.

once its done, it sends the string to `"chatbot_message.txt"` and it sets `"chatbot_status.txt"` to true. the lua script checks if the file is set to true, and if it is, it basically just filereads whatever is inside of that file and runs the say console command to reply to the message.

## known issues
- messages get cut off if they go above the chat limit
- detected af (i will never make it ud just like that, ill use cheat apis to make it secure and have different luas for those specifically)
- timeouts if you take too long to make a request (bad internet)
- unoptimized
- lazy

## to-do
- [ ] iron out any bugs
- [ ] add a retry to the python script to repeat 3 times before quitting
- [ ] add a check for string length and to split messages evenly
- [ ] put everything in 1 txt file
- [ ] easier execution
- [ ] possibly use old.character.api

## requirements
this script requires a few things to run. please make sure you have the following installed:
- latest version of [python](https://www.python.org/)
- full version of [ffmpeg](https://www.ffmpeg.org/download.html#build-windows)
  - [tutorial here](https://www.youtube.com/watch?v=IECI72XEox0)
- an account on [character.ai](https://character.ai)
- a garrys mod installation
- a lua executor
- sanity

> [!WARNING]
> this script is very unoptimized and can have many bugs. if you have any issues, please dm me on discord!
  
## credits
thank you to [skelcium](https://github.com/skelcium) for the inspiration. check out the original script [here](https://github.com/skelcium/CS2-Chatbot)
