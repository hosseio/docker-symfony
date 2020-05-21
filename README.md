## Docker with symfony application skeleton

#### Prerequisites
* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/install/)
* [Make](https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_2.html)

the following shows the commands

    > make help

    usage: make <command>

    commands:
        start       - start the application containers
        stop        - stop the application containers
        clean       - stop running containers and remove them
        bash        - execute bash inside the app container
        install     - install php dependencies using composer
        update      - update php dependencies using composer
        test        - run tests

to start the project lets

    > make start

to execute tests

    > make test

#### Author

* [Jose Ortiz](https://github.com/hosseio)
