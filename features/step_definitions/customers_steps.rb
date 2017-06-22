#encoding: utf-8

Dado(/^acesso a página de clientes$/) do
  @login.load
  @login.fazer_login('kato.danzo@qaninja.com.br', 'secret')
  @nav.customers_link.click

  ## removendo todos os registros da table
#   sleep(5)
#   page.all('table tbody tr').each do |tr|
#     tr.find('.fa-trash-o').click
#     find('button[data-bb-handler=success]').click
#   end
end

Dado(/^que eu tenho um novo cliente do "([^"]*)"$/) do |tipo| 

  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  @user = OpenStruct.new(
            :nome => name,
            :telefone => "119#{Faker::Number.number(8)}",
            :email => Faker::Internet.free_email(name),
            :tipo => tipo,
            :obs => Faker::Lorem.paragraph
          )
end

Quando(/^faço o cadastro desse cliente$/) do
  @customers.save(@user)
end

Então(/^vejo esse cliente na lista$/) do
  @customers.search_field.set @user.email
  @customers.search_button.click

  expect(@customers.view.size).to eql 1
  expect(@customers.view.first.text).to include @user.nome
  expect(@customers.view.first.text).to include @user.email
  expect(@customers.view.first.text).to include @user.telefone

end

##delete
Dado(/^que eu tenho um cliente cadastrado$/) do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  @user = OpenStruct.new(
            :nome => name,
            :telefone => "119#{Faker::Number.number(8)}",
            :email => Faker::Internet.free_email(name),
            :tipo => 'Prime',
            :obs => Faker::Lorem.paragraph
          )
  @customers.load
  @customers.wait_for_view
  @customers.save(@user)
end

Quando(/^removo este cliente$/) do
  @customers.search_field.set @user.email
  @customers.search_button.click
  @customers.view.first.find('span[class*=trash').click
  @customers.wait_for_delete_yes
  @customers.delete_yes.click
end  


Então(/^esse cliente não deve ser exibido na lista$/) do
  expect(@customers.search_alert.text).to eql "\"#{@user.email}\" não foi encontrado."
end