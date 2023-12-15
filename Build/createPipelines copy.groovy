// createPipelines.groovy

create_pipeline("0_SET_ENV", "/var/jenkins_home/demos/setEnv/pipeline.jenkins")
create_pipeline("1_CREATE_FLEX", "/var/jenkins_home/demos/createFlex/pipeline.jenkins")
create_pipeline("2_AUTO_CATALOG_APIs", "/var/jenkins_home/demos/autoCatalog/pipeline.jenkins")
create_pipeline("3_AUTO_PROXY_API", "/var/jenkins_home/demos/autoProxy/pipeline.jenkins")


// a method that creates a basic pipeline with the given parameter name
def create_pipeline(String name, String pipelineFile) {
    pipelineJob(name) {
        //parameters {
        //    stringParam("CLUSTER_ID", "cluster_id", "your description here")
        //    stringParam("OPENSHIFT_ADMINSTRATION_BRANCH", "develop", "your description here")
        //  }
        definition {
            cps {
                sandbox(true)
                String fileContents = new File(pipelineFile).text
                script(fileContents)
            }
        }
    }
}