# Arquitetura do Sistema

## Visão Geral

GenAI Viability Analyzer segue uma arquitetura modular baseada em camadas, permitindo fácil manutenção, teste e extensão.

```
┌─────────────────────────────────────────────────────────────────┐
│                    UI Layer (Streamlit)                          │
│                  app_streamlit_chat.py                           │
└────────────────┬────────────────────────────────────────────────┘
                 │
┌────────────────▼────────────────────────────────────────────────┐
│              Application Layer (Business Logic)                  │
│  • ChatAnalyzer (Processamento de linguagem natural)            │
│  • PersonaDetector (Classificação de usuário)                   │
│  • ViabilityCalculator (Orquestração de análise)               │
└────────────────┬────────────────────────────────────────────────┘
                 │
┌────────────────▼────────────────────────────────────────────────┐
│              Analysis Core Layer                                 │
│  ┌──────────────┬──────────────┬──────────────┬─────────────┐   │
│  │ PricingEngine│ Calculator   │ ScenarioSim  │ RiskAnalyzer│   │
│  └──────────────┴──────────────┴──────────────┴─────────────┘   │
└────────────────┬────────────────────────────────────────────────┘
                 │
┌────────────────▼────────────────────────────────────────────────┐
│              Integration Layer                                   │
│  ┌──────────────┬──────────────┬──────────────┐                 │
│  │ LLM Service  │ JIRA Integ.  │ PDF Exporter │                 │
│  └──────────────┴──────────────┴──────────────┘                 │
└────────────────┬────────────────────────────────────────────────┘
                 │
┌────────────────▼────────────────────────────────────────────────┐
│              Data/Schema Layer (Pydantic Models)                 │
│  • ProjectParameters, AnalysisReport, etc.                      │
└─────────────────────────────────────────────────────────────────┘
```

## Estrutura de Diretórios Detalhada

### `src/analyzer/`
Coração da aplicação. Contém toda lógica de análise.

- **schema.py**: Modelos Pydantic para validação de dados
- **calculator.py**: Engine principal de cálculos
- **pricing_engine.py**: Consulta preços reais de APIs
- **scenario_simulator.py**: Simula cenários (pessimista/base/otimista)
- **risk_analyzer.py**: Análise de riscos técnicos e operacionais
- **utils.py**: Utilitários compartilhados

### `src/ui/`
Interface com usuário.

- **app_streamlit_chat.py**: Aplicação principal Streamlit
- **components.py**: Componentes Streamlit reutilizáveis
- **formatters.py**: Formatação de dados para UI

### `src/integrations/`
Integrações com sistemas externos.

- **llm_service.py**: Interface com LLMs (OpenAI, Google, etc.)
- **chat_analyzer.py**: Análise de linguagem natural
- **persona_detector.py**: Classificação de perfil de usuário
- **jira_integration.py**: Integração com JIRA
- **pdf_exporter.py**: Geração de relatórios PDF

### `tests/`
Testes automatizados.

