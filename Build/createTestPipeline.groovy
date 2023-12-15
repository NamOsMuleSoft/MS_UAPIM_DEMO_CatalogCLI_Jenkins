// createPipelines.groovy

create_pipeline("0_DEBUG", "/var/jenkins_home/demos/debug/pipeline.jenkins")


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