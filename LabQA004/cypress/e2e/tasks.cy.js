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

    it.only('Não deve permitir tarefa duplicada', () => {
        cy.request({
            url: 'http://localhost:3333/helper/tasks',
            method: 'DELETE',
            body: {
                name : 'Estudar Javascript'
            }
        }).then(response => {
            expect(response.status).to.eq(204)
        })

        cy.request({
            url: 'http://localhost:3333/tasks',
            method: 'POST',
            body: {
                name : 'Estudar Javascript',
                is_done: false
            }
        }).then(response => {
            expect(response.status).to.eq(201)
        })

        cy.visit('http://localhost:8080')

        cy.get('input[placeholder="Add a new Task"]')
            .type('Estudar Javascript')

        cy.contains('button', 'Create').click()

        cy.get('.swal2-html-container')
            .should('be.visible')
            .should('have.text', 'Task already exists!')



    })
})