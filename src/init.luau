local HttpService = game:GetService("HttpService")

local Promise = require(script.Parent.Promise)

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

--- @interface Response
--- .success boolean
--- .statusCode number
--- .statusMessage string
--- .headers { [string]: string }
--- .body any
--- @within fetch
export type Response = {
	success: boolean,
	statusCode: number,
	statusMessage: string,
	headers: { [string]: string },
	body: any,
}

--- @class fetch
local fetch = {}

--- @param resource string
--- @param options? Options
--- @return Promise<Response>
function fetch:__call(resource: string, options: Options?): Promise.TypedPromise<Response>
	return Promise.new(function(resolve, reject)
		local result = HttpService:RequestAsync({
			Url = resource,
			Method = options and options.method,
			Headers = options and options.headers,
			Body = options and options.body,
		})

		if result.success then
			resolve({
				success = result.Success,
				statusCode = result.StatusCode,
				statusMessage = result.StatusMessage,
				headers = result.Headers,
				body = result.Body,
			})
		else
			reject(result.StatusMessage, result.StatusCode)
		end
	end)
end

--- @param input any
--- @return Promise<string>
--- @within fetch
local function encodeJSON(input: any): Promise.TypedPromise<string>
	return Promise.try(function()
		return HttpService:JSONEncode(input)
	end)
end

--- @param input string
--- @return Promise<any>
--- @within fetch
local function decodeJSON(input: string): Promise.TypedPromise<any>
	return Promise.try(function()
		return HttpService:JSONDecode(input)
	end)
end

return setmetatable({
	encodeJSON = encodeJSON,
	decodeJSON = decodeJSON,
}, fetch)
