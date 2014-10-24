
	--======================================================================--
--== The first screen presented to the user when they start the app
--======================================================================--
--== Load composer
local composer = require( "composer" )
-- Enable auto-recycle on scene change
composer.recycleOnSceneChange = true


local scene = composer.newScene()

--== Load globals module
local globals = require( 'globals' )


--== Load the New Scene module
local newScene = require( 'newScene' )




--Create a new dynamic scene and open it
local sceneName = "scene".. globals.indexNumber
newScene.makeNewScene(sceneName)
composer.gotoScene( sceneName )




--======================================================================--
--== Composer handlers
--======================================================================--
-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    --Reset the index counter
    globals.indexNumber = 0
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
    --==Event Art logo
   

end







function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase


    --==Set up the images, input and stuff

    



    if ( phase == "will" ) then
	  



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