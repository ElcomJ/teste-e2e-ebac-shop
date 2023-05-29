import checkoutPage from "../support/page_objects/checkout.page";

context('Exercicio - Testes End-to-End - Fluxo de pedido', () => {

    beforeEach(() => {
        cy.visit('/')
    });

    it('Deve fazer um pedido na loja Ebac Shop de ponta a ponta', () => {
        cy.fixture('perfil').then(dados => {
            cy.get('.icon-user-unfollow').click()
            cy.login(dados.usuario, dados.senha)

            cy.order('Abominable Hoodie', 'XS', 'Blue', '3')
        });

        cy.fixture('checkout').then(dados => {
           checkoutPage.editarDadosCheckout(
               dados.firstName,
               dados.lastName,
               dados.company,
               dados.country,
               dados.address,
               dados.addressNumber,
               dados.city,
               dados.state,
               dados.postcode,
               dados.phone,
               dados.email,
               dados.comments
           )
        });
    });

})