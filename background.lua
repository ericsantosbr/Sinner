-- background file for clock
local g = love.graphics

local background = {}

function background.new(color, x, y)
	local newBackground = {}

	newBackground.polygon = {}
	newBackground.color = color or {0, 0, 0}

	newBackgroud.update = function(self)
		self.polygon[1] = self.polygon[1] + 1
		self.polygon[2] = self.polygon[2] + 1
		self.polygon[3] = self.polygon[3] + 1
		self.polygon[4] = self.polygon[4] + 1

	end

	newBackgroud.draw = function(self)
		g.setColor(self.color)
		g.drawPolygon(self.polygon)

	end

	return newBackgroud
end

function geraPoligonos(color, center)
	local newPolygon = {}
	

	return newPolygon
end



return background