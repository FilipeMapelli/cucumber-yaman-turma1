#language:pt

@delete
Funcionalidade: Remover clientes
    Sendo um usuário
    Posso remover meus clientes que não possuem fatura

@login @smoke
Cenario: Remover cliente com sucesso

    Dado que eu tenho um cliente cadastrado
    Quando removo este cliente
    Então esse cliente não deve ser exibido na lista

