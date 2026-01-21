# Guia de Deployment

## Desenvolvimento Local

```bash
# Setup
python -m venv venv
source venv/bin/activate  # ou venv\Scripts\activate
pip install -r requirements.txt

# Executar
streamlit run src/ui/app_streamlit_chat.py
```

## Produção com Docker

```dockerfile
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY src/ src/
COPY config/ config/

EXPOSE 8501

CMD ["streamlit", "run", "src/ui/app_streamlit_chat.py", "--server.port=8501"]
```

```bash
docker build -t genai-analyzer .
docker run -p 8501:8501 -e OPENAI_API_KEY=$OPENAI_API_KEY genai-analyzer
```

## Variáveis de Ambiente

```
OPENAI_API_KEY=sk-...
GOOGLE_API_KEY=...
JIRA_URL=https://...
JIRA_TOKEN=...
LOG_LEVEL=INFO
CACHE_TTL=3600
```

## CI/CD Pipeline

Veja `.github/workflows/` para GitHub Actions automático.

## Monitoramento

Logs estruturados em JSON para fácil análise em ferramentas como ELK Stack ou Splunk.
