/// <reference types="cypress" />

describe('tarefas', ()=> {

    it('Deve criar uma nova Terefa', () => {

        const taskName = 'Ler um Livro de QA'

        cy.removeTaskByName(taskName)
        
        cy.createTask(taskName)

        cy.contains('main div p', taskName)
            .should('be.visible')

    })

    it('Não deve permitir tarefa duplicada', () => {

        const task = {
            name : 'Estudar Javascript',
            is_done: false
        }

        cy.removeTaskByName(task.name)

        cy.postTask(task)

        cy.createTask(task.name)

        cy.get('.swal2-html-container')
            .should('be.visible')
            .should('have.text', 'Task already exists!')



    })

    it.only('Campo Obrigatorio', ()=> {
        cy.createTask()

        cy.isRequired('This is a required field')
    })
})