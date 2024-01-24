/// <reference types="cypress" />

describe('tarefas', () => {
    
    context('cadastro', () => {
        it('Deve criar uma nova Terefa', () => {

            const taskName = 'Ler um Livro de QA'

            cy.removeTaskByName(taskName)

            cy.createTask(taskName)

            cy.contains('main div p', taskName)
                .should('be.visible')

        })

        it('Não deve permitir tarefa duplicada', () => {

            const task = {
                name: 'Estudar Javascript',
                is_done: false
            }

            cy.removeTaskByName(task.name)

            cy.postTask(task)

            cy.createTask(task.name)

            cy.get('.swal2-html-container')
                .should('be.visible')
                .should('have.text', 'Task already exists!')



        })

        it('Campo Obrigatorio', () => {
            cy.createTask()

            cy.isRequired('This is a required field')
        })
    })

    context('atualizar', () => {
        it('Deve concluir uma terefa', () => {
            const task = {
                name: 'Estudar Javascript',
                is_done: false
            }

            cy.removeTaskByName(task.name)
            cy.postTask(task)

            cy.visit('/')

            cy.contains('p', task.name)
                .parent()
                .find('button[class*=ItemToggle]')
                .click()

            cy.contains('p', task.name)
                .should('have.css', 'text-decoration-line', 'line-through')


        })
    })

    context('remover', () => {
        it('Deve excluir uma terefa', () => {
            const task = {
                name: 'Fazer Compras',
                is_done: false
            }

            cy.removeTaskByName(task.name)
            cy.postTask(task)

            cy.visit('/')

            cy.contains('p', task.name)
                .parent()
                .find('button[class*=ItemDelete]')
                .click()

            cy.contains('p', task.name)
                .should('not.exist')


        })
    })
})