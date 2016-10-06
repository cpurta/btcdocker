# btcdocker

Docker image for running a full node for the mining of bitcoin using the btcd (golang) implementation.

## Building the image

To build the image, first make sure that the docker daemon is running:

```
$ docker-machine status <machine>
```

Once the machine is running it is as simple as running the `docker build` command with the tag that you want:

```
$ docker build -t btcdocker:<tag> .
```

## Running a full node instance

Let's start running a full node by starting a interactive btcdocker container, and we will have to start the
btcd implementation and configure our wallet so that we can collect payments for running a full node.

```
$ docker run -it -p 8333:8333 -p 8334:8334 --rm --name btcdocker --entrypoint bash btcdocker:<tag>
```

You will now be in the running docker container and all we will need to do is start our full node and wallet with
our wallet name and password.

 - Run the following command to start btcd:
```
btcd -u rpcuser -P rpcpass
```
 - Run the following command to create a wallet:
```
btcwallet -u rpcuser -P rpcpass --create
```
 - Run the following command to start btcwallet:
```
btcwallet -u rpcuser -P rpcpass
```

## LICENSE
MIT
