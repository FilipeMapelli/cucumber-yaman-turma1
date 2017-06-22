#language: pt

@clientes
Funcionalidade: Cadastro de clientes
    Sendo um usuário com perfil Admin
    Posso cadastrar meus clientes
    Para adminitrar meu negócio e lançar faturas e cobranças

Cenario: Usuário deve estar logado
    * acesso a página de clientes

Esquema do Cenario: Cadastrar um novo cliente
    
    Dado que eu tenho um novo cliente do <tipo>
    Quando faço o cadastro desse cliente
    Então vejo esse cliente na lista

    Exemplos:
    | tipo        |
    | "Prime"     |
    | "Exclusivo" |
    | "Gold"      |
    | "Platinum"  |

