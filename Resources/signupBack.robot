*** Setting ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  DatabaseLibrary
Resource  variable.robot

*** Keywords ***
Verifier que l'utilisateur n'existe pas dans la BD
    connect to database using custom params  pymysql  database='demo', user='root', password='', host='localhost'
    row count is 0  select id from users where username = '${USERNAME}' and password= md5('${PASSWORD}')
Inscription de l'utilisateur par une requet post
    create session  session1  ${WEBSITE_LINK}
    ${data} =  Create Dictionary  username=${USERNAME}  password=${PASSWORD}
    ${headers} =  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${response} =  post on session  session1  signup.php  data=${data}  headers=${headers}
    ${json} =  Set Variable  ${response.json}
    log  ${json}
    Should Be Equal As Strings  ${response.status_code}  200

Verifier que l'utilisateur est ajouté une fois dans la bd
    connect to database using custom params  pymysql  database='demo', user='root', password='', host='localhost'
    row count is equal to x  select id from users where username = '${USERNAME}' and password= md5('${PASSWORD}')  1
Inscription du meme user via la requete post
    create session  session2  ${WEBSITE_LINK}
    ${data} =  Create Dictionary  username=${USERNAME}  password=${PASSWORD}
    ${headers} =  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${response} =  post on session  session2  signup.php  data=${data}  headers=${headers}
    ${jsondata} =  Set Variable  ${response.json}
    Should Be Equal As Strings  ${response.status_code}  200
    Should Be Equal As Strings  ${response.json()['message']}  Username already exists!

Verifier que le user n'est pas dupliquer dans la DB
     connect to database using custom params  pymysql  database='demo', user='root', password='', host='localhost'
     row count is equal to x  select id from users where username = '${USERNAME}' and password= md5('${PASSWORD}')  1








