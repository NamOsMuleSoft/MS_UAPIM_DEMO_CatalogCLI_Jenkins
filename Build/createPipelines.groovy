job('000_FetchAllPipelines') {
  scm {
    git {
      remote {
        url ('https://github.com/mulesoft-consulting/MS_UAPIM_CI_CD_DSL.git')
        credentials('NamOsMuleSoftGIT')
      }
    }
  }
  steps {
    dsl {
      external('**/*.groovy')
      removeAction('DELETE')
    }
  }
}