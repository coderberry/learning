function love.load()
  world = love.physics.newWorld(0, 0, 650, 650) --create a world for the bodies to exist in with width and height of 650
  world:setGravity(0, 700) --the x component of the gravity will be 0, and the y component of the gravity will be 700
  world:setMeter(64) --the height of a meter in this world will be 64px

  objects = {} -- table to hold all our physical objects

  --let's create the ground
  objects.ground = {}
  --we need to give the ground a mass of zero so that the ground wont move
  objects.ground.body = love.physics.newBody(world, 650/2, 625, 0, 0) --remember, the shape anchors to the body from its center
  objects.ground.shape = love.physics.newRectangleShape(objects.ground.body, 0, 0, 650, 50, 0) --anchor the shape to the body, and make it a width of 650 and a height of 50

  --let's create a ball
  objects.ball = {}
  objects.ball.body = love.physics.newBody(world, 650/2, 650/2, 15, 0) --place the body in the center of the world, with a mass of 15
  objects.ball.shape = love.physics.newCircleShape(objects.ball.body, 0, 0, 20) --the ball's shape has no offset from it's body and has a radius of 20
  
  --initial graphics setup
  love.graphics.setBackgroundColor(104, 136, 248) --set the background color to a nice blue
  love.graphics.setMode(650, 650, false, true, 0) --set the window dimensions to 650 by 650 with no fullscreen, vsync on, and no antialiasing
end

function love.update(dt)
  world:update(dt) --this puts the world into motion
  
  --here we are going to create some keyboard events
  if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
    objects.ball.body:applyForce(400, 0)
  elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
    objects.ball.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
    objects.ball.body:setY(650/2)
  end
end

function love.draw()
  love.graphics.setColor(72, 160, 14) -- set the drawing color to green for the ground
  love.graphics.polygon("fill", objects.ground.shape:getPoints()) -- draw a "filled in" polygon using the ground's coordinates
  
  love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius(), 20) -- we want 20 line segments to form the "circle"
end