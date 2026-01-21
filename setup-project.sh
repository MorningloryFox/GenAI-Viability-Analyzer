#!/bin/bash
# setup-project.sh - Script para configurar o projeto após migração

set -e

echo "🚀 Iniciando setup do GenAI Viability Analyzer..."
echo ""

# 1. Criar ambiente virtual
echo "1️⃣  Criando ambiente virtual..."
python -m venv venv
echo "   ✅ Ambiente virtual criado"
echo ""

# 2. Ativar ambiente virtual
echo "2️⃣  Ativando ambiente virtual..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    source venv/Scripts/activate  # Windows
else
    source venv/bin/activate  # Linux/Mac
fi
echo "   ✅ Ambiente ativado"
echo ""

# 3. Atualizar pip
echo "3️⃣  Atualizando pip..."
pip install --upgrade pip
echo "   ✅ pip atualizado"
echo ""

# 4. Instalar dependências
echo "4️⃣  Instalando dependências..."
pip install -r requirements.txt
echo "   ✅ Dependências instaladas"
echo ""

# 5. Instalar dependências de desenvolvimento
echo "5️⃣  Instalando dependências de desenvolvimento..."
pip install pytest pytest-cov black flake8 mypy pre-commit
echo "   ✅ Dev dependencies instaladas"
echo ""

# 6. Setup pre-commit
echo "6️⃣  Configurando pre-commit hooks..."
pre-commit install
echo "   ✅ Pre-commit configurado"
echo ""

# 7. Rodar testes
echo "7️⃣  Rodando testes..."
pytest tests/ --cov=src --cov-report=term-missing
echo "   ✅ Testes completados"
echo ""

echo "✅ Setup concluído com sucesso!"
echo ""
echo "📝 Próximos passos:"
echo "   1. Copiar seus arquivos .py para src/"
echo "   2. Atualizar imports no código"
echo "   3. Rodar pytest novamente"
echo "   4. Fazer commit: git add . && git commit -m 'Add project files'"
echo "   5. Push: git push origin main"
echo ""
echo "Happy coding! 🎉"
