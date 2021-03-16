Tested on ubuntu 20.04

git clone https://gitlab.com/mariusz.franciszczak/mf.git

**To run on the system, docker and docker-compose must be installed**  
1.[install docker ubuntu](https://docs.docker.com/compose/install)  
2.[install docker-compose ubuntu](https://docs.docker.com/compose/install)  
2.[install docker win 10](https://docs.docker.com/docker-for-windows/install/)

## Nie wykonuj http://localhost:8050/; http://localhost:8050/?lp=webinar !!!!!!!!!!!!

##  Commands:
    - "docker-compose build" (first command)  
    - "docker-compose up" (second command to start docker and after building the container  
    - "docker ps" (list of current containers)  
    - "docker exec -it mfMVC bash" (entering the container command line (the name of mfMVC can be changed before running in docker-compose.yml))  
           Note: All commands are executed in the directory where docker-compose.yml is located



### He put together
[mafio69](mailto:mf1969@gmail.com?subject=[GitHub]%20Docker%20Repo)

Notatki:
1. Zrób to co powyżej
2. Skopiuj _**.env_example**_ i zapisz w tym samym katalogu pod nazwą _**.env**_
3. Załaduj bazę z pliku _**main/sql/ccfound.sql**_
4. uruchom w przeglądarce http://localhost:8050/?lp=webinar
5. Jeśli nie ma ładnej strony coś poszło nie tak, zacznij od nowa punkt po punkcie

Uwaga: w razie konfliktów portów, nazwy bazy danych ... jest mozliwość zmian wartośći w pliku _**.env**_ w pliku _**.env_example**_ nic nie zmieniamy 
katalog z apką to main.
 

## Links:
    phpadmin  http://localhost:8052/  
    app http://localhost:8050/  