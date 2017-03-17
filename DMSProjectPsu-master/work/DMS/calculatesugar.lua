local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene()
local titleText, hTextField, wTextField, bmiText

local function screenTouched(event)
	local phase = event.phase
	local xStart = event.xStart
	local xEnd = event.x
	local swipeLength = math.abs(xEnd - xStart) 
	if (phase == "began") then
		return true
	elseif (phase == "ended" or phase == "cancelled") then
		
		if (xStart < xEnd and swipeLength > 50) then 
			composer.gotoScene("menu1")
		end 
	end	
end

local function calculateSugar(event)
	local h = tonumber(hTextField.text)
	local w = tonumber(wTextField.text)
	if(h==nil or w == nil ) then
		bmiText.text=""
	else
	if(h<50) then
		if(w<140) then
			bmiText.text ="ปกติ"
		else 
			bmiText.text="เสี่ยงเป็นเบาหวาน"
		end
	
	elseif(h>=50 and h<59) then 
		if(w<150) then
			bmiText.text ="ปกติ"
		else 
			bmiText.text="เสี่ยงเป็นเบาหวาน"
		end
	elseif(h>=60) then
		if(w<160) then
			bmiText.text ="ปกติ"
		else 
			bmiText.text="เสี่ยงเป็นเบาหวาน"
	end
end
end
end

local function textFieldHandler(event)
	calculateSugar(event)
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	local cx, cy
	cx = display.contentCenterX
	cy = display.contentCenterY
	if (phase == "will") then
		display.setDefault("background", 77 / 255, 86 / 255, 86 / 255)
		titleText = display.newText("Blood sugar", cx, 100, "Quark-Bold", 40)
		titleText1=display.newText("AGE",50, 180, "Quark-Bold",40)
		titleText2=display.newText("SUGAR",50, 230, "Quark-Bold",25)
		titleText3=display.newText("year",250, 180, "Quark-Bold",20)
		titleText4=display.newText(" mg/dl",250,230, "Quark-Bold",20)

		hTextField = native.newTextField(cx, 180, 130, 40)
		wTextField = native.newTextField(cx, 230, 130, 40)
		hTextField.inputType = "number"
		wTextField.inputType = "number"
		hTextField.align = "center"
		wTextField.align = "center"
		bmiText = display.newText("0.00", cx, 300, "Quark-Bold", 40)
		sceneGroup:insert(titleText)
		sceneGroup:insert(bmiText)
		hTextField.text = composer.getVariable("age")
		wTextField.text = composer.getVariable("sugar")
		calculateSugar()		
	elseif (phase == "did") then	
		hTextField:addEventListener("userInput", textFieldHandler)	
		wTextField:addEventListener("userInput", textFieldHandler)	
		Runtime:addEventListener("touch", screenTouched)
	end
end

function scene:hide(event)
	local sceneGroup = self.view
	local phase = event.phase
	if (phase == "will") then
		composer.setVariable("age", hTextField.text)
		composer.setVariable("sugar", wTextField.text)
		hTextField:removeEventListener("userInput", textFieldHandler)	
		wTextField:removeEventListener("userInput", textFieldHandler)	
		titleText:removeSelf()
		titleText1:removeSelf()
		titleText2:removeSelf()
		titleText3:removeSelf()
		titleText4:removeSelf()
		hTextField:removeSelf()
		wTextField:removeSelf()
		bmiText:removeSelf()
		titleText = nil
		titleText1 = nil
		titleText2 = nil
		titleText3 = nil
		titleText4 = nil
		hTextField = nil
		wTextField = nil
		calButton = nil
		bmiText = nil
		Runtime:removeEventListener("touch", screenTouched)
	elseif (phase == "did") then
	end
end

function scene:destroy(event)
	local sceneGroup = self.view
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene