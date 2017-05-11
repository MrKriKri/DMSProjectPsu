local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")


function scene:create(event)
	local sceneGroup = self.view
	print("Scene #3 : create")
end

local function showScene(event)
	if(event.phase=="ended") then
		composer.gotoScene("regis4")
	end
end

local function backscene( event )
	if(event.phase == "ended")then
	composer.gotoScene("regis2")
end
	-- body
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #3 : show (will)")
		display.setDefault("background",0/255,162/255,232/255)

		myText = display.newText("Register",cx,70,"Arial",50)

		myText1 = display.newText("Name",50,150,"Arial",20)
		myText2 = display.newText("Surname",55,195,"Arial",20)
		myText3 = display.newText("ID card No.",55,240,"Arial",18)
		myText4 = display.newText("Date of Birth",55,285,"Arial",15)
		myText5 = display.newText("Tel.",55,330,"Arial",20)
		myText6 = display.newText("Medical Problems",65,375,"Arial",15)

		txfText = native.newTextField(215,150 ,185, 30)
		txfText2 = native.newTextField(215,195 ,185, 30)
		txfText3 = native.newTextField(215,240 ,185, 30)
		txfText3.inputType = "number"
		txfText4 = native.newTextField(215,285 ,185, 30)
		txfText5 = native.newTextField(215,330 ,185, 30)
		txfText5.inputType = "number"
		txfText6 = native.newTextField(218,375 ,185, 30)
				nextbtn = widget.newButton(
				{x = cx+100, y = cy+230, 
    			onEvent = showScene,
    			defaultFile = "next.png" ,
    			width = 80,
    			height = 60}
    		)

		backbtn = widget.newButton(
				{x = cx-100, y = cy+230, 
    			onEvent = backscene,
    			defaultFile = "back.png" ,
    			width = 80,
    			height = 60}
    		)
		txfText.text = composer.getVariable("name")
		txfText2.text = composer.getVariable("lname")
		txfText3.text = composer.getVariable("idcard")
		txfText4.text = composer.getVariable("birthdate")
		txfText5.text = composer.getVariable("tel")

	elseif(phase == "did") then
		print("Scene #3 : show (did)")
		
	end
end
function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then

		composer.setVariable("name",txfText.text)
		composer.setVariable("lname",txfText2.text)
		composer.setVariable("idcard",txfText3.text)
		composer.setVariable("birthdate",txfText4.text)
		composer.setVariable("tel",txfText5.text)

		myText:removeSelf()
		myText1:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		myText4:removeSelf()
		myText5:removeSelf()
		myText6:removeSelf()
		txfText:removeSelf()
		txfText2:removeSelf()
		txfText3:removeSelf()
		txfText4:removeSelf()
		txfText5:removeSelf()
		txfText6:removeSelf()
		nextbtn:removeSelf()
		backbtn:removeSelf()
		backbtn = nil
		nextbtn=nil
		myText = nil
		myText1 = nil
		myText2 = nil
		myText3 = nil
		myText4 = nil
		myText5 = nil
		myText6 = nil
		txfText = nil
		txfText2 = nil
		txfText3 = nil
		txfText4 = nil
		txfText5 = nil
		txfText6 = nil

		print("Scene #3 : hide (will)")
	elseif(phase == "did") then
		print("Scene #3 : hide (did)")
	end
end

function scene:destroy(evevt)
	local sceneGroup = self.view
	print("Scene #3 : destroy")
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene