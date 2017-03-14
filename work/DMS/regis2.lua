local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")




function scene:create(event)
	local sceneGroup = self.view
	print("Scene #2 : create")
end

local function showScene(event)
	if(event.phase=="ended") then
		composer.gotoScene("regis3")
	end
end

local function backscene( event )
	if(event.phase == "ended")then
	composer.gotoScene("regis1")
end
	-- body
end

function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #2 : show (will)")
		display.setDefault("background",1,0,1)

		myText = display.newText("Please Choose",160,140-50,"Arial",40)
		myText2 = display.newText("Men",cx-50,380,"Arial",20)
		myText3 = display.newText("Woman",cx+50,380,"Arial",20)

LogoMan = widget.newButton(
   {
    x = cx-50, y = cy+45, 
    
    defaultFile = "man.png" ,
    width = 130,
    height = 130
  }
)

LogoWomen = widget.newButton(
   {
    x = cx+50, y = cy+45, 
    
    defaultFile = "Women.png" ,
    width = 70,
    height = 130
  }
)
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
		print("Scene #2 : show (did)")
	end
end
function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		myText:removeSelf()
		myText2:removeSelf()
		myText3:removeSelf()
		LogoMan:removeSelf()
		LogoWomen:removeSelf()
		nextbtn:removeSelf()
		backbtn:removeSelf()
		backbtn = nil
		nextbtn = nil
		LogoMan = nil
		LogoWomen = nil
		myText = nil
		myText2 = nil
		myText3 = nil
		
		print("Scene #2 : hide (will)")
	elseif(phase == "did") then
		print("Scene #2 : hide (did)")
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