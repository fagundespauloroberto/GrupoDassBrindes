# 🎁 Sistema de Gestão de Brindes de Funcionários (Grupo Dass)

Aplicação desktop desenvolvida em **Delphi 2010** com **Firebird 3.0**, criada para o gerenciamento e controle de tamanhos de brindes (vestuário e calçados) dos colaboradores do Grupo Dass.

---

## 📌 Arquitetura e Boas Práticas

O projeto foi construído seguindo o padrão arquitetural **MVC (Model-View-Controller)**, garantindo desacoplamento entre as camadas de apresentação, regras de negócio e persistência de dados:

* **Model (`src/Models/`):** Representação das entidades do domínio (`uFuncionarioModel.pas`).
* **View (`src/Views/`):** Interface de usuário com divisão clara entre telas de consulta e formulários modais de edição/inclusão (`uFrmConsulta.pas`, `uFrmCadastro.pas`).
* **Controller (`src/Controllers/`):** Regras de negócio, mediação de persistência e gerenciamento das instruções SQL (`uFuncionarioController.pas`).
* **Utils (`src/Utils/`):** Módulos utilitários reusáveis, incluindo o cálculo matemático do **Módulo 11 para validação de CPF** (`uValidacoes.pas`).

---

## 🛠️ Tecnologias e Componentes Utilizados

* **IDE:** Embarcadero Delphi 2010
* **Banco de Dados:** Firebird 3.0 (32-bit)
* **Acesso a Dados:** dbExpress (`TSQLConnection`, `TSQLQuery`) + ClientDataSet (`TDataSetProvider`, `TClientDataSet`)
* **Linguagem:** Object Pascal

---

## 📁 Estrutura do Repositório

```text
├── bin/                      # Executável compilado (.exe) e dependências (fbclient.dll)
├── database/                 # Script DDL de criação do banco de dados (SCRIPT_DB.sql)
├── src/
│   ├── Connection/           # DataModule e conexões dbExpress (uDMConnection.pas)
│   ├── Controllers/          # Camada de controle e regras de negócio (uFuncionarioController.pas)
│   ├── Models/               # Camada de dados e objetos de domínio (uFuncionarioModel.pas)
│   ├── Utils/                # Validações e rotinas utilitárias (uValidacoes.pas)
│   └── Views/                # Telas da aplicação VCL (uFrmConsulta.pas, uFrmCadastro.pas)
└── DassBrindes.dpr           # Arquivo do Projeto Delphi

```

---

## 🛢️ Estrutura do Banco de Dados (`database/SCRIPT_DB.sql`)

```sql
-- Tabela principal
CREATE TABLE FUNCIONARIO (
    ID INTEGER NOT NULL PRIMARY KEY,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(150) NOT NULL,
    TAMANHO_CAMISETA VARCHAR(3) NOT NULL,
    TAMANHO_CALCADO INTEGER NOT NULL,
    DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Validações a nível de Banco de Dados
    CONSTRAINT CHK_CAMISETA CHECK (TAMANHO_CAMISETA IN ('PP', 'P', 'M', 'G', 'GG', 'XG')),
    CONSTRAINT CHK_CALCADO CHECK (TAMANHO_CALCADO BETWEEN 34 AND 48),
    CONSTRAINT CHK_CPF_TAMANHO CHECK (CHAR_LENGTH(CPF) = 11)
);

-- Auto-Incremento do ID via Generator e Trigger
CREATE GENERATOR GEN_FUNCIONARIO_ID;

SET TERM ^ ;
CREATE TRIGGER TRG_FUNCIONARIO_BI FOR FUNCIONARIO
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ID IS NULL OR NEW.ID = 0) THEN
    NEW.ID = GEN_ID(GEN_FUNCIONARIO_ID, 1);
END^
SET TERM ;

-- Índices de Otimização
CREATE INDEX IDX_FUNC_CPF ON FUNCIONARIO(CPF);
CREATE INDEX IDX_FUNC_NOME ON FUNCIONARIO(NOME);
CREATE INDEX IDX_FUNC_EMAIL ON FUNCIONARIO(EMAIL);
CREATE INDEX IDX_FUNC_CAMISETA ON FUNCIONARIO(TAMANHO_CAMISETA);
CREATE INDEX IDX_FUNC_CALCADO ON FUNCIONARIO(TAMANHO_CALCADO);

```

---

## ⚙️ Como Executar o Projeto

### Pré-requisitos

1. Servidor **Firebird 2.5 ou 3.0 (32 bits)** instalado na máquina host.
2. Copiar/configurar a DLL do cliente Firebird (`fbclient.dll` ou `gds32.dll` 32 bits) no caminho do executável ou em `C:\Windows\SysWOW64`.

### Passos

1. Execute o script `database/SCRIPT_DB.sql` na sua ferramenta de preferência (ex: **IBExpert** ou **FlameRobin**) para criar a estrutura da tabela `FUNCIONARIO` e seus geradores.
2. Abra o arquivo de projeto `DassBrindes.dpr` no **Delphi 2010**.
3. No `DataModule` (`uDMConnection.pas`), ajuste o caminho absoluto do parâmetro `Database` no componente `TSQLConnection` para apontar para o seu arquivo `.fdb`.
4. Compile e execute a aplicação (`F9`).

---

## ✨ Funcionalidades Principais

* **Filtros Multicritério:** Pesquisa rápida no `DBGrid` por CPF, Nome, E-mail, Tamanho de Camiseta ou Calçado.
* **Validação de CPF com Módulo 11:** Algoritmo que calcula os dois dígitos verificadores do CPF antes de submeter ao banco, impedindo gravações inconsistentes.
* **Validação de Faixa de Valores:** Restrição dos tamanhos de camiseta aceitos (`PP`, `P`, `M`, `G`, `GG`, `XG`) e calçados (entre 34 e 48).
* **Interface Modal:** Tela de edição/cadastro em janela separada com tratamento de memória e mensagens amigáveis ao usuário (`ShowModal`, `try...finally`).
* **Função Valida Conexão:** Função para validar a conexão com o banco de dados, apresenta o status no frame principal.
