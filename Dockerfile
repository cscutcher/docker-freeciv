from        debian:latest

run     apt-get update && apt-get install -y freeciv-server
run     useradd freeciv
run     bash -c "( [[ -d /freeciv ]] || mkdir /freeciv ) && chown -R freeciv:freeciv /freeciv"

user    freeciv
entrypoint ["/usr/games/freeciv-server"]
cmd ["--saves", "/freeciv", "--port", "5556"]

expose 5556
volume ["/freeciv"]
