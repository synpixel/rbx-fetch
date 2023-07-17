<div align="center">
  <h1>fetch</h1>
  <p>Lightweight HttpService wrapper for Roblox</p>
  <a href="https://synpixel.github.io/rbx-fetch/">View docs →</a>
</div>

## Installation

### Wally

Put fetch inside your Wally dependencies, as so:

```toml
fetch = "synpixel/fetch@0.2.3"
```

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
