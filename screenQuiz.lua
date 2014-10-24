local composer = require( "composer" )
-- Enable auto-recycle on scene change
composer.recycleOnSceneChange = true

local scene = composer.newScene()

local globals = require( "globals" )

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
    --local optionButton = widget.newButton{
	--sheet = myGlobalData.imageSheet, defaultFrame = 50, overFrame = 51, onRelease = buttonOptions, }
	--optionButton.anchorX = 0.5
	--optionButton.anchorY = 0.5
	--optionButton.x = globals._w/2; optionButton.y = globals._h - 265
	--sceneGroup:insert( optionButton )

	local rect = display.newRect( 0, 0, globals._w, globals._h )
	rect:setFillColor( 1,0,0 )
	rect.anchorX = 0
	rect.anchorY = 0
	sceneGroup:insert(rect)

	-- Function to handle button events
	local function handleButtonEvent( event )

	    if ( "ended" == event.phase ) then
	        print( "Button was pressed and released" )
	        globals.indexNumber = globals.indexNumber + 1
	        --composer.gotoScene( "screenQuiz", {effect = "fade", time = 800} )
			--print("Going to the main Quiz from main quiz" .. globals.indexNumber)
			local sceneName = "scene".. globals.indexNumber
			globals.makeNewScene(sceneName)
			composer.gotoScene( sceneName )

	    end
	end

	local myButton = widget.newButton  -- button created in before scene moves into view
  {
      left = 100,
      top = 200,
      width = 150,
      height = 50,
      id = "button_1",
      label = "Button",
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
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
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
    print("Jeg blir killa " .. globals.indexNumber)
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

return scene