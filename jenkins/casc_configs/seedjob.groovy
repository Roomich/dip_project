folder('build') {
    description('<div style="border-radius:10px; text-align: center; font-size:120%; padding:15px; background-color: powderblue;">Build test deliver</div>')
}

pipelineJob('build/build_app') {
    description('<div style="border-radius:10px; text-align: center; font-size:120%; padding:15px; background-color: powderblue;">Build-test-deliver pipeline</div>')
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('Roomich/dip_project', 'ssh')
                        credentials('github_ssh')
                    }
                    branch('test')
                }
            }
            scriptPath('jobs/jenkinsfile-app')
        }
    }
}

pipelineJob('build/deploy_app') {
    description('<div style="border-radius:10px; text-align: center; font-size:120%; padding:15px; background-color: powderblue;">Build-test-deliver pipeline</div>')
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('Roomich/dip_project', 'ssh')
                        credentials('github_ssh')
                    }
                    branch('test')
                }
            }
            scriptPath('jobs/jenkinsfile-app')
        }
    }
}

pipelineJob('create_ssh_key') {
    description('<div style="border-radius:10px; text-align: center; font-size:120%; padding:15px; background-color: powderblue;">Build-test-deliver pipeline</div>')
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('Roomich/dip_project', 'ssh')
                        credentials('github_ssh')
                    }
                    branch('test')
                }
            }
            scriptPath('jobs/jenkinsfile-ssh')
        }
    }
}