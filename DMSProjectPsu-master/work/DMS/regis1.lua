local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene()

composer.setVariable("emailSave", "")
composer.setVariable("pswSave", "")
composer.setVariable("cnfmpassSave", "")

function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end

local function showScene(event)
	if(event.phase=="ended") then
	composer.gotoScene("regis2")
end
end

local function backscene( event )
	if(event.phase == "ended")then
	composer.gotoScene("standard")
end
	-- body
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")
		display.setDefault("background",0,0,0)

		myText = display.newText("Register",cx,140-50,"Arial",60)
		myText1 = display.newText("Email",50,220,"Arial",20)
		myText2 = display.newText("Password",47,265,"Arial",20)
		myText3 = display.newText("Confirm",50,310,"Arial",20)

		txfText = native.newTextField(202,220 ,220, 30)
		txfText2 = native.newTextField(202,265 ,220, 30)
		txfText3 = native.newTextField(202,310 ,220, 30)
		nextbtn = widget.newButton(
				{x = cx+70, y = cy+250, 
    			onEvent = showScene,
    			defaultFile = "next.png" ,
    			width = 129,
    			height = 50}
    		)

		backbtn = widget.newButton(
				{x = cx-90, y = cy+250, 
    			onEvent = backscene,
    			defaultFile = "back.png" ,
    			width = 129,
    			height = 50}
    		)
		
		
	elseif(phase == "did") then
		print("Scene #1 : show (did)")
		
	end
end
function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		nextbtn:removeEventListener("touch",showScene)
		myText:removeSelf()
		myText1:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		txfText:removeSelf()
		txfText2:removeSelf()
		txfText3:removeSelf()
		nextbtn:removeSelf()
		backbtn:removeSelf()
		backbtn = nil
		nextbtn = nil
		myText = nil
		myText1 = nil
		myText2 = nil
		myText3 = nil
		txfText = nil
		txfText5 = nil
		txfText3 = nil
		

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