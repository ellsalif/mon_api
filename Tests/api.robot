*** Setting ***
Resource  ../Resources/signupBack.robot
Resource  ../Resources/variable.robot
Resource  ../Resources/loginBack.robot


*** Test Cases ***
Inserer un user dans la BD
    [Tags]  First
    signupBack.Verifier que l'utilisateur n'existe pas dans la BD
    signupBack.Inscription de l'utilisateur par une requet post
    signupBack.Verifier que l'utilisateur est ajouté une fois dans la bd
Inseretion du meme user
    [Tags]  Second
    signupBack.Inscription du meme user via la requete post
    signupBack.Verifier que le user n'est pas dupliquer dans la DB

Authentifier utilisateur
    [Tags]  Third
    loginBack.Verifier que l'utilisateur existe dans la BD
    loginBack.Authentifier utilisateur dans l'application

Supprimer utilisateur
    [Tags]   Fourth
     loginBack.Supprimer utilisateur de la BD
     loginBack.Authentifier utilisateur inexistant dans l'application

