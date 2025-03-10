# Clever Cloud V SDK

An easy-to-implement SDK to interact with Clever Cloud's API using the V programming language.

## Installation

```v
v install --git https://github.com/davlgd/cleVer
```

## Usage

First, set your Clever Cloud API token as an environment variable:

```bash
export CLEVER_API_TOKEN="your_token_here"
```

Then in your V code:

```v
import clever

fn main() {
    // Initialize the client
    client := clever.new_client()!

    // Get user information
    user_info := client.get_self()!
    println(user_info)

    // Get account summary
    summary := client.get_summary()!
    println(summary)
}
```

## Available Methods

### User Information
- `get_self()` - Get information about the authenticated user
- `get_summary()` - Get a summary of the user's account

### Custom Requests
You can also make custom API requests using the `request()` method:

```v
response := client.request(http.Method.get, 'your/api/endpoint', none)!
```

## Features

- Simple API client with automatic token management
- Built-in methods for common API operations
- HTTP request handling with proper error management
- Built-in API host configuration (default: api-bridge.clever-cloud.com)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.