---
sidebar_position: 1
---

# Introduction

rbx-fetch is a lightweight HttpService wrapper for Roblox, similar to [JavaScript fetch](https://developer.mozilla.org/en-US/docs/Web/API/fetch).

## Examples

### Fetching a JSON response

```lua
fetch("https://dummyjson.com/products/1")
	:andThen(function(response: fetch.Response)
		local product = response.json():expect()
		print(product)
	end)
	:catch(function(response: fetch.Response)
		warn("Failed to fetch data")
	end)
```

### Fetching a PNG data response

```lua
fetch("https://rojo.space/img/logo.png")
    :andThen(function(response: fetch.Response)
        local image = response.image():expect()
        print(image.Width, image.Height)
    end)
    :catch(function(response: fetch.Response)
        warn("Failed to fetch data")
    end)
```
