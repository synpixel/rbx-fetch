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
		response.json():andThen(function(product)
			print(product)
		end)
	end)
	:catch(function(response: fetch.Response)
		warn("Failed to fetch data")
		response.json():andThen(function(product)
			warn(product)
		end)
	end)
```

### Fetching a PNG data response

```lua
fetch("https://rojo.space/img/logo.png")
    :andThen(function(response: fetch.Response)
        response.image():andThen(function(image: fetch.PNG)
            print(image.Width, image.Height)
        end)
    end)
    :catch(function(response: fetch.Response)
        warn("Failed to fetch data")
    end)
```
