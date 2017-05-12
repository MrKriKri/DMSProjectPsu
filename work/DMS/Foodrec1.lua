local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

function gotoMenuuu(event)
	composer.gotoScene("menu2")
end

function gotoHistory(event)
	composer.gotoScene("Foodrec2")
end

--function gotoConFirm(event)
	-- body
--end

function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")
		display.setDefault("background",0.2,0.2,0.2)

--		ground = display.newRect(cx,50,cw,100)
--		ground:setFillColor(0.4,0.4,0.4)


		myText = display.newText("Food Record",cx,140-80,"Arial",50)
		myText1 = display.newText("Date",50,190,"Arial",20)
		myText2 = display.newText("Meal",47,235,"Arial",20)
		myText3 = display.newText("Food",50,280,"Arial",20)
		myText4 = display.newText("amount",50,325,"Arial",20)


		txfTextDate1 = native.newTextField(117,190 ,50, 30)
--		txfTextDate1.isSecure = true02
		txfTextMouth2 = native.newTextField(177,190 ,50, 30)
--		txfTextMouth2.isSecure = true
		txfTextYear3 = native.newTextField(237,190 ,50, 30)
--		txfTextYear3.isSecure = true
		txfText2 = native.newTextField(202,235 ,220, 30)
--		txfText2.isSecure = true
		txfText3 = native.newTextField(202,280 ,220, 30)
--		txfText3.isSecure = true
		txfText4 = native.newTextField(202,325 ,220, 30)
--		txfText4.isSecure = true


		myText5 = display.newText("Confirm",cx,380,"Arial",30)
		myText6 = display.newText("Back",30,500,"Arial",20)
		myText7 = display.newText("History",280,500,"Arial",20)

--Logo = widget.newButton(
--		   {
--		    x = 50, y = 50, 
--		    
--		    defaultFile = "logo.png" ,
--		    width = 80,
--		    height = 80
--		  }
--		)

		
--myText5:addEventListener("touch",gotoConFirm)
myText6:addEventListener("touch",gotoMenuuu)
myText7:addEventListener("touch",gotoHistory)

	elseif(phase == "did") then
		print("Scene #1 : show (did)")
	
	end
end

function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then

	
		myText:removeSelf()
		myText1:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		myText4:removeSelf()

		txfTextDate1:removeSelf()
		txfTextMouth2:removeSelf()
		txfTextYear3:removeSelf()
		txfText2:removeSelf()
		txfText3:removeSelf()
		txfText4:removeSelf()
		
		myText5:removeSelf()
		myText6:removeSelf()
		myText7:removeSelf()
--		ground:removeSelf()
--		Logo:removeSelf()
--		Logotext:removeSelf()

--		ground = nil

		myText = nil
		myText1 = nil
		myText2 = nil
		myText3 = nil
		myText4 = nil


		txfTextDate1 = nil 
		txfTextMouth2 = nil 
		txfTextYear3 = nil 
		txfText2 = nil 
		txfText3 = nil
		txfText4 = nil

		myText5 = nil
		myText6 = nil
		myText7 = nil
--		Logo = nil
--		Logotext = nil

		Runtime:removeEventListener("touch", screenTouched)
		print("Scene #1 : hide (will)")
	elseif(phase == "did") then
		print("Scene #1 : hide (did)")
	end
end

function scene:destroy(evevt)
	local sceneGroup = self.view
	print("Scene #1 : destroy")
end

cx = display.contentCenterX
cy = display.contentCenterY
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene