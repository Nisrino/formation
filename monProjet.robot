*** settings ***

*** Variables ***
${nom1} =  "Nisreen"
${nom2} =  "Oscar"

*** Test Cases ***
Consulter les logs1 
   Log To Console  "mon premier message"
Consulter les logs2 
   Log To Console  "mon deuxieme message"
    Run Keyword And Continue On Failure   Should Be Equal   ${nom1}  ${nom2}
    Should Be Equal  2   2

*** Keywords ***