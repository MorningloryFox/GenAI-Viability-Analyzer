# API Reference

## Classes Principais

### ViabilityCalculator

```python
class ViabilityCalculator:
    """Engine principal de análise de viabilidade."""
    
    def analyze(self, params: ProjectParameters) -> AnalysisReport:
        """
        Realiza análise completa de viabilidade.
        
        Args:
            params: Parâmetros do projeto
        
        Returns:
            AnalysisReport com resultados completos
        
        Raises:
            ValidationError: Se parâmetros inválidos
        """
```

### ProjectParameters

```python
@dataclass
class ProjectParameters:
    """Parâmetros de entrada para análise."""
    
    project_name: str  # Nome do projeto
    current_annual_cost: float  # Custo anual em USD
    automation_percentage: float  # Percentual de automação (0-1)
    estimated_ftes_to_replace: int  # FTEs a substituir
    is_technical_user: bool = False  # Mostrar parâmetros avançados
```

### AnalysisReport

```python
@dataclass
class AnalysisReport:
    """Resultado da análise."""
    
    project_name: str
    financial_summary: FinancialSummary
    scenario_results: Dict[str, ScenarioResult]
    risk_assessment: RiskAssessment
    recommendations: Recommendations
    executive_summary: str
    
    def export_to_pdf(self, filename: str) -> None:
        """Exporta relatório em PDF."""
    
    def export_to_markdown(self, filename: str) -> None:
        """Exporta relatório em Markdown."""
```

Consulte a pasta `/src/analyzer/` para documentação completa de todas as classes.
