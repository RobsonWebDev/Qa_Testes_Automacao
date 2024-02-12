#language: pt

Funcionalidade: Catálogo de cafés
    Como um usuário do site, eu quero ver o catálogo de cafés na página principal
    Para que eu possa escolher e saber mais sobre os produtos disponíveis

Cenário: Acessar o catálogo de cafés na página principal

    Quando acesso a página principal de Starbugs
    Então eu devo ver uma lista de cafés disponíveis

Cenário: Iniciar a compra de um café

    Dado que estou na página principal da Starbugs
        E que desejo comprar o café "Expresso Gelado" 
        E que esse produto custa "R$ 9,99"
        E que o custo de entrega é de "R$ 10,00"
    Quando  inicio a compra desse item
    Então devo ver a página de Checkout com os detalhes do produtos
        E o valor total da compra deve ser "R$ 19,99"

Cenário: Café indisponível

    Dado que estou na página principal da Starbugs
        E que desejo comprar o café "Expresso Cremoso"
    Quando inicio a compra desse item
    Então devo ver um popup infomando que o produto está indisponível