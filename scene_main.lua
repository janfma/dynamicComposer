--======================================================================--
--== Scene Main
--======================================================================--
--== Load composer
local composer = require( "composer" )
-- Enable auto-recycle on scene change
composer.recycleOnSceneChange = true
local scene = composer.newScene()

--== Load globals module
local globals = require( 'globals' )

--== Localize Coronium
local coronium = globals.coronium
coronium.showStatus = true

--======================================================================--
--== Composer handlers
--======================================================================--
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
	    --======================================================================--
	    --== Coronium App Opened
	    --======================================================================--
	    coronium:appOpened()

    elseif ( phase == "did" ) then
        --======================================================================--
        --== Coronium Get all available quizes
        --======================================================================--
        coronium:run( "get")

    end
end
-- -------------------------------------------------------------------------------
-- Listener setup
scene:addEventListener( "show", scene )
-- -------------------------------------------------------------------------------

return scene