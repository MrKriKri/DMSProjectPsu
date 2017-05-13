

function  loadJSONListenerMealrecord(event)
	if not(event.isError)then
		print("record success")

	else 
		print("fail record")
end 

end 

function RecordMeal(ID,Meal,Food,Amount)
    local url ="http://localhost/record_Meal.php?ID="..ID.."&Meal="..Meal.."&Food="..Food.."&Amount="..Amount
    print(url)
    network.request(
        url,
        "GET",
        loadJSONListenerBloodrate,
        {}
    )
end
