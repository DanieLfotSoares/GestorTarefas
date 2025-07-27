local function criaTarefa(nome,desc,prioridade)
    return{
        nome = nome,
        descricao = desc,
        concluida = false,
        prioridade = prioridade or 1,
        dataCriacao = os.date("%Y-%m-%d %H:%M:%S")
    }
end

local function salvarTarefas(tarefas, nomeFicheiro)
    local ficheiro = io.open(nomeFicheiro, "w")  -- write
    if ficheiro then
        for i, tarefa in ipairs(tarefas) do
            -- Formato: nome;descricao;concluida;prioridade;dataCriacao
            local linha = tarefa.nome .. ";" .. tarefa.descricao .. ";" .. 
                         tostring(tarefa.concluida) .. ";" .. tarefa.prioridade .. 
                         ";" .. tarefa.dataCriacao
            ficheiro:write(linha .. "\n")
        end
        ficheiro:close()
        return true
    else
        return false
    end
end

local function carregarTarefas(nomeFicheiro)
    local tarefas = {}
    local ficheiro = io.open(nomeFicheiro, "r")  -- "r" = read (ler)
    if ficheiro then
        for linha in ficheiro:lines() do
            -- Dividir a linha pelos ";"
            local partes = {}
            for parte in string.gmatch(linha, "([^;]+)") do
                table.insert(partes, parte)
            end
            
            if #partes == 5 then
                local tarefa = {
                    nome = partes[1],
                    descricao = partes[2],
                    concluida = (partes[3] == "true"),
                    prioridade = tonumber(partes[4]),
                    dataCriacao = partes[5]
                }
                table.insert(tarefas, tarefa)
            end
        end
        ficheiro:close()
    end
    return tarefas
end

local function listarTarefas(tarefas)
    if #tarefas == 0 then
        print("Nenhuma tarefa registada.");
    else
        print("Lista de tarefas:");
        for i, tarefa in ipairs(tarefas) do
            local status = tarefa.concluida and "[Concluida]" or "[ ]"
            print(i .. ". " .. status .. " " .. tarefa.nome .. " - " .. tarefa.descricao .. " (Prioridade: " .. tarefa.prioridade .. ")" .. " - " .. tarefa.dataCriacao);
        end
    end
end

local function removerTarefa(tarefas,numeroTarefa)
    if numeroTarefa < 1 or numeroTarefa > #tarefas then
        print("Numero de tarefa invalido.");
    else
        table.remove(tarefas, numeroTarefa);
        print("Tarefa removida com sucesso!");
    end
end
local function printComandos()
    print("Comandos disponiveis:");
    print("1. Adicionar tarefa");
    print("2. Listar tarefas");
    print("3. Concluir tarefa");
    print("4. Remover tarefa");
    print("5. Sair");
end

local function concluirTarefa(tarefas, numeroTarefa)
    if numeroTarefa < 1 or numeroTarefa > #tarefas then
        print("Número de tarefa inválido.");
    else
        tarefas[numeroTarefa].concluida = true;
        print("Tarefa '" .. tarefas[numeroTarefa].nome .. "' concluída com sucesso!");
    end
end
local tarefas = {};

local function main()
    print("Bem-vindo ao Gestor de Tarefas!")
    
    -- Carregar tarefas existentes do ficheiro
    tarefas = carregarTarefas("tarefasLua.txt")
    if #tarefas > 0 then
        print("Carregadas " .. #tarefas .. " tarefas salvas.")
    else
        print("Nenhuma tarefa encontrada. Comecando com lista vazia.")
    end;
    
    while true do
        printComandos();
        print("Escolha uma opção: ");
        local opcao = io.read();
        
        if opcao == "1" then
            print("Digite o nome da tarefa: ");
            local nome = io.read();
            print("Digite a descricao da tarefa: ");
            local descricao = io.read();
            print("Digite a prioridade da tarefa (1-5): ");
            local prioridade = tonumber(io.read());
            local novaTarefa = criaTarefa(nome, descricao, prioridade);
            table.insert(tarefas, novaTarefa);
            print("Tarefa adicionada com sucesso!");
            salvarTarefas(tarefas, "tarefasLua.txt"); -- Auto-salvar
        elseif opcao == "2" then
            listarTarefas(tarefas);
        elseif opcao == "3" then
            listarTarefas(tarefas);
            print("Digite o numero da tarefa a concluir: ");
            local numeroTarefa = tonumber(io.read());
            concluirTarefa(tarefas, numeroTarefa);
            salvarTarefas(tarefas, "tarefasLua.txt"); -- Auto-salvar
        elseif opcao == "4" then
            listarTarefas(tarefas);
            print("Digite o numero da tarefa a remover: ");
            local numeroTarefa = tonumber(io.read());
            removerTarefa(tarefas, numeroTarefa);
            salvarTarefas(tarefas, "tarefasLua.txt"); -- Auto-salvar
        elseif opcao == "5" then
            -- Salvar tarefas antes de sair
            if salvarTarefas(tarefas, "tarefasLua.txt") then
                print("Tarefas salvas com sucesso!")
            else
                print("Erro ao salvar tarefas.")
            end
            print("Obrigado por usar o Gestor de Tarefas!")
            break;       
        end
        os.execute("timeout /t 2 >nul")
        print(""); -- Linha em branco para melhor legibilidade
    end
end

-- Chama a função principal
main()