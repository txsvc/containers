VERSION = 1.0
BUILD_NAMESPACE = ccollections

#
# all the local podman builds ...
#

.PHONY: build-all
build-all: base-container base-golang

.PHONY: base-container
base-container:
	podman build -f base-container/Dockerfile -t ccollections/base-container:${VERSION}-1 .
	podman tag ccollections/base-container:${VERSION}-1 ccollections/base-container:latest

.PHONY: base-golang
base-golang:
	podman build -f base-golang/Dockerfile -t ccollections/base-golang:${VERSION}-1 base-golang
	podman tag ccollections/base-golang:${VERSION}-1 ccollections/base-golang:latest

#
# build on OpenShift
#

.PHONY: create-namespace
create-namespace:
	oc new-project ${BUILD_NAMESPACE} --display-name="Container collections" --description="A collection of containers to build more specialised containers"

.PHONY: build-all-openshift
build-all-openshift: create-namespace
	oc policy add-role-to-user system:image-builder \
		system:serviceaccount:${BUILD_NAMESPACE}:builder \
		--namespace=openshift
	oc apply -f image_streams.yaml -n openshift
	oc apply -f base-container/build_config.yaml -n ${BUILD_NAMESPACE}
	oc apply -f base-golang/build_config.yaml -n ${BUILD_NAMESPACE}

.PHONY: cleanup
cleanup:
	oc delete build --all -n ${BUILD_NAMESPACE}
	oc delete pod --field-selector=status.phase==Succeeded -n ${BUILD_NAMESPACE}
	oc delete pod --field-selector=status.phase==Succeeded -n ${BUILD_NAMESPACE}
