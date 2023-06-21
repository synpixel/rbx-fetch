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

function Response.createResponse(result: {
	Success: boolean,
	StatusCode: number,
	StatusMessage: string,
	Headers: { [string]: string },
	Body: any,
}): Response
	return {
		success = result.Success,
		statusCode = result.StatusCode,
		statusMessage = result.StatusMessage,
		headers = result.Headers,

		text = Parser.text,
		json = Parser.json,
		image = Parser.image,
	}
end

return Response
