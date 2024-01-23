describe('home', () => {
  it('webapp deve estar online', () => {
    cy.visit('http://localhost:8080')

    cy.title().should('eq', 'Mark85 by QAx')
  })
})