- **unit/**: Testes unitários
  - `test_calculator.py`
  - `test_pricing_engine.py`
  - `test_scenario_simulator.py`
  - `test_financials.py`
- **integration/**: Testes de integração
  - `test_chat_integration.py`
  - `test_pdf_export.py`

### `docs/`
Documentação do projeto.

- **API.md**: Referência completa da API
- **ARCHITECTURE.md**: Este arquivo
- **EXAMPLES.md**: Exemplos práticos de uso
- **DEPLOYMENT.md**: Guia de deploy em produção
- **SECURITY.md**: Práticas de segurança

### `config/`
Arquivos de configuração.

- **.env.example**: Template de variáveis de ambiente
- **logging_config.py**: Configuração de logging
- **constants.py**: Constantes da aplicação

## Fluxos Principais

### 1. Fluxo de Análise (Modo Programático)

```
User Input (ProjectParameters)
          │
          ▼
┌─────────────────────┐
│ ViabilityCalculator │
└──────────┬──────────┘
           │
     ┌─────┼─────┬─────────┐
     ▼     ▼     ▼         ▼
   ROI   Risk  Scenario  Architecture
   Calc  Analysis Simulation Recommender
     │     │     │         │
     └─────┴─────┴─────────┘
             │
             ▼
    AnalysisReport (Output)
```

### 2. Fluxo de Chat (Modo Interativo)

```
User Message
     │
     ▼
PersonaDetector (Identifica tipo de usuário)
     │
     ▼
ChatAnalyzer (Extrai parâmetros)
     │
     ▼
ViabilityCalculator (Se dados suficientes)
     │
     ▼
LLM Response + Analysis Results
     │
     ▼
Streamlit UI (Renderiza resultado)
```

## Componentes Principais

### ViabilityCalculator
Classe central que orquestra toda análise.

```python
class ViabilityCalculator:
    def analyze(params: ProjectParameters) -> AnalysisReport:
        # 1. Valida parâmetros
        # 2. Calcula custos de IA
        # 3. Calcula economia
        # 4. Simula cenários
        # 5. Analisa riscos
        # 6. Recomenda arquitetura
        # 7. Retorna relatório
```

### PricingEngine
Consulta preços reais e cacheia resultados.

```python
class PricingEngine:
    def get_llm_pricing(model: str) -> Dict[str, float]:
        # Retorna: input_cost_per_1k_tokens, output_cost_per_1k_tokens
    
    def get_tool_pricing(tool: str) -> Dict[str, float]:
        # Retorna preços de ferramentas (n8n, Copilot, etc.)
```

### ScenarioSimulator
Gera cenários com diferentes premissas.

```python
class ScenarioSimulator:
    def simulate() -> Dict[str, ScenarioResult]:
        # Retorna: pessimistic, base, optimistic
```

### RiskAnalyzer
Identifica e quantifica riscos.

```python
class RiskAnalyzer:
    def analyze(params) -> RiskReport:
        # Retorna riscos: técnicos, operacionais, compliance
```

## Padrões de Design

### 1. **Dependency Injection**
Componentes recebem dependências como parâmetros, facilitando testes.

```python
class ViabilityCalculator:
    def __init__(
        self, 
        pricing_engine: PricingEngine = None,
        llm_service: LLMService = None
    ):
        self.pricing_engine = pricing_engine or PricingEngine()
        self.llm_service = llm_service or LLMService()
```

### 2. **Strategy Pattern**
Diferentes estratégias de cálculo baseadas em tipo de projeto.

```python
class CalculationStrategy:
    def calculate(params) -> Results: pass

class AutomationStrategy(CalculationStrategy): pass
class FAQDeflectionStrategy(CalculationStrategy): pass
```

### 3. **Builder Pattern**
Construção incremental de relatórios complexos.

```python
report = ReportBuilder()
    .add_executive_summary(summary)
    .add_financial_analysis(financial)
    .add_risk_analysis(risks)
    .build()
```

### 4. **Caching**
Cache inteligente de preços e cálculos caros.

```python
@lru_cache(maxsize=128)
def get_pricing(model: str, date: str):
    # Busca e cacheia por 1 hora
```

## Fluxo de Dados

### Modelo de Dados Principal

```
ProjectParameters
├── project_info: ProjectInfo
├── financial_params: FinancialParameters
├── technical_params: TechnicalParameters
└── user_profile: UserProfile

AnalysisReport
├── project_name: str
├── financial_summary: FinancialSummary
├── scenario_results: Dict[str, ScenarioResult]
├── risk_assessment: RiskAssessment
├── recommendations: Recommendations
└── executive_summary: str
```

## Decisões Arquiteturais

### 1. **Por que Streamlit em vez de Flask/Django?**
- Prototipagem rápida de UIs data-driven
- Rereexecuta scripts facilmente (ideal para cálculos)
- Integração nativa com libs científicas (Pandas, Plotly)

### 2. **Por que Pydantic para validação?**
- Type hints elegantes
- Validação automática
- Serialização JSON/dict automática
- Mensagens de erro claras

### 3. **Por que LangChain para LLM?**
- Abstração de múltiplos LLMs
- Componentes reutilizáveis (chains, agents)
- Facilita testes com mocks

### 4. **Modularidade**
- Cada componente é testável isoladamente
- Fácil adicionar novos tipos de análise
- Fácil substituir implementações (ex: mudar LLM)

## Extensibilidade

### Adicionar Nova Análise

```python
# 1. Criar classe em analyzer/
class NewAnalyzer:
    def analyze(params) -> NewResult: pass

# 2. Integrar ao ViabilityCalculator
class ViabilityCalculator:
    def analyze(self, params):
        new_analysis = NewAnalyzer().analyze(params)
        report.new_section = new_analysis

# 3. Adicionar ao UI
# Streamlit render automático
```

### Adicionar Nova Integração

```python
# 1. Criar em integrations/
class NewIntegration:
    def connect(config) -> Client: pass

# 2. Usar em ViabilityCalculator ou diretamente em app
```

## Performance Considerations

### 1. **Caching**
- Preços são cacheados por 1 hora
- Resultados de cálculo são cacheados
- LLM responses são cacheados localmente

### 2. **Async/Await**
- APIs externas usam aiohttp para paralelização
- Múltiplas requisições são feitas em paralelo

### 3. **Streaming**
- Respostas de LLM são streamadas no Streamlit
- Relatórios PDF são gerados incrementalmente

## Segurança

### 1. **Secrets Management**
- Chaves de API em `.env` local
- Variáveis de ambiente em produção
- Nunca commitar secrets

### 2. **Input Validation**
- Todos os inputs validados com Pydantic
- Regex para inputs sensíveis
- Type checking em runtime

### 3. **Logging**
- Logs estruturados (JSON)
- Sem dados sensíveis em logs
- Auditoria de mudanças

## Deployment

Veja [DEPLOYMENT.md](DEPLOYMENT.md) para detalhes sobre:
- Deploy local (desenvolvimento)
- Deploy em cloud (AWS/Azure/GCP)
- Docker containerization
- CI/CD pipelines

---

**Última atualização**: Janeiro 2024
