#curl -X POST -u max:mulesoft --data-binary @casc_env.yaml -H "Content-Type: text/yaml" http://localhost:8080/configuration-as-code/apply



#11c671440368324a9ac30f9a3b0fdd7fb4


#CRUMB=$(curl -u max:mulesoft -s 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
#echo $CRUMB



curl -v -X POST -L --user max:11c671440368324a9ac30f9a3b0fdd7fb4 --data-binary @casc_env.yaml -H "Content-Type: text/yaml" http://localhost:8080/configuration-as-code/apply


#curl  -v -X POSTPOST -u max:mulesoft -H "$CRUMB" http://localhost:8080/job/2_AUTO_CATALOG_APIs/build



#curl -X POST -L --user max:11c671440368324a9ac30f9a3b0fdd7fb4 http://localhost:8080/job/2_AUTO_CATALOG_APIs/build