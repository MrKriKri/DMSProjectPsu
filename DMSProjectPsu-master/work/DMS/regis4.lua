local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene()

local function screenTouched(event)
	local phase = event.phase
	local xStart = event.xStart
	local xEnd = event.x
	local swipeLength = math.abs(xEnd - xStart)
	if(phase == "began") then
		return true
	elseif (phase == "ended" or phase == "cancelled") then
		if(xStart > xEnd and swipeLength > 50) then
			composer.gotoScene("regis1")
		elseif(xStart < xEnd and swipeLength > 50) then
			composer.gotoScene("regis2")
		end
	end
end

function scene:create(event)
	local sceneGroup = self.view
	print("Scene #4 : create")
end

local function showScene()
	composer.gotoScene("regis1")
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #4 : show (will)")
		display.setDefault("background",0,0,0)

		myText = display.newText("Register",cx,70,"Arial",50)

		myText1 = display.newText("Doctor",50,150,"Arial",20)
		myText2 = display.newText("Doctor's Line Id",55,195,"Arial",15)
		myText3 = display.newText("Person to notify",57,233,"Arial",12)
		myText4 = display.newText("in case os emergency",61,245,"Arial",12)
		myText5 = display.newText("Tel.",55,285,"Arial",15)
	
		txfText = native.newTextField(215,150 ,185, 30)
		txfText2 = native.newTextField(215,195 ,185, 30)
		txfText3 = native.newTextField(215,240 ,185, 30)
		txfText4 = native.newTextField(215,285 ,185, 30)

		LogoCon = widget.newButton(
   {
    x = cx-70, y = cy+150, 
    
    defaultFile = "Confirm.png" ,
    width = 129,
    height = 50
  }
)

LogoCan = widget.newButton(
   {
    x = cx+70, y = cy+150, 
    
    defaultFile = "Cancel.png" ,
    width = 119,
    height = 40
  }
)



	elseif(phase == "did") then
		print("Scene #4 : show (did)")
		--timer.performWithDelay(3000, showScene)
		Runtime:addEventListener("touch",screenTouched)
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
		myText5:removeSelf()
	
		txfText:removeSelf()
		txfText2:removeSelf()
		txfText3:removeSelf()
		txfText4:removeSelf()
		LogoCon:removeSelf()
		LogoCan:removeSelf()


		myText = nil
		myText1 = nil
		myText2 = nil
		myText3 = nil
		myText4 = nil

		txfText = nil
		txfText2 = nil
		txfText3 = nil
		txfText4 = nil
		LogoCan = nil
		LogoCon =nil


		Runtime:removeEventListener("touch", screenTouched)
		print("Scene #4 : hide (will)")
	elseif(phase == "did") then
		print("Scene #4 : hide (did)")
	end
end

function scene:destroy(evevt)
	local sceneGroup = self.view
	print("Scene #4 : destroy")
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene