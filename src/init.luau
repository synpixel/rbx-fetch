local HttpService = game:GetService("HttpService")

local Promise = require(script.Parent.Promise)

export type Method = "GET" | "HEAD" | "POST" | "PUT" | "DELETE" | "CONNECT" | "OPTIONS" | "TRACE" | "PATCH"

export type Options = {
	method: Method?,
	headers: { [string]: string }?,
	body: string?,
}

export type Response = {
	success: boolean,
	statusCode: number,
	statusMessage: string,
	headers: { [string]: string },
	body: any,
}

local function fetch(resource: string, options: Options): Promise.TypedPromise<Response>
	return Promise.new(function(resolve, reject)
		local result = HttpService:RequestAsync({
			Url = resource,
			Method = options.method,
			Headers = options.headers,
			Body = options.body,
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

local function encodeJSON(input: any): Promise.TypedPromise<string>
	return Promise.try(function()
		return HttpService:JSONEncode(input)
	end)
end

local function decodeJSON(input: string): Promise.TypedPromise<any>
	return Promise.try(function()
		return HttpService:JSONDecode(input)
	end)
end

return setmetatable({
	encodeJSON = encodeJSON,
	decodeJSON = decodeJSON,
}, { __call = fetch })
