-------------------------------------------------------------
-- Coronium Composer
-------------------------------------------------------------
local globals = require( "globals" )


--== Start composer
local composer = require( 'composer' )
-- Enable auto-recycle on scene change
composer.recycleOnSceneChange = true
--composer.gotoScene( "scene_main" )
composer.gotoScene( "screenStart" )
