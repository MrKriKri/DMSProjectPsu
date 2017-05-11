JSON = require("json")
function  loadJSONListenerMeal(event)
	if not(event.isError)then
		print("success")
        resp = JSON.decode(event.response)
        print(resp[1])
        print(resp[2])
	else 
		print("fail connect")
end 

end 

function GetMeal()
    local url ="http://localhost/getallMeal.php"
    print(url)
    network.request(
        url,
        "GET",
        loadJSONListenerBloodrate,
        {}
    )
end
