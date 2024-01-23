/// <reference types="cypress" />

describe('tarefas', ()=> {

    it('Deve fazer login com sucesso', () => {

        const taskname = 'Ler um Livro de QA'

        cy.request({
            url: 'http://localhost:3333/helper/tasks',
            method: 'DELETE',
            body: {
                name : taskname
            }
        }).then(response => {
            expect(response.status).to.eq(204)
        })
        
        cy.visit('http://localhost:8080')

        cy.get('input[placeholder="Add a new Task"]')
            .type(taskname)

        cy.contains('button', 'Create').click()

        cy.contains('main div p', taskname)
            .should('be.visible')

    })

    it.only('Não deve permitir tarefa duplicada', () => {

        const task = {
            name : 'Estudar Javascript',
            is_done: false
        }

        cy.request({
            url: 'http://localhost:3333/helper/tasks',
            method: 'DELETE',
            body: {
                name : task.name
            }
        }).then(response => {
            expect(response.status).to.eq(204)
        })

        cy.request({
            url: 'http://localhost:3333/tasks',
            method: 'POST',
            body: task
        }).then(response => {
            expect(response.status).to.eq(201)
        })

        cy.visit('http://localhost:8080')

        cy.get('input[placeholder="Add a new Task"]')
            .type(task.name)

        cy.contains('button', 'Create').click()

        cy.get('.swal2-html-container')
            .should('be.visible')
            .should('have.text', 'Task already exists!')



    })
})