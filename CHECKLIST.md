- [ ] **Ler documentação inicial**
  - [ ] Abrir `START_HERE.txt`
  - [ ] Ler `00_LEIA_PRIMEIRO.md`
  - [ ] Revisar `MIGRATION_SUMMARY.md`

- [ ] **Copiar arquivos Python**
  - [ ] `calc_functions.py` → `src/analyzer/`
  - [ ] `pricing_engine.py` → `src/analyzer/`
  - [ ] `scenario_simulation.py` → `src/analyzer/`
  - [ ] `schema.py` → `src/analyzer/`
  - [ ] `app_streamlit_chat.py` → `src/ui/`
  - [ ] `chat_analyzer.py` → `src/integrations/`
  - [ ] `persona_detector.py` → `src/integrations/`
  - [ ] `jira_integration.py` → `src/integrations/`
  - [ ] `pdf_exporter.py` → `src/integrations/`
  - [ ] `logging_config.py` → `config/`
  - [ ] `db_handler.py` → `src/analyzer/`
  - [ ] `tool_cost_calculator.py` → `src/analyzer/`
  - [ ] Testes → `tests/unit/` e `tests/integration/`

- [ ] **Atualizar imports em todos arquivos**
  - [ ] Buscar e substituir imports relativos
  - [ ] Exemplo: `from schema import X` → `from src.analyzer.schema import X`
  - [ ] Exemplo: `from config_mavi import X` → `from config.logging_config import X`

- [ ] **Testar localmente**
  - [ ] Criar ambiente virtual: `python -m venv venv`
  - [ ] Ativar: `venv\Scripts\activate`
  - [ ] Instalar deps: `pip install -r requirements.txt`
  - [ ] Rodar testes: `pytest tests/`
  - [ ] Verificar linting: `flake8 src/`
  - [ ] Formatar: `black src/ tests/`

- [ ] **Configurar variáveis de ambiente**
  - [ ] Copiar `.env.example` para `.env` local
  - [ ] Adicionar `OPENAI_API_KEY=sua-chave`
  - [ ] Adicionar outras credenciais necessárias
  - [ ] **NUNCA** fazer commit do `.env` real

- [ ] **Configurar Git**
  - [ ] Inicializar: `git init`
  - [ ] Adicionar tudo: `git add .`
  - [ ] Commit inicial: `git commit -m "Initial professional structure"`
  - [ ] Adicionar origin: `git remote add origin https://...`
  - [ ] Push: `git push -u origin main`

- [ ] **Criar repositório GitHub**
  - [ ] Acessar https://github.com/new
  - [ ] Nome: `GenAI-Viability-Analyzer`
  - [ ] Descrição: "Professional framework for GenAI project viability analysis"
  - [ ] Público ou Privado (sua escolha)
  - [ ] Não inicializar com README/LICENSE (já temos)

- [ ] **Configurar GitHub**
  - [ ] Habilitar Discussions
  - [ ] Adicionar branch protection (main)
  - [ ] Configurar Require pull request reviews
  - [ ] Adicionar CODEOWNERS (opcional)

- [ ] **Configurar CI/CD** (opcional)
  - [ ] Criar `.github/workflows/tests.yml`
  - [ ] Adicionar GitHub Secrets (OPENAI_API_KEY, etc)
  - [ ] Testar workflow automático

- [ ] **Adicionar colaboradores** (opcional)
  - [ ] Settings → Collaborators
  - [ ] Convidar membros do time

- [ ] **Documentação final**
  - [ ] Verificar todos links no README
  - [ ] Adicionar badges de status
  - [ ] Documentar comandos de desenvolvimento
  - [ ] Adicionar agradecimentos

- [ ] **Segurança final**
  - [ ] Verificar que `.env` não está em git
  - [ ] Rotar credenciais antigas
  - [ ] Verificar que arquivos sensíveis estão no `.gitignore`
  - [ ] Configurar protection rules

- [ ] **Primeira release** (opcional)
  - [ ] Criar tag: `git tag v1.0.0`
  - [ ] Push tag: `git push origin v1.0.0`
  - [ ] Criar Release no GitHub
  - [ ] Adicionar notas da versão

---

## Estrutura esperada após migração:

```
GenAI-Viability-Analyzer/
├── src/
│   ├── analyzer/
│   │   ├── calc_functions.py
│   │   ├── pricing_engine.py
│   │   ├── scenario_simulation.py
│   │   ├── schema.py
│   │   ├── db_handler.py
│   │   └── tool_cost_calculator.py
│   ├── ui/
│   │   └── app_streamlit_chat.py
│   └── integrations/
│       ├── chat_analyzer.py
│       ├── persona_detector.py
│       ├── jira_integration.py
│       └── pdf_exporter.py
├── config/
│   └── logging_config.py
├── tests/
│   ├── unit/
│   │   ├── test_calc_determinism.py
│   │   ├── test_financials.py
│   │   ├── test_simulation.py
│   │   └── test_stress_scenarios.py
│   └── integration/
│       └── test_chat_integration.py
└── [arquivos de config já criados]
```

---

## Troubleshooting

**Q: "ModuleNotFoundError: No module named 'src'"**
A: Você está rodando de um diretório incorreto. Faça `cd GenAI-Viability-Analyzer` primeiro.

**Q: "Import não funciona mesmo atualizando"**
A: Certifique-se de que `__init__.py` está em todas as pastas (já criamos).

**Q: ".env não está sendo lido"**
A: Instale `python-dotenv` e adicione no início do arquivo:
```python
from dotenv import load_dotenv
load_dotenv()
```

**Q: Testes falhando**
A: Rode `pytest tests/ -v` para ver detalhes. Verifique imports nos testes.

**Q: Como rodar só a app Streamlit?**
A: `streamlit run src/ui/app_streamlit_chat.py`

---

## Dicas Importantes

1. **Nunca commitar secrets**: Use `.env.example` como template
2. **Rodar testes antes de push**: `pytest tests/`
3. **Formatar código**: `black src/ tests/`
4. **Verificar linting**: `flake8 src/`
5. **Use branches para features**: `git checkout -b feat/meu-recurso`

---

**Após completar este checklist, seu projeto estará pronto para GitHub! 🎉**
