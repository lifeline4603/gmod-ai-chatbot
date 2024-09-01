-- i should really change the naming of these files
file.Write("chatbot_message.txt", "")
file.Write("chatbot_status.txt", "false")
file.Write("chatbot_new.txt", "")
file.Write("chatbot_new_status.txt", "true")



timer.Create("periodic check", 1, 0, function()
    local message_received = file.Read("chatbot_message.txt", "DATA")
    local status = file.Read("chatbot_status.txt", "DATA")

    if status == "true" then
        RunConsoleCommand("say", message_received)
        print(message_received) -- you can remove this if you want
        file.Write("chatbot_status.txt", "false")
    end
end)

hook.Add("OnPlayerChat", "FUCK", function(ply, msg, gchat, dead)
    if ply == LocalPlayer() then
        return false
    end

    if msg and msg ~= "" then
        local fmsg = msg .. "\n"
        file.Write("chatbot_new.txt", fmsg)
        file.Write("chatbot_new_status.txt", "true")
    end

    return false
end)
