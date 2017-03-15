JSON = require("json")

function loadJSONListener(event)
	if not(event.isError)then
		resp = JSON.decode(event.response)
		if(resp) then
		print(resp[1]["ID"])
		print(resp[1]["E-mail"])
		print(resp[1]["Name"])
		print("true")
		else 
			print("fail paaword")
		end
	
	else 
		print("login fail") 
	end
end


function doRegister(mail,pass,name,surname,idcard,dob,tel)
    network.request(
        "http://localhost/ws.php?E-mail="..mail.."&Password="..pass.."&Name="..pass.."&Surname="..pass.."&IDcard="..pass.."&DOB="..pass.."&Tel="..pass,
        "GET",
        loadJSONListener,
        {}
    )
end