local composer = require("composer")
JSON = require("json")

function  loadJSONListener(event)
	if not(event.isError)then
		resp = JSON.decode(event.response)

		

		print(resp[1]["ID"])
		print(resp[1]["E-mail"])
	
		checklogin = true

		checkLogin(checklogin)
		return checklogin

	else 
		print("login fail")
		checklogin = false
		checkLogin(checklogin)
		return checklogin

end -- end if!error

end -- end of function



function checkLogin(checklogin)

	if(checklogin == true)then
		composer.gotoScene("menu1")

end
end

function LogOut(checklogin)
	if(checklogin == true)then
		composer.gotoScene("standard")
	end
end


function Login(mail,pass)
    network.request(
        "http://localhost/welcome.php?name="..mail.."&age="..pass,
        "GET",
        loadJSONListener,
        {}
    )
end
