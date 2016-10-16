node {

   stage('Checkout') { // for display purposes
      // Clone the code from GOGS
      git 'http://gogs-server:3000/developer/cicd-demo.git'
   }

   stage('Build') {
      echo "Building..."
      sleep 5
      echo "Done"
   }

   stage('Integration Tests') {
      echo "Running integration tests..."
      echo "Done"
   }

   stage('Deploy to Development Server') {
      echo "Deploying to development httpd server..."
      sh 'cp -fr * /var/htdocs'
      echo "Done"
   }

   stage('Deploy to Test Server') {
      timeout(time: 7, unit: 'DAYS') {
        input message: 'Do you want to deploy to Test?', submitter: 'admin'
      }

      echo "Deploying to test httpd server..."
      sleep 5
      echo "Done"
   }

   stage('Deploy to Production Server') {
      timeout(time: 7, unit: 'DAYS') {
        input message: 'Do you want to deploy to Production?', submitter: 'admin'
      }

      echo "Deploying to production server..."
      sleep 5
      echo "Done"
   }
}
