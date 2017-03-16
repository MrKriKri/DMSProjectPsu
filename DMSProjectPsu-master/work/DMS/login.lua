local composer = require("composer")
JSON = require("json")

local checklogin 

function  loadJSONListener(event)
	if not(event.isError)then
		resp = JSON.decode(event.response)
		
		if(resp) then
		print(resp[1]["ID"])
		print(resp[1]["E-mail"])
		
		checklogin = true

		if(checklogin == true)then
			composer.gotoScene("menu1")
		end
		
		else 
			print("fail paaword")
			
		end

	else 
		print("login fail") 
		
	end

end

--print("checklogin = "..checklogin)


function doLogin(mail,pass)
    network.request(
        "http://localhost/welcome.php?name="..mail.."&age="..pass,
        "GET",
        loadJSONListener,
        {}
    )
end