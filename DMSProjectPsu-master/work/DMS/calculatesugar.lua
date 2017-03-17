local composer = require("composer")
local widget = require("widget")

local scene = composer.newScene()
local titleText, hTextField, wTextField, bmiText,agetxt,age2txt,ptxt,mmhgtxt,ptxtfield2,ptxt2,pptxt
local btn1,btn2,btn3

local function screenTouched(event)
	local phase = event.phase
	local xStart = event.xStart
	local xEnd = event.x
	local swipeLength = math.abs(xEnd - xStart) 
	if (phase == "began") then
		return true
	elseif (phase == "ended" or phase == "cancelled") then
		if (xStart > xEnd and swipeLength > 50) then 
			composer.gotoScene("menu1")
		elseif (xStart < xEnd and swipeLength > 50) then 
			--composer.gotoScene("scene6")
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

function scene:create(event)
	local sceneGroup = self.view
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
		display.setDefault("background", 77/255,86/255,200/255)
		titleText = display.newText("Blood sugar", cx, 100, "Quark-Bold", 40)
		agetxt = display.newText("AGE",cx-100,180,"Quark-Bold",30)
		age2txt = display.newText("years",280,180,"Quark-Bold",30)

		hTextField = native.newTextField(cx, 180, 130, 40)
		ptxt = display.newText("SUGAR",cx-110,230,"Quark-Bold",24)
		mmhgtxt = display.newText("mg/dl",cx+110,230,"Quark-Bold",30)
		bmiText = display.newText("", cx, 300, "Quark-Bold", 50)

		wTextField = native.newTextField(cx, 230, 130, 40)
		hTextField.inputType = "number"
		wTextField.inputType = "number"
		hTextField.align = "center"
		wTextField.align = "center"                                                                                                                             
		bmiText = display.newText("", cx, 350, "Quark-Bold", 40)
		sceneGroup:insert(titleText)
		sceneGroup:insert(bmiText)
		--hTextField.text = composer.getVariable("hSave")
		--wTextField.text = composer.getVariable("wSave")
		
		

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
		--composer.setVariable("hSave", hTextField.text)
		--composer.setVariable("wSave", wTextField.text)
		hTextField:removeEventListener("userInput", textFieldHandler)	
		wTextField:removeEventListener("userInput", textFieldHandler)	
		Runtime:removeEventListener("touch", screenTouched)
		titleText:removeSelf()
		hTextField:removeSelf()
		wTextField:removeSelf()
		bmiText:removeSelf()
		ptxt:removeSelf()
		age2txt:removeSelf()
		agetxt:removeSelf()
		mmhgtxt:removeSelf()
		
		
		mmhgtxt = nil
		titleText = nil
		hTextField = nil
		wTextField = nil
		calButton = nil
		bmiText = nil
		ptxt = nil
		agetxt = nil
		age2txt = nil
		
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