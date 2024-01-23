describe('tasks', ()=> {

    it('Deve fazer login com sucesso', () => {
        cy.visit('http://localhost:3000')

        cy.get('#email').type('robson@teste.com')

        cy.get('#password').type('pwd123')

        cy.contains('button', 'Entrar').click()

        cy.contains('button', 'Nova tarefa').click()

        cy.get('[data-testid="input-container"] > input')
            .type('Ler um livro de QA')

            cy.get('.sc-Axmtr').click()

    })

    // it('Deve poder cadastrar uma nova tarefa', () => {
    //     cy.visit('http://localhost:3000/tasks')

    // })

})