Config["Documents"]["public"] = {
    {
        headerTitle = "DECLARAÇÃO DE VERACIDADE",
        headerSubtitle = "Declaração de veracidade do cidadão.",
        elements = {
            { label = "CONTEÚDO DA DECLARAÇÃO", type = "textarea", value = "", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "TESTEMUNHO DA TESTEMUNHA",
        headerSubtitle = "Testemunho oficial.",
        elements = {
            { label = "DATA DE OCORRÊNCIA", type = "input", value = "", can_be_emtpy = false },
            { label = "CONTEÚDO DO TESTEMUNHO", type = "textarea", value = "", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "DECLARAÇÃO DE TRANSFERÊNCIA DE VEÍCULO",
        headerSubtitle = "Declaração de transferência de veículo para outro cidadão.",
        elements = {
            { label = "NÚMERO DA PLACA", type = "input", value = "", can_be_emtpy = false },
            { label = "NOME DO CIDADÃO", type = "input", value = "", can_be_emtpy = false },
            { label = "PREÇO ACORDADO", type = "input", value = "", can_be_empty = false },
            { label = "OUTRAS INFORMAÇÕES", type = "textarea", value = "", can_be_emtpy = true },
        },
    },
    {
        headerTitle = "DECLARAÇÃO DA DÍVIDA PARA O CIDADÃO",
        headerSubtitle = "Declaração oficial de dívida para outro cidadão.",
        elements = {
            { label = "NOME DO CREDOR", type = "input", value = "", can_be_emtpy = false },
            { label = "SOBRENOME DO CREDOR", type = "input", value = "", can_be_emtpy = false },
            { label = "VALOR DEVIDO", type = "input", value = "", can_be_empty = false },
            { label = "DATA DE VENCIMENTO", type = "input", value = "", can_be_empty = false },
            { label = "OUTRAS INFORMAÇÕES", type = "textarea", value = "", can_be_emtpy = true },
        },
    },
    {
        headerTitle = "DECLARAÇÃO DE LIQUIDAÇÃO DE DÍVIDA",
        headerSubtitle = "Declaração de quitação de dívida de outro cidadão.",
        elements = {
            { label = "NOME DO DEVEDOR", type = "input", value = "", can_be_emtpy = false },
            { label = "SOBRENOME DO DEVEDOR", type = "input", value = "", can_be_emtpy = false },
            { label = "VALOR DA DÍVIDA", type = "input", value = "", can_be_empty = false },
            { label = "OUTRAS INFORMAÇÕES", type = "textarea", value = "DECLARO QUE O CIDADÃO MENCIONADO EFETUOU UM PAGAMENTO COM O VALOR DA DÍVIDA MENCIONADO", can_be_emtpy = false, can_be_edited = false },
        },
    },
}