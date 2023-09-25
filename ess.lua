
local red = (require 'redis').connect('127.0.0.1',6379)
if(session:ready()) then
        local var = session:getVariable("caller_id_number")
        freeswitch.consoleLog("info","the number is ".. var)
        empId = red:hget("employeeId",var)

        if empId ~= nil then
                local hrbp_no = red:hget("hrbp",empId)
                                session:execute("playback","/usr/local/freeswitch/sounds/en/us/callie/ivr/32000/ivr-thank_you.wav")
                                freeswitch.consoleLog("Warning","connecting to hrbp")
                                                session:execute("bridge","user/1002")

                                        else

                                                local count=1
                                                while count <=3 do
                                                        freeswitch.consoleLog("Info","Enter employee Id")
                                                local empId = session:playAndGetDigits(1,5,1,5000,"#","/usr/local/freeswitch/sounds/en/us/callie/ivr/32000/ivr-thank_you_for_calling.wav", "","\\d+")
                                                 local hrbp_no = red:hget("hrbp",empId)

                                                 if hrbp_no ~= nil then
                                                         session:execute("playback","/usr/local/freeswitch/sounds/en/us/callie/ivr/32000/ivr-thank_you.wav")
                                                         freeswitch.consoleLog("Warning","Connecting to hrbp")
                                                         session:execute("bridge","user/1002")
                                                 break

                                         else
                                                --  session:execute("playback","/usr/local/freeswitch/sounds/en/us/callie/ivr/16000/ivr-invalid_number_format.wav")
                                                 count=count+1

                                         end
                                 end
                         end
                 else
                         session:hangup()
                --       red:quit
                session:execute("sleep","10000")
                 end
                 -- hrdsadadcascaddadagit 



