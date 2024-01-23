/// <reference types="cypress" />

describe('tarefas', ()=> {

    it('Deve fazer login com sucesso', () => {
        cy.request({
            url: 'http://localhost:3333/helper/tasks',
            method: 'DELETE',
            body: {
                name : 'Ler um Livro de QA'
            }
        }).then(response => {
            expect(response.status).to.eq(204)
        })
        
        cy.visit('http://localhost:8080')

        cy.get('input[placeholder="Add a new Task"]')
            .type('Ler um Livro de QA')

        cy.contains('button', 'Create').click()

        cy.contains('main div p', 'Ler um Livro de QA')
            .should('be.visible')

    })

})