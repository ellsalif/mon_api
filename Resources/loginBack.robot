*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  DatabaseLibrary
Resource  variable.robot

*** Keywords ***
Verifier que l'utilisateur existe dans la BD
    connect to database using custom params  pymysql  database='demo', user='root', password='', host='localhost'
    row count is equal to x  select id from users where username = '${USERNAME}' and password= md5('${PASSWORD}')  1

Authentifier utilisateur dans l'application
    create session  session3     ${WEBSITE_LINK1}
    ${response}=  Get On Session  session3   /  login.php?username=${USERNAME}&password=${PASSWORD})
    ${jsondata} =  Set Variable  ${response.json}
    log  ${jsondata}
    Should Be Equal As Strings  ${response.status_code}  200
    Should Be Equal As Strings  ${jsondata()['message']}  Successfully Login!


Supprimer utilisateur de la BD
    connect to database using custom params  pymysql  database='demo', user='root', password='', host='localhost'
    execute sql string   DELETE FROM users WHERE username = '${USERNAME}' and password = md5('${PASSWORD}')
    disconnect from database

Authentifier utilisateur inexistant dans l'application
    create session  session4   ${WEBSITE_LINK1}
    ${response} =  Get  request  session4  login.php?username=${USERNAME}&password=${PASSWORD}
    ${jsondata} =  Set Variable  ${response.json}
    Should Be Equal As Strings  ${response.status_code}  200
    Should Be Equal As Strings  ${response.json()['message']}  Invalid Username or Password!
    



