JSON = require("json")

function loadJSONListener(event)
	if not(event.isError)then
		resp = JSON.decode(event.response)
		if(resp) then
		print(resp[1]["ID"])
		print(resp[1]["E-mail"])
		print("true")
		else 
			print("fail paaword")
		end
	
	else 
		print("login fail") 
	end
end


function doLogin(mail,pass)
    network.request(
        "http://localhost/welcome.php?name="..mail.."&age="..pass,
        "GET",
        loadJSONListener,
        {}
    )
end