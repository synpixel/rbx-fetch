<div align="center">
  <h1>fetch</h1>
  <p>Lightweight HttpService wrapper for Roblox</p>
  <a href="https://synpixel.github.io/rbx-fetch/">View docs →</a>
</div>

## Installation

### Wally

Put fetch inside your Wally dependencies, as so:

```toml
fetch = "synpixel/fetch@0.1.1"
```

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
