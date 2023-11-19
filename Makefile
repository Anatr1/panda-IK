# ------- USER-DEFINED TARGETS ------- #
# create here your custom targets. All the targets here shall be safe to manipulate and delete, since they are not
# part of any automatic build: they shall be called only from the developer, for developing purposes.
# Notice: they can include and execute some of the default targets below.

# Here is an example:
# exampleTarget: configure clean generate
#	echo "example" &&\ <- add &&\ to concatenate shell commands
#	ls -l

.PHONY: build

#This special target is invoked on "make" command (with no args). Feel free to edit it.

#DEPRECATED
#This target sets up the docker container. Notice: This kind of commands (make targets with docker build/run commands inside)
# shall ONLY be used by the developer for testing the docker container creation, and NEVER be called by automated processes!
docker-build:
	sudo docker build .

# ------- PROTECTED TARGETS ------- #
# Do not edit the below targets unless you REALLY know what you are doing.
# They are part of github actions and "standard" DIANA Software commands.
# They the failure of these targets could compromise automatic build and actions.
#If you need to add custom targets, just create one in the upper section!
configure:
	cd utils &&\
	bash configure.sh &&\
	cd ..

clean:
	rm -rf build

#Genrate build directory, configures files.
generate: clean
	mkdir build &&\
	cd build &&\
	cmake .. &&\
	cd ..

# builds locally, as debug
build:
	cd build &&\
	cmake --build . --config debug &&\
	cd ..

# builds locally, as release
release:
	cd build &&\
	cmake --build . --config Release &&\
	cd ..

# Installs in system as service
install:
	cd build &&\
	sudo cmake --build . --target install --config Release &&\
	bash DIANA_SetupInstallManifest.sh "/usr/local/diana/sys/manifests"

# Creates documentation.
#If build directory doesn't exist will build. otherwise will not build and only generate d ocumentation.
docs:
	if [ -d build ]; then doxygen build/Doxyfile && xdg-open docs/html/index.html &>/dev/null; else make generate && doxygen build/Doxyfile && xdg-open docs/html/index.html &>/dev/null ;fi

#Runs the GTest/Ctest suite over the project
test:
	cd build &&\
	make test

uninstall:
	sudo bash build/DIANA_uninstall.sh
