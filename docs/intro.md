---
sidebar_position: 1
---

# Introduction

rbx-fetch is a lightweight HttpService wrapper for Roblox, similar to [JavaScript fetch](https://developer.mozilla.org/en-US/docs/Web/API/fetch).

## Example

```lua
fetch("https://dummyjson.com/products/1")
    :andThen(function(response: fetch.Response)
        print(response.json())
    end)
    :catch(function(response: fetch.Response)
        warn("Failed to fetch data")
        warn(response.json())
    end)
```
