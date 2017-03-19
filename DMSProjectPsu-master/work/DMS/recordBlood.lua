

function  loadJSONListener(event)
	if not(event.isError)then
		print("something wrong")

	else 
		print(record complete)
end 

end 





function RecordSugarBloodRate(ID,sugar)
    network.request(
        "http://localhost/welcome.php?ID="..ID.."&sugar="..sugar,
        "GET",
        loadJSONListener,
        {}
    )
end
