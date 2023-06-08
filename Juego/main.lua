socket = require("socket")
Udp = socket.udp()
Udp:setsockname('192.168.12.8', 12345)
Udp:settimeout(0)

function love.load()
  -- carga e inicio de variables
  
  Object = require 'classic'
  require 'asteroide'
  -- controles
  
  gameOver = love.graphics.newImage('images/game-over.png')

  windowHeight = love.graphics.getHeight()
  windowWidth = love.graphics.getWidth()

  background = love.graphics.newImage('images/Cielo-estrellado.jpg')
  backgroundW = background:getWidth()
  backgroundH = background:getHeight()

  nave = love.graphics.newImage('images/Nave.png')
  naveWidth = 125
  naveHeight = 125
  
  posicionX = 350
  posicionY = 450
  
  hitBoxX = naveWidth/2 
  hitBoxY = naveHeight/2
  hitBoxRadio = 25
 
  velocidadJugador = 350
  velocidadAsteroide = 350  

  text = "ejemplo"

  a = asteroide()
  b = asteroide()
  c = asteroide()
  d = asteroide()
  e = asteroide()
  f = asteroide()
  g = asteroide()
end

function love.update(dt)
  -- logica del juego se actualiza constantemente

  --**********************************************************
  -- local data, msg_or_ip, port_or_nil = Udp:receivefrom()
  -- text = tostring(data)
  --******************************************************************

  -- asteroides
  if (checkColision(a) or checkColision(b) or checkColision(c) or checkColision(d) or checkColision(e) or checkColision(f) or checkColision(g)) then 
    colision = true
  else 
    colision = false
  end
  if not colision then
    -- movimientos de la nave
    movimiento = controlesUpdate()
    posicionX = posicionX + (movimiento * velocidadJugador) * dt

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
    -- update asteroides
    a.update(a, dt * 1)
    b.update(b, dt * 1)
    c.update(c, dt * 1.1)
    d.update(d, dt * 1.2)
    e.update(e, dt * 0.9)
    f.update(f, dt * 1.1)
    g.update(g, dt * 0.9)
  
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

    if g.y > windowHeight then
     g = asteroide()
    end
  end

end

function love.draw()
  -- dibujar y mostrar en pantalla (se ejecuta despues del update)
  love.graphics.draw(background, 0, 0, 0, windowWidth/backgroundW, windowHeight/backgroundH)
  if colision then
    love.graphics.draw(gameOver, 140, 0,0, 0.5,0.5)
  end
   -- movimiento nave
  love.graphics.draw(nave, posicionX, posicionY)
  -- love.graphics.circle("line", hitBoxX+posicionX, hitBoxY + posicionY, hitBoxRadio) --hitbox nave
  --love.graphics.print(text, 200, 450 )
  --asteroides
  a.draw(a)
  b.draw(b)
  c.draw(c)
  d.draw(d)
  e.draw(e)
  f.draw(f)
  g.draw(g)
end

function checkColision(obj)
  local dist = math.sqrt(((obj.x+obj.hitboxX) - (hitBoxX+posicionX))^2  + ((obj.hitboxY + obj.y) - (hitBoxY + posicionY))^2)
  return dist <= obj.hitboxRadio + hitBoxRadio
end 

function controlesUpdate()
  local x = 0
	local data, msg_or_ip, port_or_nil = Udp:receivefrom()
  x = tonumber(data)
	if data then
		if x < -5 then
			return -1
		end
		if x > 5 then 
			return 1
		end
		if x >= -5 and x<= 5 then
			return 0 
		end
  else
    return 0
	end
end
function love.keypressed(key)
  if key == "r" then
      love.event.quit("restart")
  end
end