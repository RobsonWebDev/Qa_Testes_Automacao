describe('template spec', () => {
  it('passes', () => {

    let subtitle = 'Nós levamos até você! '

    cy.visit('https://starbugs-qa.vercel.app/')

    cy.contains('h1 span', subtitle).should('be.visible')

    cy.contains('.coffee-name', 'Expresso Gelado').parent().find('button[class=buy-coffee]').click()

    cy.contains('h1', 'Complete o seu Pedido').should('be.visible')

    cy.get('input[name=cep]').type('04534011')

    cy.get('input[type=button][value="Buscar CEP"]').click()
  })
})