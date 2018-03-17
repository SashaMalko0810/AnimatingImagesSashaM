--Title: Animating Images
--Name: Sasha Malko
--Course: ICS2O/3C
--Description: This program displays 3 images moving in different
--directions, with some coloured text and a background.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables
local backgroundImage = display.newImageRect("Images/sky.jpg", 2300, 1600)
local airplane = display.newImageRect("Images/airplane.png", 250, 140)
local helicopter = display.newImageRect("Images/helicopter.png", 250, 220)
local bird = display.newImageRect("Images/bird.png", 250, 220)
local kite = display.newImageRect("Images/Kite.png", 100, 220)
local rocket = display.newImageRect("Images/rocket.png", 100, 220)
local airText
local boingSound = audio.loadSound("Sounds/Boing.mp3")

-- write text describing what is on the screen
airText = display.newText ("Traffic in the air!",500, 100, Arial, 60)

--set the colour of the text
airText:setTextColor(1,0,1)

--global variables
scrollSpeed = 3
goSpeed = -5
runSpeed = 5

--set the intial position of my images
airplane.x = 120
airplane.y = 700
helicopter.x = 900
helicopter.y = 500
bird.x = 120
bird.y = 100
kite.x = 150
kite.y = 500
rocket.x = 800
rocket.y = 125

--set the directions that the images are facing
helicopter:scale(-1,1)
airplane:scale(-1,1) 

--set the size of the images
airplane:scale(1,1)
helicopter:scale(1,1)

--set the image to be transparent
airplane.alpha = 0

--play a sound when the program starts
audio.play(boingSound)

--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the go speed to the x-value of the ship
local function MoveShip(event)
    --add the go speed to the x-value of the ship
    airplane.x = airplane.x + goSpeed
    --change the transparency of the ship every time it moves so that it fades in
	airplane.alpha = airplane.alpha + 0.01
	--make the ship shrink every time it moves
    airplane:scale (1 - 0.005, 1 - 0.005)

end 

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)


--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the go speed to the x-value of the ship
    local function MoveShip(event) 
	--add the go speed to the x-value of the ship
	helicopter.x = helicopter.x + goSpeed
	--change the transparency of the ship every time it moves so that it fades out 
	helicopter.alpha = helicopter.alpha - 0.0001
	--make the ship grow ever time it moves
	helicopter:scale (1 + 0.01,1 + 0.01)
	
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--rotate the bird on the screen
transition.to(bird, {x=900, rotation = bird.rotation-500,time=2000,} )

 --Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll and run speed to the x and y value of the ship
local function MoveShip(event)
	--add the scroll and run speed to the x and y value of the ship
	bird.x = bird.x + scrollSpeed 
	bird.y = bird.y + runSpeed
    
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the go speed to the y-value of the ship
local function MoveShip(event)
	--add the go speed to the y-value of the ship
	kite.y = kite.y + goSpeed

end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the run speed to the y-value of the ship
local function MoveShip(event)
	--add the run speed to the y-value of the ship
	rocket.y = rocket.y + runSpeed
	
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--set the airplane to transition to a different location
transition.moveTo( airplane, { x=1000, y=700, time=2000 } ) 