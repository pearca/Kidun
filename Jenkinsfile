node {
	try {
		stage('checkout') {
		checkout([$class: 'GitSCM',
    branches: [[name: '*/master']],
    doGenerateSubmoduleConfigurations: false,
    extensions: [[$class: 'CleanCheckout']],
    submoduleCfg: [],
    userRemoteConfigs: [[credentialsId: 'git-credentials', url: 'https://github.com/KYosief/Kidun.git']]])
		}
		stage('step2') {
			sh 'echo "$WORKSPACE"'
		}
		stage('step3') {
			sh echo "fail"; exit 1'
		}
	}
	catch (exc) {
		echo 'I failed'
	}
	finally {
      def currentResult = currentBuild.result ?: 'SUCCESS'
      if (currentResult == 'UNSTABLE') {
          echo 'This will run only if the run was marked as unstable'
					mail  to: 'kidane.yosief@pearson.com',
								subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
								body: "Something is wrong with ${env.BUILD_URL}"
      }
			if (currentResult == 'SUCCESS') {
					echo 'This will run only if the run was marked as stable'
					mail  to: 'kidane.yosief@pearson.com',
								subject: "Great Pipeline: ${currentBuild.fullDisplayName}",
								body: "Bingo with ${env.BUILD_URL}"
			}
      def previousResult = currentBuild.previousBuild?.result
      if (previousResult != null && previousResult != currentResult) {
          echo 'This will run only if the state of the Pipeline has changed'
          echo 'For example, if the Pipeline was previously failing but is now successful'
					mail  to: 'kidane.yosief@pearson.com',
								subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
								body: "${env.BUILD_URL} is back to normal"
      }
	}
}
