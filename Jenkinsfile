node {
	try {
		stage('step1') {
			sh 'env'
		}
		stage('step2') {
			sh 'ls -la'
		}
		stage('step3') {
			sh 'echo "good job"; exit 1'
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
									subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
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
