# Montgomery County Linux Users Group CI/CD Demo

This project demonstrates a simple Continuous Integration / Continuous Delivery (CI/CD) Pipeline using the following tools:

* Go Git Server (GOGS) for version control
* Jenkins 2.x as the CI/CD Server
* Apache HTTPD to host a simple html page to demonstrate deployment. This will be our development Server

Each of these tools will be run inside of a separate docker container.

## How to start the containers
This project requires that you have the docker container management engine installed on your system.

Be sure to review the ci-cd-demo.sh script before running it and make any adjustments!

Run the ci-cd-demo.sh script as root, e.g.

        sudo ./ci-cd-demo.sh

## Stepping through the demo

1. Navigate to the Apache HTTPD page (http://localhost) to view the deployed index.html page

2. Navigate to http://localhost:8080 to go to the jenkins page.

3. click the *cicd-demo* project and note the pipeline has run once

4. Log into GOGS (http://localhost:3000) as the user *developer* with password of *password*

5. Click the *cicd-demo* project on the right

6. Click the *index.html* file, then click the pencil icon to update it

7. Change the background color from *gray* to *blue*

8. Click the *Commit Changes* button

9. Go back to the Jenkins page and wait for a new pipeline instance to begin

10. Once the *Deploy to Development Server* stage is done, go back to the  Apache HTTPD page, refresh it, and note the background colore has changed

11. Go back to the jenkins page, click the box under "Deploy to Test Server"

12. When prompted to deploy to test, click "Proceed".  Note that nothing happens because you are not an authorized Users

13. In the upper right, click login and login as the user admin with password of password

14. Try to deploy to test again and it will proeed. Deploy to production as well to complete the demo
