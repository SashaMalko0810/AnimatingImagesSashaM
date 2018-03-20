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
local boingSound = audio.loadSound("Sounds/Boing.mp3")

--write text describing what is on the screen
local airText = display.newText ("Traffic in the air!",500, 100, Arial, 60)

--set the colour of the text
airText:setTextColor(1,0,1)

--global variables
scrollSpeed = 3
goSpeed = -5
runSpeed = 4
planeSpeed = 5

--set the intial position of the images
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

--set the direction that the image is facing
helicopter:scale(-1,1)

--set the image to be transparent
airplane.alpha = 1

--play a sound when the program starts
audio.play(boingSound)

--Function: MovePlane
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the plane speed to the x-value of the ship
local function MovePlane(event)
    --add the plane speed to the x-value of the plane
    airplane.x = airplane.x + planeSpeed
     --change the transparency of the plane every time it moves so that it fades in
	airplane.alpha = airplane.alpha + 0.01
    --make the plane shrink every time it moves
    airplane:scale (1 - 0.005, 1 - 0.005)
    --make the plane bounce when it reaches the edge of the screen
    if (airplane.x > 1024) then
    	airplane:scale(-1,1)
    	planeSpeed = -5

    end

end 

--MovePlane will be called over and over again
Runtime:addEventListener("enterFrame", MovePlane)


--Function: MoveHelicopter
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the go speed to the x-value of the helicopter
local function MoveHelicopter(event) 
	--add the go speed to the x-value of the helciopter
	helicopter.x = helicopter.x + goSpeed
	--change the transparency of the helicopter every time it moves so that it fades out 
	helicopter.alpha = helicopter.alpha - 0.0001
	--make the helicopter grow ever time it moves
	helicopter:scale (1 + 0.01,1 + 0.01)
	
end

--MoveHelciopter will be called over and over again
Runtime:addEventListener("enterFrame", MoveHelicopter)

--rotate the bird on the screen
transition.to(bird, {x=900, rotation = bird.rotation-500,time=2000,} )

 --Function: MoveBird
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll and run speed to the x and y value of the bird
local function MoveBird(event)
	--add the scroll and run speed to the x and y value of the bird
	bird.x = bird.x + scrollSpeed 
	bird.y = bird.y + runSpeed
    
end

--MoveBird will be called over and over again
Runtime:addEventListener("enterFrame", MoveBird)

--Function: MoveKite
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the go speed to the y-value of the kite
local function MoveKite(event)
	--add the go speed to the y-value of the kite
	kite.y = kite.y + goSpeed

end

--MoveKite will be called over and over again
Runtime:addEventListener("enterFrame", MoveKite)

--Function: MoveRocket
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the run speed to the y-value of the rocket
local function MoveRocket(event)
	--add the run speed to the y-value of the rocket
	rocket.y = rocket.y + runSpeed
	
end

--MoveRocket will be called over and over again
Runtime:addEventListener("enterFrame", MoveRocket)