# Arquitetura AS-IS: Projeto Delphi "Tickets"

Este documento apresenta o levantamento do cenário atual (AS-IS) da arquitetura, tecnologias e estrutura do projeto Delphi **Tickets**.

## 1. Visão Geral e Tecnologias
* **Linguagem / Framework:** Delphi (Object Pascal) utilizando **VCL** (Visual Component Library) para aplicação Desktop Windows (Win32).
* **Arquitetura Base:** Monolítica, baseada em formulários (Form-Driven) com um DataModule centralizado para conexão a dados. A regra de negócio e os eventos de interface estão fortemente acoplados.
* **Acesso a Dados:** Microsoft **ADO** (ActiveX Data Objects) via biblioteca nativa `Data.Win.ADODB`.
* **Banco de Dados:** **Microsoft SQL Server** (OLE DB Provider). O banco de dados alvo se chama `TicketSupportDB`.

## 2. Estrutura de Módulos (Units)
A aplicação é carregada via `Tickets.dpr`, que auto-instancia todos os formulários e o DataModule de uma vez durante o boot (`Application.CreateForm`).

### `uDMConexao` (`TdmConexao`)
* DataModule central da aplicação.
* Possui 2 instâncias de conexões ADO para o SQL Server (`ADOConnection1`, `ADOConnection2`).
* Contém as `TADOQuery` responsáveis pelos principais comandos:
  * `qryTickets`: Consulta central com join/projeção das colunas da tabela de `Tickets`.
  * `qryDashboard`: Usada para contadores e estatísticas.
  * `qryLogin` e `qryExec`: Usadas para validação de acesso e inserções pontuais (ex: cadastro de usuários).

### `uMain` (`TfrmLogin`)
* Ponto de entrada visual da aplicação.
* Lida com a Autenticação. Valida diretamente `Username` e `Password` contra a tabela de banco de dados.
* Possui a lógica de cadastro (Sign Up) acoplada internamente, trocando a visibilidade dos painéis (`pnlLogin` vs `pnlCadastro`).

### `uPrincipal` (`TfrmPrincipal`)
* Dashboard Principal exibido após o sucesso do login.
* Interface em abas (`TabControl1`):
  * **Tab 0 (Dashboard):** Exibe métricas como "Total", tickets em abertos ("Em Análise") e tickets "Finalizados". Os cálculos são executados diretamente no banco de dados através da `qryDashboard`.
  * **Tab 1 (Lista de Chamados):** Exibe um `TDBGrid` com os tickets. Conta com diversos campos de `TEdit` para filtragem local via propriedade `Filter` do DataSet (Filtragem em tempo real sobre ID, Empresa, Responsável, Módulo, Título).

### `uCadastro` (`TfrmRegistro`)
* Inicialmente criado para ser a tela de Cadastro de Usuários.
* **Status:** Parcialmente obsoleto/abandonado. No evento de cadastro atual (em `uMain.pas`), o desenvolvedor comentou a chamada `//frmRegistro.ShowModal;` e substituiu por painéis visíveis dentro da própria tela de login.

## 3. Entidades de Dados Identificadas
A aplicação consome e persiste dados fundamentalmente em duas estruturas (tabelas) no SQL Server:
1. **`Users`**: Armazena as credenciais de acesso (`username`, `password`, `role`).
2. **`Tickets`**: Armazena os chamados. Principais colunas identificadas: `id`, `responsible`, `title`, `type`, `requester`, `priority`, `columnId` (status do ticket), e `createdAt`.

## 4. Pontos de Atenção (Débitos Técnicos e Melhorias no AS-IS)
Com base na análise do código atual, levantamos algumas oportunidades de melhoria que estão presentes na arquitetura vigente:
* **Segurança:** As senhas estão sendo consultadas e gravadas em texto plano (plain-text) na tabela `Users`. Falta implementação de hash criptográfico (como SHA-256 ou BCrypt).
* **Ciclo de Vida da Aplicação:** O `Tickets.dpr` constrói todos os forms imediatamente na abertura da aplicação (`Application.CreateForm`), incluindo a tela principal e a tela de login. O ideal é construir apenas a tela de Login ou DataModule, poupando memória, e criar o `frmPrincipal` sob demanda.
* **Injeção de Dependências vs Acoplamento:** A regra de negócios, strings de conexão e query SQL hardcoded estão fortemente misturadas com os cliques de botões da interface (MVC/MVVM não aplicados).
* **Magic Strings e Queries:** Status de tickets (ex: `'Em Análise'`, `'Finalizado'`) estão sendo escritos "hardcoded" de forma literal dentro das queries de Dashboard em `uPrincipal.pas`.
* **Segurança SQL:** A filtragem em memória feita em `uPrincipal` é funcional, mas deve-se ter cuidado se expandida para backend/queries diretas, pois usa concatenação de texto não parametrizada nos eventos do tipo `OnChange` dos Edits.
