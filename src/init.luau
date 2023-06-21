local HttpService = game:GetService("HttpService")

local Parser = require(script.Parser)
local Promise = require(script.Parent.Promise)
local Response = require(script.Response)

--- @type HttpMethod "GET" | "HEAD" | "POST" | "PUT" | "DELETE" | "CONNECT" | "OPTIONS" | "TRACE" | "PATCH"
--- @within fetch
export type HttpMethod = "GET" | "HEAD" | "POST" | "PUT" | "DELETE" | "CONNECT" | "OPTIONS" | "TRACE" | "PATCH"

--- @interface Options
--- .method HttpMethod
--- .headers? { [string]: string }
--- .body? string
--- @within fetch
export type Options = {
	method: HttpMethod?,
	headers: { [string]: string }?,
	body: string?,
}

export type Response = Response.Response

export type PNG = Parser.PNG

--- @class fetch
local fetch = {}

--- @param resource string
--- @param options? Options
--- @return Promise<Response>
function fetch:__call(resource: string, options: Options?): Promise.TypedPromise<Response.Response>
	return Promise.new(function(resolve, reject)
		local result = HttpService:RequestAsync({
			Url = resource,
			Method = options and options.method,
			Headers = options and options.headers,
			Body = options and options.body,
		})

		if result.Success then
			resolve(Response.createResponse(result))
		else
			reject(Response.createResponse(result))
		end
	end)
end

return setmetatable({}, fetch)
