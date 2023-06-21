---
sidebar_position: 1
---

# Introduction

rbx-fetch is a lightweight HttpService wrapper for Roblox, similar to [JavaScript fetch](https://developer.mozilla.org/en-US/docs/Web/API/fetch).

## Example

```lua
fetch("https://dummyjson.com/products/1")
    :andThen(fetch.decodeJSON)
    :andThen(function(response: fetch.Response)
        print(response)
    end)
    :catch(function()
        warn("Failed to fetch data")
    end)
```
