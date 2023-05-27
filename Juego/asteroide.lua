asteroide = Object.extend(Object)
math.randomseed(os.time())

function asteroide.new(self, dt)
    self.img = love.graphics.newImage('images/asteroide.png')
    self.Width = self.img:getWidth()
    self.Height = self.img:getHeight()
    self.x = math.random(posicionX - 170, posicionX + naveWidth + 170)

    if self.x < 0 or self.x + self.Width > windowWidth then
    self.x = math.random(0, windowWidth)
    end 

    self.y = - windowHeight - math.random(50, 1000)  

    -- self.hitbox = love.graphics.circle("fill", (self.x+self.Width)/2 , (self.y+self.Height)/2, self.Height/2, 5)
end

function asteroide.update(self, dt)
    self.y = self.y + velocidadAsteroide * dt
end 