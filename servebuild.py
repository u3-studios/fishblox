#!/usr/bin/env python3
from http import server # Python 3

class MyHTTPRequestHandler(server.SimpleHTTPRequestHandler):
        def end_headers(self):
                self.send_my_headers()
                server.SimpleHTTPRequestHandler.end_headers(self)

        def send_my_headers(self):
                self.send_header("Access-Control-Allow-Origin", "*")
                self.send_header("Cross-Origin-Embedder-Policy", "credentialless")
                self.send_header("Cross-Origin-Opener-Policy", "same-origin")
                self.send_header("Cross-Origin-Resource-Policy", "cross-origin")

if __name__ == '__main__':
        server.test(HandlerClass=MyHTTPRequestHandler)