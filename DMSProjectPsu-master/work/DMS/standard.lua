local composer = require("composer")
local widget = require("widget")
require("login")
local scene = composer.newScene()

--------------------------------------------------------------------
function gotoRegis(event)
	composer.gotoScene("regis1")
end
--------------------------------------------------------------------
function gotoInside(event)
  if(event.phase=="ended") then
  print("click")
    doLogin(txfText.text,txfText2.text)
    
  end
end
----------------------------------------------------------------------------
function scene:create(event)
	local sceneGroup = self.view
	print("Scene #1 : create")
end
-----------------------------------------------------------------------------
function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase
	if(phase == "will") then
		print("Scene #1 : show (will)")
		
		cx = display.contentCenterX
		cy = display.contentCenterY
		display.setDefault("background",192,192,192)
		txfText = native.newTextField(180,220 ,220, 30)
		txfText2 = native.newTextField(180,265 ,220, 30)
		txfText.align = "center"
		txfText2.align = "center"

		Logo = widget.newButton(
		   {
		    x = 80, y = 70, 
		    
		    defaultFile = "logo.png" ,
		    width = 90,
		    height = 90
		  }
		)

		btnLogin = widget.newButton(
		   {
		    x = 90, y = cy +100, 
		    --onEvent = gotoInside,
		    defaultFile = "login.png" ,
		    width = 120,
		    height = 40
		  }
		)

		btnRegis = widget.newButton(
		   {
		    x = 230, y = cy +100, 
		    --onEvent = gotoRegis,
		    defaultFile = "Register.png" ,
		    width = 120,
		    height = 40
		  }
		)
		btnLogin:addEventListener("touch",gotoInside)
		btnRegis:addEventListener("touch",gotoRegis)
	elseif(phase == "did") then
		print("Scene #1 : show (did)")
		
	end
end
---------------------------------------------------------------
function scene:hide(evevt)
	local sceneGroup = self.view
	local phase = evevt.phase
	if(phase == "will") then
		btnLogin:removeEventListener("touch",gotoInside)
	    btnRegis:removeEventListener("touch",gotoRegis)
		txfText2:removeSelf()
		txfText:removeSelf()
		Logo:removeSelf()
		btnLogin:removeSelf()
		btnRegis:removeSelf()
		txfText=nil
		txfText2=nil
		Logo=nil
		btnRegis=nil
		btnLogin=nil
		
		
		print("Scene #1 : hide (will)")
	elseif(phase == "did") then
		print("Scene #1 : hide (did)")
	end
end
-------------------------------------------------------
function scene:destroy(evevt)
	local sceneGroup = self.view
	print("Scene #1 : destroy")
end
--------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene