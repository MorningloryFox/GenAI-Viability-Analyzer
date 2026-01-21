# GenAI Viability Analyzer

[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

**Analisador Profissional de Viabilidade Econômica, Técnica e de Risco para Projetos de Inteligência Artificial Generativa**

## 📋 Visão Geral

GenAI Viability Analyzer é um framework completo que auxilia empresas na tomada de decisão sobre investimentos em projetos de IA Generativa. Fornece análises detalhadas sobre:

- 💰 **Viabilidade Financeira**: ROI, Payback, economia de custos operacionais
- 🏗️ **Recomendações Arquiteturais**: Copilot, n8n, LangChain, Azure integrations
- 📊 **Análise de Risco**: Mapeamento de impactos técnicos, operacionais e de compliance
- 🔄 **Tokenomics Dinâmica**: Cálculo preciso de consumo de tokens (input + output)
- 📈 **Precificação Real-time**: Consulta custos atualizados de LLMs e ferramentas
- 📄 **Relatórios Executivos**: Gera análises em Markdown e PDF prontas para apresentação

## 🎯 Casos de Uso

- Empresas analisando implementação de chatbots IA
- Avaliação de automação RPA/GenAI
- Cálculo de ROI para copilots internos
- Análise de impacto de licenças OpenAI/Azure
- Suporte a decisão de buy vs build

## 🚀 Quick Start

### Pré-requisitos
- Python 3.10+
- pip ou conda

### Instalação

```bash
# Clone o repositório
git clone https://github.com/yourusername/GenAI-Viability-Analyzer.git
cd GenAI-Viability-Analyzer

# Crie um ambiente virtual
python -m venv venv

# Ative o ambiente
# No Windows:
venv\Scripts\activate
# No Linux/Mac:
source venv/bin/activate

# Instale dependências
pip install -r requirements.txt
```

### Configuração

1. **Defina sua chave OpenAI** (ou use variáveis de ambiente):

```powershell
# Windows PowerShell
$env:OPENAI_API_KEY = "sua-chave-aqui"

# Windows CMD
set OPENAI_API_KEY=sua-chave-aqui

# Linux/Mac
export OPENAI_API_KEY=sua-chave-aqui
```

2. **Configure o arquivo `.env` (opcional)**:

```bash
cp config/.env.example config/.env
# Edite config/.env com suas credenciais
```

### Uso

#### Interface de Chat (Recomendado para usuários)

```bash
streamlit run src/ui/app_streamlit_chat.py
```

Acesse `http://localhost:8501` e converse com o analisador.

#### Uso Programático

```python
from src.analyzer.calculator import ViabilityCalculator
from src.analyzer.schema import ProjectParameters

params = ProjectParameters(
    project_name="Chatbot Customer Support",
    current_annual_cost=500000,
    estimated_automation_rate=0.40,
    # ... mais parâmetros
)

calculator = ViabilityCalculator()
report = calculator.analyze(params)
print(report.to_markdown())
```

## 📁 Estrutura do Projeto

```
GenAI-Viability-Analyzer/
├── src/
│   ├── analyzer/              # Lógica de análise e cálculos
│   │   ├── calculator.py      # Engine principal de cálculos
│   │   ├── pricing_engine.py  # Consulta preços reais de APIs
│   │   ├── scenario_simulator.py  # Simulação de cenários
│   │   ├── risk_analyzer.py   # Análise de riscos
│   │   └── schema.py          # Modelos Pydantic
│   ├── ui/                    # Interface de usuário
│   │   └── app_streamlit_chat.py  # Aplicação Streamlit
│   └── integrations/          # Integrações externas
│       ├── jira_integration.py
│       ├── pdf_exporter.py
│       └── llm_service.py
├── tests/                     # Testes unitários e integração
│   ├── unit/
│   └── integration/
├── docs/                      # Documentação
│   ├── API.md                 # Documentação da API
│   ├── ARCHITECTURE.md        # Arquitetura do sistema
│   └── EXAMPLES.md            # Exemplos de uso
├── config/                    # Configurações
│   ├── .env.example
│   └── logging_config.py
├── requirements.txt           # Dependências Python
├── setup.py                   # Setup do pacote
├── pyproject.toml            # Configuração moderna Python
├── LICENSE                    # Licença MIT
├── .gitignore                # Arquivos ignorados no Git
└── README.md                 # Este arquivo
```

## 🔧 Funcionalidades Principais

### 1. Análise Financeira

- **ROI & Payback**: Calcula retorno sobre investimento e tempo de payback
- **Cost Avoidance**: Quantifica economia de custos operacionais
- **TCO (Total Cost of Ownership)**: Análise completa de custos
- **Cenários (Pessimista/Base/Otimista)**: Análise de sensibilidade

### 2. Recomendações Arquiteturais

Recomenda a melhor solução baseada em:
- Copilot (free para empresas Microsoft)
- n8n (automação low-code)
- LangChain + Azure (customização máxima)

### 3. Precificação Dinâmica

- Consulta custos reais de OpenAI, Google, Anthropic
- Calcula tokenomics precisa
- Estima custos de infraestrutura
- Cache inteligente de preços

### 4. Geração de Relatórios

- Markdown pronto para documentação
- PDF executivo para apresentações
- Gráficos e visualizações
- Exportação para email

## 📊 Exemplos

### Exemplo Básico

```python
from src.analyzer.calculator import ViabilityCalculator
from src.analyzer.schema import ProjectParameters

# Criar parâmetros do projeto
params = ProjectParameters(
    project_name="Customer Support Automation",
    description="Implementar chatbot GenAI para reduzir tickets",
    current_annual_cost=480000,
    estimated_ftes_to_replace=4,
    automation_percentage=0.35,
    is_technical_user=False
)

# Calcular viabilidade
calc = ViabilityCalculator()
report = calc.analyze(params)

# Gerar relatório
print(report.executive_summary)
report.export_to_pdf("analysis_report.pdf")
```

## 🧪 Testes

```bash
# Executar todos os testes
pytest tests/

# Com cobertura
pytest tests/ --cov=src --cov-report=html

# Apenas testes de unitários
pytest tests/unit/

# Apenas testes de integração
pytest tests/integration/
```

## 🐛 Desenvolvimento

### Setup de Desenvolvimento

```bash
pip install -r requirements.txt
pip install -r requirements-dev.txt

# Instalar pre-commit hooks
pre-commit install
```

### Code Style

Este projeto usa:
- **black** para formatação
- **flake8** para linting
- **mypy** para type checking

```bash
# Formatar código
black src/ tests/

# Lint
flake8 src/ tests/

# Type check
mypy src/
```

### Pull Requests

Veja [CONTRIBUTING.md](CONTRIBUTING.md) para detalhes sobre o processo de contribuição.

## 📚 Documentação

- [API Reference](docs/API.md) - Documentação completa da API
- [Architecture](docs/ARCHITECTURE.md) - Design e padrões do projeto
- [Examples](docs/EXAMPLES.md) - Exemplos práticos de uso
- [Deployment](docs/DEPLOYMENT.md) - Guia de produção

## 🛡️ Segurança

- Nunca commite chaves de API no repositório
- Use `.env` local para credenciais sensíveis
- As chaves devem estar em variáveis de ambiente em produção
- Veja [SECURITY.md](docs/SECURITY.md) para mais detalhes

## 📄 Licença

Este projeto está licenciado sob a licença MIT - veja [LICENSE](LICENSE) para detalhes.

## 🤝 Contribuindo

Contribuições são bem-vindas! Por favor, veja [CONTRIBUTING.md](CONTRIBUTING.md) para detalhes sobre:

- Como relatar bugs
- Como sugerir melhorias
- Como enviar pull requests
- Padrões de código do projeto

## 📞 Suporte

- 📝 Abra uma [issue](https://github.com/yourusername/GenAI-Viability-Analyzer/issues)
- 💬 Discussões no GitHub
- 📧 Contato: seu-email@example.com

## 🙏 Agradecimentos

Construído com tecnologias open-source:
- [Streamlit](https://streamlit.io/) - UI web
- [LangChain](https://langchain.com/) - Framework LLM
- [Pydantic](https://docs.pydantic.dev/) - Validação de dados
- [Plotly](https://plotly.com/) - Visualizações

## 📈 Roadmap

- [ ] Suporte para mais LLMs (Claude, Llama)
- [ ] Dashboard de análise histórica
- [ ] Integração com ferramentas de BI
- [ ] API REST para integração externa
- [ ] Versão mobile
- [ ] Suporte multilíngue expandido

---

**Desenvolvido com ❤️ para impulsionar decisões mais inteligentes sobre GenAI**
