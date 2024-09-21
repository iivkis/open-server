import signal
import sys

import uvicorn
from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()


@app.get("/health")
async def health():
    return JSONResponse(status_code=200, content={"message": "Server is healthy"})


def signal_handler(sig, frame):
    print("Сервер останавливается...")
    sys.exit(0)


def main():
    signal.signal(signal.SIGINT, signal_handler)
    uvicorn.run(app, host="0.0.0.0", port=80)
