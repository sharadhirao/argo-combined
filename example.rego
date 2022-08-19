package rbac

# Say we have request that We have environment and according to that Environment we have scan
# Dev: only Sonarqube scan approved is enough
# Verify: Sonarqube and coverity should be approved
# Prod: All the 3 scan should be approved

default allow := false

allow if {   
   input.environment == "verify"              
   input.sonarqube == "APPROVED"    
   input.coverity == "APPROVED"     
}

allow = true {  
   input.environment == "DEV"         
   input.sonarqube == "APPROVED"       
}

allow = true {   
   input.environment == "Prod"                  
   input.sonarqube == "APPROVED" 
   input.coverity == "APPROVED"
   input.blackduck == "APPROVED"      
}
