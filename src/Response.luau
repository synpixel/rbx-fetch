local Parser = require(script.Parent.Parser)
local Promise = require(script.Parent.Parent.Promise)

export type Response = {
	success: boolean,
	statusCode: number,
	statusMessage: string,
	headers: { [string]: string },

	text: (any) -> Promise.TypedPromise<string>,
	json: (any) -> Promise.TypedPromise<any>,
	image: (any) -> Promise.TypedPromise<Parser.PNG>,
}

type Result = {
	Success: boolean,
	StatusCode: number,
	StatusMessage: string,
	Headers: { [string]: string },
	Body: any,
}

--- @class Response
local Response = {}

--- @prop success boolean
--- @within Response

--- @prop statusCode number
--- @within Response

--- @prop statusMessage string
--- @within Response

--- @prop headers { [string]: string }
--- @within Response

local function processParser(result: Result, parserFn: (any) -> any)
	return function()
		return parserFn(result.Body)
	end
end

function Response.createResponse(result: Result): Response
	return {
		success = result.Success,
		statusCode = result.StatusCode,
		statusMessage = result.StatusMessage,
		headers = result.Headers,

		text = processParser(result, Parser.text),
		json = processParser(result, Parser.json),
		image = processParser(result, Parser.image),
	}
end

return Response
