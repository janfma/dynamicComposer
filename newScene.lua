
local newScene = {}
--Dynamic scene creation function
newScene.makeNewScene = function ( scene_name )
	
print("Creating new Dynamic Scene: " .. scene_name)

--Add composer and add a new scene with desired name
local composer = require( "composer" )
composer.recycleOnSceneChange = true
local scene = composer.newScene( scene_name )

--Get globals
local globals = require( "globals" )

--Get the new Scene module (template)
local newScene = require( "newScene" )

--Adding the widget for Buttons
local widget = require( "widget" )
-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
  
	
  

  --Make a background with random background color
  local rect = display.newRect( 0, 0, globals._w, globals._h )
  local ra = math.random( 255 )
  rect:setFillColor( ra/255 )
	rect.anchorX = 0
	rect.anchorY = 0
	sceneGroup:insert(rect)

	-- Function to handle button events
	local function handleButtonEvent( event )

	    if ( "ended" == event.phase ) then
	        print( "Button was pressed and released" )

          --Add one more to the number for keeping track of the dynamic windows
	         globals.indexNumber = globals.indexNumber + 1
	        
    			local sceneName = "scene".. globals.indexNumber
    			newScene.makeNewScene(sceneName)
    			composer.gotoScene( sceneName,  {effect = "fromLeft", time = 1200})

	    end
	end

	local myButton = widget.newButton  -- button created in before scene moves into view
  {
      left = 100,
      top = 200,
      width = 150,
      height = 50,
      id = "button_1",
      label = "Button " .. globals.indexNumber,
      onEvent = handleButtonEvent

      
  }
  sceneGroup:insert(myButton)


end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
        --composer.removeScene( "screenStart", false ) --kill the textboxs!?!?

    elseif ( phase == "did" ) then

    	
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view
    print("Last scene was destroyed " .. globals.indexNumber)
    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

--table.insert( globals.scenes,1, scene ) -- insert the new scene in position 1
scene._composerFileName = nil
return scene
--return scene


end -- End dynamic scene creation


return newScene
