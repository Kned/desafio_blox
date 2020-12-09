# Sobre este teste
Este teste é apresentado às pessoas que estão se candidatando às vagas de desenvolvimento para avaliar os quesitos técnicos.  
O código deve ser escrito utilizando a linguagem Ruby + framework Rails.
# Solução utilizada
 Escolhi a gem simplecallendar para fazer a parte de calendário da agenda.  
 A estrutura não é muito complexa, consiste em um calendário, que chamei de classrooms, que podem ser criados e deletados instâncias dele, cada classroom possui multiplos meetings que possuem uma validaçao em cima do horaráio da reunião com escopo da classroom, sendo assim impossibilitando a inserção de mais de uma meeting no mesmo horário e na mesma classroom.  
 A meeting por fim também está associada ao usuário logado, para que possa ser exibido o responsável da reunião na visualização da meeting. Alem disso eu omiti o botão para deletar a meeting caso o usuário logado não seja o responsável da meeting.  
 A autenticação foi feita usando o devise e roles não foram implementados, por uma questão de praticidade não implementei a confirmação de cadastro pelo devise.
# Passos para rodar a aplicação
- Primeiro altere o database.yml para as credenciais utilizadas em seu banco local
- $bundle install
- $rails db:create
- $rails db:migrate
- $rspec
- $rails s
# Possiveis melhorias
- Implementação de testes automatizados com cucumber  
- Implementação de roles para possibilitar administração do app  
# Heroku
https://serene-castle-62015.herokuapp.com/  
Basta criar um usuário e testar a aplicação
