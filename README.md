# 📝 Gestor de Lista de Tarefas em Lua

Um gestor de tarefas simples e eficiente desenvolvido em Lua que permite adicionar, listar, concluir e remover tarefas com persistência de dados em ficheiro de texto.

## 🚀 Funcionalidades

- ✅ **Adicionar tarefas** com nome, descrição e prioridade
- 📋 **Listar tarefas** com status visual de conclusão
- ✔️ **Marcar tarefas como concluídas**
- 🗑️ **Remover tarefas** da lista
- 💾 **Persistência automática** - as tarefas são salvas em ficheiro
- 🔄 **Carregamento automático** - as tarefas são recuperadas ao iniciar o programa

## 📁 Estrutura do Projeto

```
gestor de lista de tarefas/
├── Gestor.lua           # Código principal do programa
├── tarefasLua.txt       # Ficheiro de dados (criado automaticamente)
└── README.md           # Este ficheiro
```

## 🛠️ Pré-requisitos

- **Lua 5.4** instalado no sistema
- Sistema operativo Windows (testado no Windows)
- Acesso à linha de comandos (PowerShell/CMD)


## 🚀 Como Executar

### Opção 1: Terminal/PowerShell
```bash
# Execute o programa
C:\lua54\lua54.exe Gestor.lua
```

### Opção 2: VS Code Task
1. Abra o projeto no VS Code
2. Pressione `Ctrl+Shift+P`
3. Digite "Tasks: Run Task"
4. Selecione "Executar Gestor de Tarefas"

## 📖 Como Usar

### Menu Principal
Ao executar o programa, verá o seguinte menu:

```
========================================
           MENU PRINCIPAL
========================================
1. Adicionar tarefa
2. Listar tarefas
3. Concluir tarefa
4. Remover tarefa
5. Sair
========================================
```

### 1. Adicionar Tarefa
- Escolha a opção `1`
- Digite o nome da tarefa
- Digite a descrição detalhada
- Defina a prioridade (1-5, sendo 5 mais importante)

### 2. Listar Tarefas
- Escolha a opção `2`
- Visualize todas as tarefas com:
  - `[Concluida]` para tarefas finalizadas
  - `[ ]` para tarefas pendentes
  - Nome, descrição, prioridade e data de criação

### 3. Concluir Tarefa
- Escolha a opção `3`
- Veja a lista de tarefas
- Digite o número da tarefa a marcar como concluída

### 4. Remover Tarefa
- Escolha a opção `4`
- Veja a lista de tarefas
- Digite o número da tarefa a remover permanentemente

### 5. Sair
- Escolha a opção `5`
- As tarefas são salvas automaticamente
- O programa encerra

## 💾 Formato dos Dados

As tarefas são salvas no ficheiro `tarefasLua.txt` no seguinte formato:
```
nome;descrição;concluida;prioridade;dataCriacao
```

Exemplo:
```
Estudar Lua;Fazer exercicios de programacao;false;3;2025-01-27 14:30:15
Fazer compras;Ir ao supermercado;true;1;2025-01-27 15:20:00
```

## 🔧 Funcionalidades Técnicas

### Auto-salvamento
- As tarefas são salvas automaticamente após cada operação (adicionar, concluir, remover)
- Backup adicional ao sair do programa

### Validação de Dados
- Verificação de números de tarefa válidos
- Conversão automática de tipos (string para número)
- Tratamento de erros de ficheiro

### Persistência
- Carregamento automático das tarefas ao iniciar
- Formato de dados simples e legível
- Compatibilidade entre sessões

## 🏗️ Estrutura do Código

### Funções Principais

| Função | Descrição |
|--------|-----------|
| `criaTarefa()` | Cria uma nova tarefa com os dados fornecidos |
| `salvarTarefas()` | Salva todas as tarefas no ficheiro |
| `carregarTarefas()` | Carrega tarefas do ficheiro |
| `listarTarefas()` | Exibe todas as tarefas formatadas |
| `concluirTarefa()` | Marca uma tarefa como concluída |
| `removerTarefa()` | Remove uma tarefa da lista |
| `main()` | Função principal com loop do menu |

### Estrutura de uma Tarefa
```lua
tarefa = {
    nome = "string",
    descricao = "string", 
    concluida = boolean,
    prioridade = number (1-5),
    dataCriacao = "YYYY-MM-DD HH:MM:SS"
}
```

## 🐛 Possíveis Melhorias Futuras

- [ ] Filtros por prioridade ou status
- [ ] Ordenação de tarefas
- [ ] Datas de vencimento
- [ ] Categorias/tags
- [ ] Interface gráfica
- [ ] Exportação para outros formatos (JSON, CSV)
- [ ] Backup automático

## 📝 Notas de Desenvolvimento

- Desenvolvido em Lua 5.4
- Utiliza bibliotecas padrão do Lua (`io`, `os`, `string`, `table`)
- Compatível com Windows (comandos de timeout)
- Código comentado e bem estruturado
- Tratamento básico de erros implementado

## 👨‍💻 Autor

**Daniel Filipe Oliveira Teixeira Soares**

## 📄 Licença

Este projeto é livre para uso educacional e pessoal.
