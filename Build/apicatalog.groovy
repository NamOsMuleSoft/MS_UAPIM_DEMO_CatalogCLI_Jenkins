// apicatalog.groovy

create_pipeline("API CATALOG")

// a method that creates a basic pipeline with the given parameter name
def create_pipeline(String name) {
    pipelineJob(name) {
        definition {
            cps {
                sandbox(true)
                String fileContents = new File('/var/jenkins_home/pipeline.jenkins').text
                script(fileContents)
            }
        }
    }
}