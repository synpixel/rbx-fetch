"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[244],{77042:e=>{e.exports=JSON.parse('{"functions":[{"name":"__call","desc":"","params":[{"name":"resource","desc":"","lua_type":"string"},{"name":"options?","desc":"","lua_type":"Options"}],"returns":[{"desc":"","lua_type":"Promise<Response>"}],"function_type":"method","source":{"line":41,"path":"src/init.luau"}},{"name":"encodeJSON","desc":"","params":[{"name":"input","desc":"","lua_type":"any"}],"returns":[{"desc":"","lua_type":"Promise<string>"}],"function_type":"static","source":{"line":67,"path":"src/init.luau"}},{"name":"decodeJSON","desc":"","params":[{"name":"input","desc":"","lua_type":"string | Response"}],"returns":[{"desc":"","lua_type":"Promise<any>"}],"function_type":"static","source":{"line":76,"path":"src/init.luau"}}],"properties":[],"types":[{"name":"HttpMethod","desc":"","lua_type":"\\"GET\\" | \\"HEAD\\" | \\"POST\\" | \\"PUT\\" | \\"DELETE\\" | \\"CONNECT\\" | \\"OPTIONS\\" | \\"TRACE\\" | \\"PATCH\\"","source":{"line":7,"path":"src/init.luau"}},{"name":"Options","desc":"","fields":[{"name":"method","lua_type":"HttpMethod","desc":""},{"name":"headers?","lua_type":"{ [string]: string }","desc":""},{"name":"body?","lua_type":"string","desc":""}],"source":{"line":14,"path":"src/init.luau"}},{"name":"Response","desc":"","fields":[{"name":"success","lua_type":"boolean","desc":""},{"name":"statusCode","lua_type":"number","desc":""},{"name":"statusMessage","lua_type":"string","desc":""},{"name":"headers","lua_type":"{ [string]: string }","desc":""},{"name":"body","lua_type":"any","desc":""}],"source":{"line":27,"path":"src/init.luau"}}],"name":"fetch","desc":"","source":{"line":36,"path":"src/init.luau"}}')}}]);