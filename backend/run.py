import uvicorn

if __name__ == "__main__":
    uvicorn.run(
        "app:main",        # Replace 'app:app' with your file and FastAPI instance name
        host="127.0.0.1",  # Localhost
        port=8000,         # Fixed port 8000
        reload=True        # Auto-reload on code changes (optional)
    )
