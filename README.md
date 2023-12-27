## Docker File Creation and execution
### Manual Container creation process. If tar downloaded, skip to docker load line
### You can also put epic binary in same folder (that files unzipped into) named epic-node and run Make

:$ sudo docker pull ubuntu:20.04
:$ sudo docker run -it --name epic-dock ubuntu:20.04 bash

/# <- *inside running container*
/# apt update 
/# apt -y install libncurses5 libncursesw5 zlib1g screen locales nano
/# mkdir /epic

(:$ ) <- run these from another terminal with container running
(:$ sudo docker cp foundation.json epic-dock:/epic/foundation.json)
(:$ sudo docker cp epic-server.toml epic-dock:/epic/epic-server.toml)
(:$ sudo docker cp entrypoint.sh epic-dock:/root/entrypoint.sh)
(:$ sudo docker cp epic-node epic-dock:/root/epic-node)

/# chmod +x /root/entrypoint.sh 
/# chmod +x /root/epic-node

(:$ sudo docker commit --change='ENTRYPOINT ["/root/entrypoint.sh"]' epic-dock epic-node
(:$ sudo docker save -o epic-docker.tar epic-node)
(:$ sudo docker stop epic-dock)
(:$ sudo docker rm epic-dock) *remove build container (no entrypoint)*

:$ sudo docker load < epic-docker.tar (if downloaded tar file and not created with commit)

* Image epic-node ready to run as container with entrypoint
:$ sudo docker run --name epic-node -d epic-node

* Check node running
:$ sudo docker logs -f epic-node (<ctrl>C to exit)

* Interact with running container
:$ sudo docker exec -it epic-node bash
root@epic-node:/# screen -r server-node (attach to screen running EPIC node)
<ctrl>A then D to detach from screen and back to root@epic-node:
root@epic-node:/# exit (to leave Docker)
/# exit

* Stop/Start Container
:$ sudo docker stop epic-node
:$ sudo docker start epic-node

* Create crontab to restart every other day (add to end of crontab file w/o {} <ctrl>X-Y to save)
:$ crontab -e {5 1 */2 * * sudo docker stop epic-node && sleep 15 && sudo docker start epic-node}


