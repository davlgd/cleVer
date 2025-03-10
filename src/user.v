module clever

import net.http

pub fn (c &Client) get_self() !string {
    return c.request(http.Method.get, 'v2/self', none)
}

pub fn (c &Client) get_summary() !string {
    return c.request(http.Method.get, 'v2/summary', none)
}
