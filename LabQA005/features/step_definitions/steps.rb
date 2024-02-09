Quando('acesso a página principal de Starbugs') do
    visit 'https://starbugs.vercel.app/'
end
  
Então('eu devo ver uma lista de cafés disponíveis') do
    products = all('.coffee-item')
    expect(products.size).to be > 0
end