from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import httpx

app = FastAPI()

AUTH_URL = "https://dev-tekcor4.uk.auth0.com/oauth/token"


# Define request body model
class AuthRequest(BaseModel):
    grant_type: str
    client_id: str
    client_secret: str
    audience: str
    organization: str


@app.post("/authenticate")
async def authenticate(payload: AuthRequest):
    """
    Accepts JSON body and forwards it to Auth0 OAuth endpoint.
    """
    headers = {"Content-Type": "application/json"}

    try:
        async with httpx.AsyncClient() as client:
            response = await client.post(AUTH_URL, json=payload.dict(), headers=headers)
            response.raise_for_status()
            return response.json()

    except httpx.HTTPStatusError as e:
        raise HTTPException(status_code=e.response.status_code, detail=e.response.text)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
