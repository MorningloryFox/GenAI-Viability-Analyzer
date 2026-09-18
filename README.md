# GenAI Decision Studio

Uma ferramenta demonstrativa para estruturar cenários de viabilidade de IA generativa. O motor de cálculo é determinístico; Gemini, quando configurado, apenas gera um resumo textual do cenário.

## O que esta demo faz

- Estima economia bruta, custo operacional anual, ROI, payback e prontidão a partir de premissas sintéticas.
- Explicita o risco como uma entrada e não como uma certeza calculada.
- Não consulta preços em tempo real, não integra sistemas externos e não oferece recomendação financeira.

## Executar

```bash
npx netlify dev
```

Configure `GOOGLE_API_KEY` exclusivamente no ambiente Netlify para habilitar o resumo Gemini. O cálculo funciona sem chave.

