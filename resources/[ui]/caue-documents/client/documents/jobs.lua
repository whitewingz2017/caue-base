Config["Documents"]["Jobs"] = {}

Config["Documents"]["Jobs"]["police"] = {
    {
        headerTitle = "PERMISSÃO ESPECIAL PARA ESTACIONAR",
        headerSubtitle = "Permissão para estacionar sem limites.",
        elements = {
            { label = "Nome titular", type = "input", value = "", can_be_emtpy = false },
            { label = "Sobrenome titular", type = "input", value = "", can_be_emtpy = false },
            { label = "Válido até", type = "input", value = "", can_be_empty = false },
            { label = "Informações", type = "textarea", value = "O titular recebeu a permissão especial até o final da validade deste documento.", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "PORTE DE ARMA",
        headerSubtitle = "Porte de arma de alguma arma especifica.",
        elements = {
            { label = "Nome Titular", type = "input", value = "", can_be_emtpy = false },
            { label = "Sobrenome Titular", type = "input", value = "", can_be_emtpy = false },
            { label = "Válido até", type = "input", value = "", can_be_empty = false },
            { label = "Informações", type = "textarea", value = "O titular recebeu a permissão do porte de armas até o final da validade deste documento.", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "FORMULÁRIO DE FICHA LIMPA",
        headerSubtitle = "Formulário de ficha limpa.",
        elements = {
            { label = "Nome Titular", type = "input", value = "", can_be_emtpy = false },
            { label = "Sobrenome Titular", type = "input", value = "", can_be_emtpy = false },
            { label = "Válido até", type = "input", value = "", can_be_empty = false },
            { label = "Registro", type = "textarea", value = "O titular recebeu um formulário no qual declara que o mesmo é de ficha limpa com validade até o final deste documento.", can_be_emtpy = false, can_be_edited = false },
        },
    },
}

Config["Documents"]["Jobs"]["ems"] = {
    {
        headerTitle = "RELATÓRIO MÉDICO - PATOLOGIA",
        headerSubtitle = "Relatório médico oficial fornecido por um patologista.",
        elements = {
            { label = "NOME DO SEGURADO", type = "input", value = "", can_be_emtpy = false },
            { label = "SOBRENOME DO SEGURADO", type = "input", value = "", can_be_emtpy = false },
            { label = "VÁLIDO ATÉ", type = "input", value = "", can_be_empty = false },
            { label = "NOTAS MÉDICAS", type = "textarea", value = "O CIDADÃO SEGURADO MENCIONADO FOI TESTADO POR UM OFICIAL DE SAÚDE E DETERMINADO SAUDÁVEL SEM CONDIÇÕES DE LONGO PRAZO DETECTADAS. ESTE RELATÓRIO É VÁLIDO ATÉ A DATA DE VENCIMENTO MENCIONADA.", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "RELATÓRIO MÉDICO - PSICOLOGIA",
        headerSubtitle = "Relatório médico oficial fornecido por um psicólogo.",
        elements = {
            { label = "NOME DO SEGURADO", type = "input", value = "", can_be_emtpy = false },
            { label = "SOBRENOME DO SEGURADO", type = "input", value = "", can_be_emtpy = false },
            { label = "VÁLIDO ATÉ", type = "input", value = "", can_be_empty = false },
            { label = "NOTAS MÉDICAS", type = "textarea", value = "O CIDADÃO SEGURADO MENCIONADO FOI TESTADO POR UM FUNCIONÁRIO DE SAÚDE E DETERMINADO MENTALMENTE SAUDÁVEL PELOS MENORES PADRÕES DE PSICOLOGIA. ESTE RELATÓRIO É VÁLIDO ATÉ A DATA DE VENCIMENTO MENCIONADA.", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "RELATÓRIO MÉDICO - OFTALMOLOGISTA",
        headerSubtitle = "Relatório médico oficial fornecido por um oftalmologista.",
        elements = {
            { label = "NOME DO SEGURADO", type = "input", value = "", can_be_emtpy = false },
            { label = "SOBRENOME DO SEGURADO", type = "input", value = "", can_be_emtpy = false },
            { label = "VÁLIDO ATÉ", type = "input", value = "", can_be_empty = false },
            { label = "NOTAS MÉDICAS", type = "textarea", value = "O CIDADÃO SEGURADO MENCIONADO FOI TESTADO POR UM FUNCIONÁRIO DE SAÚDE E DETERMINADO COM UMA VISÃO SAUDÁVEL E PRECISA. ESTE RELATÓRIO É VÁLIDO ATÉ A DATA DE VENCIMENTO MENCIONADA.", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "AUTORIZAÇÃO DE USO DE MACONHA",
        headerSubtitle = "Licença oficial de uso de maconha medicinal para cidadãos.",
        elements = {
            { label = "NOME DO SEGURADO", type = "input", value = "", can_be_emtpy = false },
            { label = "SOBRENOME DO SEGURADO", type = "input", value = "", can_be_emtpy = false },
            { label = "VÁLIDO ATÉ", type = "input", value = "", can_be_empty = false },
            { label = "NOTAS MÉDICAS", type = "textarea", value = "AO CIDADÃO SEGURADO MENCIONADO É CONCEDIDO, DEPOIS DE SER EXAMINADO CUIDADOSAMENTE POR UM ESPECIALISTA DA SAÚDE, PERMISSÃO DE USO DE MACONHA POR MOTIVOS MÉDICOS NÃO DIVULGADOS. A QUANTIDADE LEGAL E PERMITIDA QUE UM CIDADÃO PODE RETER NÃO PODE SER MAIS DE 100g.", can_be_emtpy = false, can_be_edited = false },
        },
    },
}

Config["Documents"]["Jobs"]["doj"] = {
    {
        headerTitle = "CONTRATO DE SERVIÇOS JURÍDICOS",
        headerSubtitle = "Contrato de prestação de serviços jurídicos prestado por um advogado.",
        elements = {
            { label = "NOME DO CIDADÃO", type = "input", value = "", can_be_emtpy = false },
            { label = "SOBRENOME DO CIDADÃO", type = "input", value = "", can_be_emtpy = false },
            { label = "VÁLIDO ATÉ", type = "input", value = "", can_be_empty = false },
            { label = "INFORMAÇÕES", type = "textarea", value = "ESTE DOCUMENTO É PROVA DE REPRESENTAÇÃO LEGAL E COBERTURA DO CIDADÃO MENCIONADO. OS SERVIÇOS JURÍDICOS SÃO VÁLIDOS ATÉ A DATA DE VENCIMENTO MENCIONADA.", can_be_emtpy = false },
        },
    },
}