def application(env, start_response):
    """WSGI handler. """

    body = '\n'.join(env["QUERY_STRING"].split("&"))

    status = "200 OK"
    headers = [
        ("Content-Type", "text/plain")
    ]

    start_response(status, headers)
    return [ body ]
