# Segurança

## Gestão de Secrets

### ✅ FAZER

- Usar `.env` local com variáveis de ambiente
- Usar GitHub Secrets para CI/CD
- Usar Azure Key Vault ou AWS Secrets Manager em produção
- Rotacionar chaves regularmente

### ❌ NÃO FAZER

- Commitar `.env` ou arquivos com credenciais
- Enviar chaves de API por email ou chat
- Usar a mesma chave em múltiplos ambientes
- Deixar chaves em código

## Configuração Segura

```bash
# Usar variáveis de ambiente (NOT em .env commitado)
export OPENAI_API_KEY="sua-chave"

# Ou usar ferramenta de secrets:
# - direnv
# - 1Password CLI
# - AWS Secrets Manager
# - Azure Key Vault
```

## Validação de Input

Todos os inputs são validados com Pydantic:
- Type checking
- Range validation
- String sanitization

## Logging

- Nunca logar chaves de API
- Logs estruturados em JSON
- Auditoria de mudanças

## Dependências

```bash
# Verificar vulnerabilidades
pip install safety
safety check

# Atualizar dependências seguramente
pip install --upgrade pip
pip list --outdated
```
