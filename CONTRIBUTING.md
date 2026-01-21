# Guia de Contribuição

Obrigado pelo seu interesse em contribuir para o **GenAI Viability Analyzer**! Este documento fornece diretrizes para colaborar com o projeto.

## 📋 Código de Conduta

Este projeto segue um Código de Conduta para garantir uma comunidade inclusiva e respeitosa. Ao participar, você concorda em aderir aos seus termos.

## 🐛 Reportando Bugs

Antes de abrir uma issue, por favor:

1. Verifique se o bug já foi reportado
2. Colete informações importantes:
   - Versão do Python
   - Versão do projeto
   - Sistema operacional
   - Passos para reproduzir
   - Comportamento esperado vs observado

**Template de Issue de Bug:**

```markdown
## Descrição
[Descrição clara do bug]

## Passos para Reproduzir
1. [Passo 1]
2. [Passo 2]
3. [...]

## Comportamento Esperado
[Descrição do que deveria acontecer]

## Comportamento Atual
[O que realmente acontece]

## Ambiente
- Python: [versão]
- OS: [Windows/Linux/macOS]
- Versão do Projeto: [versão]

## Logs/Erros
[Cole logs relevantes aqui]
```

## 💡 Sugerindo Melhorias

Sugestões de novas funcionalidades são bem-vindas! Por favor:

1. Use um título claro e descritivo
2. Forneça uma descrição detalhada
3. Liste exemplos de casos de uso
4. Mencione soluções alternativas conhecidas

**Template de Sugestão:**

```markdown
## Descrição da Melhoria
[Descrição clara da funcionalidade sugerida]

## Motivação
Por que essa funcionalidade seria útil?

## Exemplo de Uso
[Código ou exemplo mostrando como seria usado]

## Possíveis Implementações
[Ideias sobre como implementar, se houver]
```

## 🔧 Configurando o Ambiente de Desenvolvimento

```bash
# Clone seu fork
git clone https://github.com/seu-username/GenAI-Viability-Analyzer.git
cd GenAI-Viability-Analyzer

# Adicione upstream como remote
git remote add upstream https://github.com/original/GenAI-Viability-Analyzer.git

# Crie ambiente virtual
python -m venv venv
source venv/bin/activate  # ou venv\Scripts\activate no Windows

# Instale dependências de desenvolvimento
pip install -r requirements.txt
pip install -r requirements-dev.txt
```

## 📝 Padrões de Código

### Python Style Guide

