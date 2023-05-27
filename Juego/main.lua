function love.load ()
  -- carga e inicio de variables
  -- pantallaCarga = love.graphics.newVideo('images/Pantalla-de-inicio.mp4')
  
  Object = require 'classic'
  require 'asteroide'

  windowHeight = love.graphics.getHeight()
  windowWidth = love.graphics.getWidth()

  background = love.graphics.newImage('images/Cielo-estrellado.jpg')
  backgroundW = background:getWidth()
  backgroundH = background:getHeight()

  nave = love.graphics.newImage('images/Nave.png')
  naveWidth = nave:getWidth()
  naveHeight = nave:getHeight()

  posicionX = windowWidth/2 - 62.5
  posicionY = windowHeight-150
  
  velocidadJugador = 350
  velocidadAsteroide = 500

  a = asteroide()
  b = asteroide()
  c = asteroide()
  d = asteroide()
  e = asteroide()
  f = asteroide()
  -- g = asteroide()
end

function love.update(dt)
  -- logica del juego se actualiza constantemente
  -- movimientos de la nave
  if love.keyboard.isDown("right") then
    posicionX = posicionX + velocidadJugador * dt
  end
  if love.keyboard.isDown("left") then
    posicionX = posicionX - velocidadJugador * dt
  end

  -- limites de la nave
  if posicionX < 0 then
    posicionX = 0
    end 
  if posicionX + naveWidth > windowWidth then
    posicionX = windowWidth - naveWidth
  end

  -- asteroides

  a.update(a, dt * 1)
  b.update(b, dt * 1)
  c.update(c, dt * 1.1)
  d.update(d, dt * 1.2)
  e.update(e, dt * 0.9)
  f.update(f, dt * 1.1)
  -- g.update(g, dt * 0.9)

  if a.y > windowHeight then
   a = asteroide() 
  end

  if b.y > windowHeight then
    b = asteroide()
   end
   if c.y > windowHeight then
    c = asteroide()
   end
   if d.y > windowHeight then
    d = asteroide()
   end
   if e.y > windowHeight then
    e = asteroide()
   end
   if f.y > windowHeight then
    f = asteroide()
   end
  --  if g.y > windowHeight then
  --   g = asteroide()
  --  end
end
function love.draw()
  -- dibujar y mostrar en pantalla (se ejecuta despues del update)
  love.graphics.draw(background, 0, 0, 0, windowWidth/backgroundW, windowHeight/backgroundH)
  love.graphics.draw(nave, posicionX, posicionY)
  love.graphics.draw(a.img, a.x, a.y)
  love.graphics.draw(b.img, b.x, b.y)
  love.graphics.draw(c.img, c.x, c.y)
  love.graphics.draw(d.img, d.x, d.y)
  love.graphics.draw(e.img, e.x, e.y)
  love.graphics.draw(f.img, f.x, f.y)
  -- love.graphics.draw(g.img, g.x, g.y)
end
