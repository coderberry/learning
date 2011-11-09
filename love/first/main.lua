curX = 100
curY = 100
dirX = 2
dirY = 2

function love.draw()
	WIDTH = love.graphics.getWidth()
	HEIGHT = love.graphics.getHeight()
	image = love.graphics.newImage( "michoacan_logo.png" )
	love.graphics.draw(image, curX, curY)
	
	if (curX > (WIDTH - image:getWidth())) then
		dirX = -2
	elseif (curX < 0) then
		dirX = 2
	end
	
	if (curY > (HEIGHT - image:getHeight())) then
		dirY = -2
	elseif (curY < 0) then
		dirY = 2
	end
	
	curX = curX + dirX
	curY = curY + dirY
end