Seguimos [PEP 8](https://pep8.org/) com as seguintes ferramentas:

```bash
# Formatação com Black
black src/ tests/

# Linting com Flake8
flake8 src/ tests/ --max-line-length=100

# Type checking com MyPy
mypy src/
```

### Convenções

- **Nomenclatura**: `snake_case` para variáveis/funções, `PascalCase` para classes
- **Docstrings**: Use formato Google (veja exemplo abaixo)
- **Type hints**: Sempre adicione type hints em funções públicas
- **Comentários**: Código claro é melhor que comentários; use comentários para o "por quê", não o "o quê"

### Exemplo de Função bem estruturada

```python
def calculate_roi(
    initial_investment: float,
    annual_benefit: float,
    years: int = 3
) -> Dict[str, float]:
    """
    Calcula o ROI de um projeto.
    
    Args:
        initial_investment: Custo inicial em dólares
        annual_benefit: Benefício anual em dólares
        years: Período de análise em anos (padrão: 3)
    
    Returns:
        Dicionário com ROI, payback period e métricas relacionadas
    
    Raises:
        ValueError: Se initial_investment ou annual_benefit forem negativos
    
    Example:
        >>> roi = calculate_roi(100000, 50000, 3)
        >>> print(roi['roi_percentage'])
        50.0
    """
    if initial_investment < 0 or annual_benefit < 0:
        raise ValueError("Investment and benefit must be positive")
    
    total_benefit = annual_benefit * years
    roi = (total_benefit - initial_investment) / initial_investment
    payback = initial_investment / annual_benefit if annual_benefit > 0 else float('inf')
    
    return {
        'roi_percentage': roi * 100,
        'payback_years': payback,
        'total_benefit': total_benefit
    }
```

## 🧪 Testes

### Escrevendo Testes

- Coloque testes unitários em `tests/unit/`
- Coloque testes de integração em `tests/integration/`
- Use [pytest](https://pytest.org/) como framework
- Aim for >80% code coverage

### Exemplo de Teste

```python
import pytest
from src.analyzer.calculator import ViabilityCalculator
from src.analyzer.schema import ProjectParameters

class TestViabilityCalculator:
    """Testes para o ViabilityCalculator."""
    
    @pytest.fixture
    def calculator(self):
        """Fixture que fornece uma instância do calculator."""
        return ViabilityCalculator()
    
    @pytest.fixture
    def basic_params(self):
        """Fixture com parâmetros básicos para testes."""
        return ProjectParameters(
            project_name="Test Project",
            current_annual_cost=100000,
            automation_percentage=0.30
        )
    
    def test_calculate_roi_positive_case(self, calculator, basic_params):
        """Testa cálculo de ROI com caso positivo."""
        report = calculator.analyze(basic_params)
        assert report.roi_percentage > 0
        assert report.payback_months < 24
    
    def test_invalid_parameters_raises_error(self, calculator):
        """Testa que parâmetros inválidos levantam erro."""
        invalid_params = ProjectParameters(
            project_name="",
            current_annual_cost=-100000  # Inválido
        )
        with pytest.raises(ValueError):
            calculator.analyze(invalid_params)
```

### Rodando Testes

```bash
# Todos os testes
pytest tests/

# Com cobertura
pytest tests/ --cov=src --cov-report=html

# Apenas um arquivo
pytest tests/unit/test_calculator.py

# Apenas uma função
pytest tests/unit/test_calculator.py::TestViabilityCalculator::test_calculate_roi_positive_case

# Modo verbose
pytest tests/ -v
```

## 📤 Processo de Pull Request

### 1. Criar Branch

```bash
# Atualize main
git fetch upstream
git checkout main
git merge upstream/main

# Crie uma branch com nome descritivo
git checkout -b feat/short-description
# ou
git checkout -b fix/short-description
```

### Convenções de Branch:
- `feat/...` - Novas funcionalidades
- `fix/...` - Correção de bugs
- `docs/...` - Documentação
- `refactor/...` - Refatoração sem alteração funcional
- `test/...` - Adição de testes

### 2. Fazer Commits

Use mensagens de commit claras e descritivas:

```bash
# Bom
git commit -m "feat: adiciona análise de risco a cenários pessimistas"
git commit -m "fix: corrige cálculo de tokenomics para input+output"

# Evitar
git commit -m "fix bug"
git commit -m "WIP"
```

Convenção: `<type>: <subject>`
- **feat**: Nova funcionalidade
- **fix**: Correção de bug
- **docs**: Mudanças em documentação
- **style**: Formatação (sem alteração de lógica)
- **refactor**: Refatoração de código
- **test**: Adição/atualização de testes
- **chore**: Tarefas de build, dependências, etc.

### 3. Push e Abrir PR

```bash
git push origin feat/short-description
```

Vá ao GitHub e clique em "Compare & pull request".

### 4. Template de PR

```markdown
## Descrição
[Descrição clara das mudanças]

## Tipo de Mudança
- [ ] Bug fix
- [ ] Nova funcionalidade
- [ ] Breaking change
- [ ] Mudança em documentação

## Problema Relacionado
Fixes #[issue number]

## Como Foi Testado
[Descrição de como você testou]

## Checklist
- [ ] Meu código segue o estilo do projeto
- [ ] Executei lint e formatação (`black`, `flake8`)
- [ ] Adicionei testes para novas funcionalidades
- [ ] Todos os testes passaram
- [ ] Documentação foi atualizada
- [ ] Sem breaking changes (ou documentado)

## Screenshots (se aplicável)
[Cole screenshots de mudanças de UI]
```

## ✅ Checklist Antes de Enviar PR

- [ ] Código formatado com `black`
- [ ] Passou em `flake8` e `mypy`
- [ ] Todos os testes passam: `pytest tests/ --cov=src`
- [ ] Novos testes adicionados para lógica nova
- [ ] Documentação atualizada (README, docstrings, etc.)
- [ ] Branch está atualizado com `main`
- [ ] Commits têm mensagens claras
- [ ] Sem arquivos desnecessários commitados

## 🔄 Revisão e Feedback

- Mantenha uma mente aberta para feedback
- Responda comentários de forma respeitosa
- Faça as mudanças solicitadas em novos commits
- Peça esclarecimento se algo não está claro

## 📚 Documentação

Ao adicionar funcionalidades:

1. Atualize docstrings
2. Atualize README se necessário
3. Adicione exemplos em `docs/EXAMPLES.md`
4. Atualize `docs/ARCHITECTURE.md` se houver mudanças estruturais

## 🚀 Processo de Release

Maintainers seguem [Semantic Versioning](https://semver.org/):

- **MAJOR.MINOR.PATCH** (ex: 1.2.3)
- MAJOR: Breaking changes
- MINOR: Novas funcionalidades (backward compatible)
- PATCH: Bug fixes

## ❓ Dúvidas?

- Abra uma [discussion](https://github.com/yourusername/GenAI-Viability-Analyzer/discussions)
- Veja issues existentes para contexto
- Procure no histórico de PRs

---

**Obrigado por contribuir! Sua ajuda torna este projeto melhor para todos.** 🙌
