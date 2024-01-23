describe('home', () => {
  it('webapp deve estar online', () => {
    cy.visit('http://localhost:3000')

    cy.title().should('eq', 'Mark85 by QAx')
  })
})