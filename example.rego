package rbac

# Say we have request that We have environment and according to that Environment we have scan
# Dev: only Sonarqube scan approved is enough
# QA: Sonarqube and QGtest (both should be approved)
# Verify: Sonarqube and QGtest and coverity (all three should be approved)
# Prod: All the 4 scan should be approved

default allow = false

allow = true {  
   input.environment == "DEV"         
   input.sonarqube == "APPORVED"       
}

allow = true {   
   input.environment == "QA"              
   input.sonarqube == "APPORVED" 
   input.QGtest == "APPORVED"     
}

allow = true {   
   input.environment == "Prod"                  
   input.sonarqube == "APPORVED" 
   input.QGtest == "APPORVED"
   input.coverity == "APPORVED"
   input.blackduck == "APPORVED"      
}

allow = true {   
   input.environment == "verify"              
   input.sonarqube == "APPORVED"  
   input.QGtest == "APPORVED"
   input.coverity == "APPORVED"      
}

# opa eval --data test.rego --input input.json --profile --format=raw 'data.rbac.allow'
