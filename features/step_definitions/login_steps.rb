#encoding: utf-8


Dado(/^que eu tenho um usuário$/) do |table|
  @email = table.rows_hash['email']
  @password = table.rows_hash['senha']
end

Dado(/^que eu tenho um usuário "([^"]*)" e senha "([^"]*)"$/) do |email, senha|
  @email = email
  @password = senha
end

Quando(/^faço login$/) do
  @login.load
  @login.fazer_login(@email,@password) 
end

Então(/^vejo o dashboard com a mensagem:$/) do |message|
  expect(@dash.title.text).to eql message
end
 
Então(/^vejo a mensagem "([^"]*)"$/) do |message|
  expect(@login.alert.text).to include message
end

