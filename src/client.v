module clever

import os
import net.http

pub struct Client {
    api_host string
    api_token string
}

pub fn new_client() !Client {
    api_token := os.getenv('CLEVER_API_TOKEN')
    if api_token == '' {
        return error('Missing CLEVER_API_TOKEN environment variable')
    }

    return Client{
        api_host: 'https://api-bridge.clever-cloud.com'
        api_token: api_token
    }
}

pub fn (c Client) request(method http.Method, endpoint string, body ?string) !string {
    if !c.api_host.starts_with('http://') && !c.api_host.starts_with('https://') {
        return error('API host must start with http(s)://')
    }

    url := '${c.api_host}/${endpoint}'
    mut config := http.FetchConfig{
        url: url
        method: method
        header: http.new_header()
    }

    config.header.add_custom('Authorization', 'Bearer ' + c.api_token) or {
        return error('Failed to add Authorization header: ${err}')
    }

    response := http.fetch(config) or {
        return error('Failed to make HTTP request: ${err}')
    }

    if response.status_code != 200 {
        return error('HTTP request failed with status ${response.status_code}: ${response.body}')
    }

    return response.body
}
