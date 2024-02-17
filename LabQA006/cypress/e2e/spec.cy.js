describe('Suite de teste no site Starbugs', () => {
  it('Pedido feito com Sucesso', () => {

    let subtitle = 'Nós levamos até você! '

    let pedido = 'Complete o seu Pedido'

    let resposta = 'Uhull! Pedido confirmado'

    cy.visit('https://starbugs-qa.vercel.app/')

    cy.contains('h1 span', subtitle).should('be.visible')

    cy.contains('.coffee-name', 'Expresso Gelado').parent().find('button[class=buy-coffee]').click()

    cy.contains('h1', pedido).should('be.visible')

    cy.get('input[name=cep]').type('04534011')

    cy.get('input[type=button][value="Buscar CEP"]').click()

    cy.get('input[name=number]').type('1000')

    cy.get('input[name=complement]').type('Apto 22')

    cy.get('input[type=radio][name=paymentMethod]').parent().contains('label[for=debit]', 'Cartão de Débito').click()

    cy.contains('button[type=submit]', 'Confirmar pedido').click()

    cy.contains('h1', resposta).should('be.visible')
  })
})