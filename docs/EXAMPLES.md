# Exemplos de Uso

Aqui você encontra exemplos práticos de como usar o GenAI Viability Analyzer.

## 📚 Índice

1. [Uso via CLI](#uso-via-cli)
2. [Uso Programático](#uso-programático)
3. [Interface de Chat](#interface-de-chat)
4. [Exemplos Reais](#exemplos-reais)

---

## Uso via CLI

### Exemplo 1: Análise Básica

```bash
# Executar análise com arquivo de configuração
genai-analyzer analyze --config project_config.json --output report.pdf
```

### Exemplo 2: Modo Interativo

```bash
# Inicia modo interativo onde você entra com parâmetros
genai-analyzer interactive
```

---

## Uso Programático

### Exemplo 1: Análise Simples

```python
from src.analyzer.calculator import ViabilityCalculator
from src.analyzer.schema import ProjectParameters

# Criar parâmetros
params = ProjectParameters(
    project_name="Customer Support Chatbot",
    description="Implementar chatbot GenAI para reduzir tickets",
    current_annual_cost=480000,
    estimated_ftes_to_replace=4,
    automation_percentage=0.35,
    is_technical_user=False
)

# Calcular viabilidade
calculator = ViabilityCalculator()
report = calculator.analyze(params)

# Usar resultados
print(f"ROI: {report.financial_summary.roi_percentage:.1f}%")
print(f"Payback: {report.financial_summary.payback_months:.1f} meses")
print(f"Economia: ${report.financial_summary.annual_savings:,.0f}")

# Exportar
report.export_to_pdf("analysis_chatbot.pdf")
```

---

## Interface de Chat

Acesse via Streamlit:

```bash
streamlit run src/ui/app_streamlit_chat.py
```

A interface é conversacional e intuitiva - apenas converse com o assistente!

---

Para mais exemplos, consulte a documentação completa em `/docs`.
