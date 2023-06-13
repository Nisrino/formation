*** settings ***
Library  SeleniumLibrary
*** Variables ***
${nom1} =  "Nisreen"
${nom2} =  "Oscar"
${username} =  standard_user
${password} =  secret_sauce
${login} =  //*[@id="user-name"]
${motdepass} =  //*[@id="password"]
${clickbutton} =  //*[@id="login-button"]
${T_shirt} =  //*[@id="item_3_title_link"]/div
${Prix_Tshirtavant}=   //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
${Prix_Tshirtapres}=   //*[@id="cart_contents_container"]/div/div[1]/div[3]/div[2]/div[2]/div
${T_shirtPanier} =  //*[@id="item_3_title_link"]/div
${Addtocartebuttton} =  //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
${decouvrircartebutton} =  //*[@id="shopping_cart_container"]/a
${Checkout} =  //*[@id="checkout"]
${firstname} =     //*[@id="first-name"]
${myfirstname}=   Nisreen
${lastname} =  //*[@id="last-name"]
${mylastname} =  ALSALEH
${codepostal} =  //*[@id="postal-code"]
${mycodepostal} =  44200
${continuebutton} =  //*[@id="continue"]
${finishbutton} =  //*[@id="finish"]
${newusername} =  locked_out_user
${message d'erreur} =  //*[@id="login_button_container"]/div/form/div[3]/h3
${newusername1} =  ${EMPTY}
${newpassword1} =  ${EMPTY}
${message d'erreur1}=  //*[@id="login_button_container"]/div/form/div[3]/h3
*** Test Cases ***
Consulter les logs1 
   Log To Console  "mon premier message"
Consulter les logs2 
   Log To Console  "mon deuxieme message"
    Run Keyword And Continue On Failure   Should Be Equal   ${nom1}  ${nom2}
    Should Be Equal  2   2
Doit contenir
    Should Contain     "Bonjour oscar"  oscar
Ne Doit pas contenir 
    Should Not Contain    "Nisreen ALSALEH"    oscar
Doit commencer par
    Should Start With  Bonjour Nisreen  Bonjour
Ne Doit commencer par
    Should Not Start With  Bonjour Nisreen  Nisreen
Doit finir par
    Should End With  Bonjour Nisreen  Nisreen
Ne Doit finir par
    Should Not End With  Bonjour Nisreen  Bonjour
se connecter à Sauce Demo
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text  ${login}  ${username}
    Input Text  ${motdepass}  ${password}
    Click Button  ${clickbutton}
    ${nomavant} =  Get Text  ${T_shirt}
    ${prixavant}=  Get Text  ${Prix_Tshirtavant}
    Click Button  ${Addtocartebuttton}
    Click Element  ${decouvrircartebutton}
    ${nomapres} =  Get Text   ${T_shirtPanier}
    ${prixapres}=  Get Text  ${Prix_Tshirtapres}
    Should Be Equal   ${nomavant}  ${nomapres}
    Should Be Equal   ${prixavant}  ${prixapres}
    Click Button  ${Checkout}
    Input Text  ${firstname}  ${myfirstname}
    Input Text  ${lastname}  ${mylastname}
    Input Text  ${codepostal}  ${mycodepostal}
    Click Button  ${continuebutton}
    Capture Page Screenshot
    Click Button  ${finishbutton}
    sleep        50
    Close All Browsers
se connecter à Sauce Demo2
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text  ${login}  ${newusername}
    Input Text  ${motdepass}  ${password}
    Click Button  ${clickbutton}
    ${message-text}   set variable    Epic sadface: Sorry, this user has been locked out.
    ${message_erreur}=    Get Text   ${message d'erreur}
    Should Be Equal  ${message-text}  ${message_erreur}
    sleep    20
    Close All Browsers
se connecter à Sauce Demo3
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    #Input Text  ${login}  ${newusername1}
    Input Text  ${login}  ${username}
   # Input Text  ${motdepass}  ${password}
    Input Text  ${motdepass}  ${newpassword1}
    Click Button  ${clickbutton}
    ${message-text1}   set variable    Epic sadface: Password is required
    ${message_erreur1}=    Get Text   ${message d'erreur}
    Should Be Equal  ${message-text1}  ${message_erreur1}
    sleep    20
    Close All Browsers
Ouvrir google.com
    Open Browser    https://www.google.com/  chrome
    Maximize Browser Window

*** Keywords ***