#language:pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Posso fazer login no sistema
    Para cadastrar meus clientes e lançar faturas

@logout @smoke
Cenario: Admin faz login

    Dado que eu tenho um usuário
      | email | kato.danzo@qaninja.com.br |
      | senha | secret                    |
    Quando faço login
    Então vejo o dashboard com a mensagem:
    """
    Bem Vindo Kato Danzo!
    """

@tentativa    
Esquema do Cenario: Tentativa de login

    Dado que eu tenho um usuário <user> e senha <password>
    Quando faço login
    Então vejo a mensagem <message>

    Exemplos:
        |user|password|message|
        |"kato.danzo@qaninja.com.br"|"123456"|"Incorrect password"|
        |"kato.danzo@qaninja.net"|"secret"|"User not found"|
        |"kato.danzo*qaninja.com.br"|"secret"|"Please enter your e-mail address."|

