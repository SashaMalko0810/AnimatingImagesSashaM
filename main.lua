--Title: Animating Images
--Name: Sasha Malko
--Course: ICS2O/3C
--Description: Thsi program displays 3 images moving in different
-- directions, with some coloured text and a background

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables
local backgroundImage = display.newImageRect("Images/sky.jpg", 2300, 1600)
local airplane = display.newImageRect("Images/airplane.png", 250, 140)
local airplaneWidth = airplane.width
local airplaneHeight = airplane.height

local helicopter = display.newImageRect("Images/helicopter.png", 250, 220)
local helicopterWidth = helicopter.width
local helicopterHeight = helicopter.height

local bird = display.newImageRect("Images/bird.png", 250, 220)
local birdWidth = bird.width
local birdHeight = bird.height

--global variables
scrollSpeed = 2
goSpeed = -5
runSpeed = 5

airplane:scale(1,1)
helicopter:scale(1,1)

--set the intial position of my iamges
airplane.x = 120
airplane.y = 700

helicopter.x = 900
helicopter.y = 500

bird.x = 120
bird.y = 100

helicopter:scale(-1,1)

--set the image to be transparent
airplane.alpha = 0

--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	--add the scroll speed to the x-value of the ship
	airplane.x = airplane.x + scrollSpeed
	--change the transparency of the ship every time it moves so that it fades out 
	airplane.alpha = airplane.alpha + 0.01
	--make the ship shrink every time it moves
    airplane:scale (1 - 0.002, 1 - 0.002)
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	--add the scroll speed to the x-value of the ship
	helicopter.x = helicopter.x + goSpeed
	--change the transparency of the ship every time it moves so that it fades out 
	helicopter.alpha = helicopter.alpha - 0.0001
	--make the ship grow ever time it moves
	helicopter:scale (1 + 0.01,1 + 0.01)
	
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

 --rotate image on screen
 transition.to(bird, {x=900, rotation = bird.rotation-500,time=2000,} )

 --Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	--add the scroll speed to the x-value of the ship
	bird.x = bird.x + scrollSpeed 
	bird.y = bird.y + runSpeed
    --change the transparency of the ship every time it moves so that it fades out 
	helicopter.alpha = helicopter.alpha - 0.0001
	--make the ship grow ever time it moves
	helicopter:scale (1 + 0.01,1 + 0.01)

end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
