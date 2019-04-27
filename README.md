# mod_cluster-dockerhub (jota modification)

Based on [mod_cluster-dockerhub](https://github.com/Karm/mod_cluster-dockerhub) by [Karm](https://github.com/Karm) 

This is my modification of the original repo with my Dockerfile and mod_cluster.conf files. 

Why I created this fork? I intended to:

* Have my own customized Docker image
* Add an application VirtualHost in mod_cluster.conf configuration, so I can begin using this image with real apps deployed in backend application servers.


## Configuration

You can configure the `mod_cluster` parameters through following environment variables provided to `docker run` command:

* `MODCLUSTER_PORT` listening port (default: 6666)
* `MODCLUSTER_ADVERTISE` On/Off flag for `ServerAdvertise` (default: On)
* `MODCLUSTER_ADVERTISE_GROUP` Advertise address and port (default: 224.0.1.105:23364)
* `MODCLUSTER_NET` a [Require ip](http://httpd.apache.org/docs/trunk/mod/mod_authz_host.html) value for the listener (default: 172.)
* `MODCLUSTER_MANAGER_NET` a [Require ip](http://httpd.apache.org/docs/trunk/mod/mod_authz_host.html) value for the mod_cluster manager on path /mcm (default: value of MODCLUSTER_NET variable)

The defaults could work in your Docker environment.

## Example usage

### Build the custom image

	docker build -q --rm --tag=mod_cluster_jota .

### Run the container

You can modify the variables as you need, this is just an example:

	docker run -it --rm --net host --name mod_cluster-app1 \
	-e MODCLUSTER_PORT=6666 \
	-e MODCLUSTER_ADVERTISE=On \
	-e MODCLUSTER_NET=192.168.1 \
	-e MODCLUSTER_MANAGER_NET=192.168.1 \
	mod_cluster_jota

Check if it is working:

	curl 127.0.0.1:6666/mcm

To inspect the container use:

    docker exec -i -t mod_cluster-app1 bash
