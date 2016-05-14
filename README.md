``git clone https://github.com/nikit-cpp/docker-gradle.git``

``cd docker-gradle``

``docker build -t nikit007/gradle .``

``docker run --rm -v ~/.gradle:/root/.gradle -v ~/workspace/application:/usr/bin/app:rw --name=my-super-app nikit007/gradle clean build``
