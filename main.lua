local sin = 0
local cos = 0
local angle = 0

local p = love.physics
local g = love.graphics

local vector = require("vector")

local background = require("background")

local date = 0
local center = {x = love.graphics.getWidth() / 2,
				y = love.graphics.getHeight() / 2}

local numbers = require("numbers")
local pointerNumbers = numbers.new(center, 80)

local testVect = vector.new("hour", center.x, center.y, 50)
local testVect2 = vector.new("minute", center.x, center.y, 80, 255, 255, 0)
local testVect3 = vector.new("second", center.x, center.y, 65, 255, 0, 0)


function love.load(args)
	time = 0

	date = os.date("!*t")
	print(date.hour .. ":" .. date.min .. ":" .. date.sec)
	print(testVect.pointer)
	print(testVect2.pointer)
	print(testVect3.pointer)
end


function love.update(dt)
	if time <= 0.0016 then
		time = time + dt
	else
		time = 0
		if angle >= 359 then angle = 0
		else angle = angle + 1 end
		testVect:update(date)
		testVect2:update(date)
		testVect3:update(date)
	end

	date = os.date("!*t")

	if love.keyboard.isDown("escape") then love.event.quit() end
end


function love.draw()
	g.setColor(255, 255, 255)
	g.circle("fill", center.x, center.y, 100)

	testVect:draw()
	testVect2:draw()
	testVect3:draw()

	pointerNumbers:draw()
end