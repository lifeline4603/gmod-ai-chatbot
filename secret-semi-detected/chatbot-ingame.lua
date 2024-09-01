-- i should really change the naming of these files
secret.makefolder("chatbot")
secret.writefile("chatbot/chatbot_message.txt", "")
secret.writefile("chatbot/chatbot_status.txt", "false")
secret.writefile("chatbot/chatbot_new.txt", "")
secret.writefile("chatbot/chatbot_new_status.txt", "true")

-- security
local timerCreate = secret.get_original("timer", "Create")
local RunConCommand = secret.get_original("Player", "ConCommand")

timerCreate("periodic check", 1, 0, function()
    local message_received = secret.readfile("chatbot/chatbot_message.txt")
    local status = secret.readfile("chatbot/chatbot_status.txt")

    if status == "true" then
        RunConCommand(player, "say " .. message_received)
        secret.log(message_received, 0, true)
        secret.writefile("chatbot/chatbot_status.txt", "false")
    end
end)

hook.Add("OnPlayerChat", "FUCK", function(ply, msg, gchat, dead) -- this might be detected tbh
    if ply == LocalPlayer() then
        return false
    end

    if msg and msg ~= "" then
        local fmsg = msg .. "\n"
        secret.writefile("chatbot/chatbot_new.txt", fmsg)
        secret.writefile("chatbot/chatbot_new_status.txt", "true")
    end

    return false
end)