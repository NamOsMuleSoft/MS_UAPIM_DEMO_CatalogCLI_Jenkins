This Repo will create a Jenkins docker for you

Pipelines will be fetched using a Monorepo DSL

INSTALL STEPS


1. Copy the Build/casc.yaml_template to Build/casc.yaml
2. edit the Build/casc.yaml with your own variables

- key: "organization"
        value: "<YOURORG>" => GET THAT FROM THE URL when you are connected to your org
      - key: "client_id"
        value: "<YOURCLIENTID>" => GET THAT FROM A CONNECTED APP you created with full rights on the organization and associated env
      - key: "client_secret"
        value: "<YOURCLIENTSECRET>" => GET THAT FROM A CONNECTED APP you created with full rights on the organization and associated env
      - key: "user_name"
        value: "<YOURUSER>" => YOUR ANYPOINT USER NAME
      - key: "user_password"
        value: "<YOURUSERPASSWORD>" => YOUR ANYPOINT USER PASSWORD
      - key: "user_id"
        value : "<YOURUSERID>" => YOUR ANYPOINT USER ID : Get That from ACCESS MANAGEMENT => list user => click on your user and get ID from URL
      - key: "env_id"
        value: "<YOURENVID>" =>YOUR ENV ID : Get that from API MANAGER=> switch to the desired env => Click the Information ICON
      - key: "host"
        value: "anypoint.mulesoft.com" =>YOUR ENV ID : Get that from API MANAGER=> switch to the desired env => Click the Information ICON
      - key: "giturl"
        value: "https://github.com/NamOsMuleSoft/UAPIM-demo"
      - key: "giturlAutoProxy"
        value: "https://github.com/NamOsMuleSoft/MS_UAPIM_AUTO_CATALOG_API"
      - key: "gitbranch"
        value: "main"
      - key: "flex_id"
        value: "<YOURFLEXID>"















https://www.jenkins.io/doc/book/installing/docker/
https://www.jenkins.io/doc/book/installing/docker/#setup-wizard




TO tag and push


docker tag myjenkins-blueocean ntonthat388/myjenkins-blueocean:tagname
docker push ntonthat388/myjenkins-blueocean:tagname



docker tag jenkins:jcasc2 ntonthat388/jenkins:jcasc2
docker push ntonthat388/jenkins:jcasc2




Hoow to get Env_id : https://help.mulesoft.com/s/article/How-to-get-the-Environment-ID