*** Settings ***
Documentation    Cenários de teste do Cadastro do usuário

Resource         ../resources/pages/CadastroPage.resource
Resource         ../resources/pages/compontents/Alert.resource
Resource        ../resources/base.resource
Library          FakerLibrary
Library          Collections

Test Setup       Start Session

*** Test Cases ***
Deve cadastrar um novo usuário com sucesso
    ${name}      FakerLibrary.Name
    ${email}     FakerLibrary.Email
    ${password}  Set Variable    teste123

    Abrir Página de Cadastro
    Preencher Formulário    ${name}    ${email}    ${password}
    Submeter Formulário

    # Validação da mensagem de sucesso
   # Mensagem de Alerta Deve Conter    Cadastro realizado com sucesso


Não deve cadastrar usuário duplicado
    [Tags]      dup

    ${name}       FakerLibrary.Name
    ${email}      Set Variable    duplicado@gmail.com
    ${password}   Set Variable    teste123

    # Primeiro cadastro (usuário inicial)
    Abrir Página de Cadastro
    Preencher Formulário    ${name}    ${email}    ${password}
    Submeter Formulário

    # Segunda tentativa com o mesmo email
    Abrir Página de Cadastro
    Preencher Formulário    ${name}    ${email}    ${password}
    Submeter Formulário

    # Validação da mensagem de erro
   Mensagem de Alerta Deve Conter    Este email já está sendo usado
