-- numbers for the love clock

g = love.graphics

local numbers = {}

function numbers.new(center, radius)
	local newArray = {}

	newArray.value = value or 1
	newArray.x = x or 10
	newArray.y = y or 10

	newArray.centerX = center.x or love.graphics.getWidth / 2
	newArray.centerY = center.y or love.graphics.getHeight / 2

	newArray.numList = {}

	for i = 1, 12 do
		local novoPonto = geraPonto(i, center, radius, color)
		table.insert(newArray.numList, novoPonto)
	end

	newArray.draw = function(self)
		g.setColor(self.color)
		for k, v in pairs(self.numList) do
			g.print(v.value, v.x, v.y)

		end
	end

	newArray.color = {0, 0, 0}

	return newArray
end

-- pos = [1 -> 12]
-- value = any number
function geraPonto(value, center, radius, color)
	local novoPonto = {}

	color = color or {0, 0, 0}

	novoPonto.value = tostring(value)

	fact = 360 / 12

	novoPonto.x = math.cos(math.rad(270 + fact * value)) * radius + center.x
	novoPonto.y = math.sin(math.rad(270 + fact * value)) * radius + center.y

	return novoPonto
end

return numbers