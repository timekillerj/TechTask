import os
import logging
import tornado.ioloop
import tornado.web
from tornado.escape import json_encode
from bson import ObjectId
import datetime

logging.basicConfig(level=logging.DEBUG)

class MainHandler(tornado.web.RequestHandler):
    async def get(self):
        
        # Set the response headers and write the JSON data
        self.set_header("Content-Type", "application/json")
        self.write(json_encode("Hello World!"))

def make_app():
    return tornado.web.Application([
        (r"/hello", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    print("Listening on http://localhost:8888/")
    tornado.ioloop.IOLoop.current().start()
