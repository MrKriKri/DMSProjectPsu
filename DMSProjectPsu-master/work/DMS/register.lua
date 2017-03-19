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
			print("something wrong")
		end
	
	else 
		print("fail Register") 
	end
end


function doRegister(mail,pass,name,surname,idcard,dob,tel,docname,docline,teldoc)
    network.request(
        "http://localhost/ws.php?E-mail="..mail.."&Password="..pass.."&Name="..pass.."&Surname="..pass.."&IDcard="..pass.."&DOB="..pass.."&Tel="..pass.."&Doctorname="..docname.."&LineID="..docline.."&=Teldoc"..teldoc,
        "GET",
        loadJSONListener,
        {}
    )
end