from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return dict(
        message="Hello from the container",
        )
