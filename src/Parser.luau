local HttpService = game:GetService("HttpService")

local PNG = require(script.Parent.Parent.PNG)
local Promise = require(script.Parent.Parent.Promise)

--- @interface PNG
--- .GetPixel (x: number, y: number) -> Color3
--- .Width number
--- .Height number
--- .BitDepth number
--- .ColorType number
--- @within Response
export type PNG = {
	GetPixel: (x: number, y: number) -> Color3,
	Width: number,
	Height: number,
	BitDepth: number,
	ColorType: number,
}

local Parser = {}

--- @param input any
--- @return Promise.TypedPromise<string>
--- @within Response
function Parser.text(input: any): Promise.TypedPromise<string>
	return Promise.resolve(tostring(input))
end

--- @param input any
--- @return Promise.TypedPromise<any>
--- @within Response
function Parser.json(input: any): Promise.TypedPromise<any>
	return Promise.try(function()
		return HttpService:JSONDecode(input)
	end)
end

--- @param input any
--- @return Promise.TypedPromise<PNG>
--- @within Response
function Parser.image(input: any): Promise.TypedPromise<PNG>
	return Promise.try(function()
		return PNG.new(input)
	end)
end

return Parser
