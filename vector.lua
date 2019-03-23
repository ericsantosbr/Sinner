-- point vector file for sinner
vector = {}

local g = love.graphics

function vector.new(pointer, x, y, radius, red, green, blue)
	local newVector = {}
	newVector.x = x or g.getWidth / 2
	newVector.y = y or g.getHeight / 2

	newVector.radius = radius or 50

	newVector.red = red or 0
	newVector.green = green or 0
	newVector.blue = blue or 255

	newVector.angle = angle or 0

	if pointer == "hour" then
		newVector.fact = 360 / 12
		newVector.time = 12
	elseif pointer == "minute" then
		newVector.fact = 360 / 60
		newVector.time = 60
	elseif pointer == "second" then
		newVector.fact = 360 / 60
		newVector.time = 60
	end

	newVector.points = {
		newVector.x,
		newVector.y,
		(math.cos(math.rad(newVector.angle)) * newVector.radius) + newVector.x,
		(math.sin(math.rad(newVector.angle)) * newVector.radius) + newVector.y
	}

	newVector.pointer = pointer or "hour"

	newVector.update = function(self, time)
		if self.angle >= 360 then
			self.angle = 0
		else
			self.angle = self.angle + 1
		end

		if self.pointer == "hour" then
			self.points = {
				self.x,
				self.y,
				math.cos(math.rad(270 + time.hour * self.fact)) * self.radius + self.x,
				math.sin(math.rad(270 + time.hour * self.fact)) * self.radius + self.y
			}
		end

		if self.pointer == "minute" then
			self.points = {
				self.x,
				self.y,
				math.cos(math.rad(270 + time.min * self.fact)) * self.radius + self.x,
				math.sin(math.rad(270 + time.min * self.fact)) * self.radius + self.y
			}
		end

		if self.pointer == "second" then
			self.points = {
				self.x,
				self.y,
				math.cos(math.rad(270 + time.sec * self.fact)) * self.radius + self.x,
				math.sin(math.rad(270 + time.sec * self.fact)) * self.radius + self.y
			}
		end
	end

	print(newVector.points[3], newVector.points[4])

	newVector.draw = function(self)
		g.setColor(self.red, self.green, self.blue)
		g.line(self.points)
	end

	return newVector
end

return vector