# Проект чат бот
---

Основа проекта - чат бот, написанный на python. Приложение работает внутри docker-контейнера в кластере kubernetes. CI/CD инструмент - Jenkins, развёрнутый внутри docker-машины.

---

Проект выполнен на Ubunty 22.04. Используемое ПО: 
- [docker](https://docs.docker.com/engine/install/ubuntu/)
- [docker-machine](https://gdevillele.github.io/machine/install-machine/)
- [vagrant](https://developer.hashicorp.com/vagrant/docs/installation)

---

##### Развёртывание Jenkins:
1. Создать docker машину для развёртывания на ней Jenkins - запустить `docker-machine/create.sh` и выполнить команду указынную в конце. Указать ip в следующем шаге. 
Для удаления - `docker-machine/delete.sh`.
2. Настроить переменные окружения (файл `jenkins/.env`):
- JENKINS_URL=http://<ip_addr>:8080/
- JENKINS_ADMIN_ID=admin
- JENKINS_ADMIN_PASSWORD=<your_password>
3. Настроить credentials:
- PAT для *Dockerhub* - `$HOME/.docker/dockerhub_pat`
- ssh ключ для *github* - `$HOME/.ssh/jenkins-git`
4. Развернуть Jenkins: `jenkins/jenkins.sh` с флагом `up`. Использовать флаг `down` чтобы свернуть.
5. Для логина использовать `JENKINS_ADMIN_ID` и `JENKINS_ADMIN_PASSWORD`.
##### Развёртывание инфраструктуры
Запустить `cd vagrant && vagrant up`.
В результате выполнения команды будет создана виртуальная машина с установленными на ней инструментами:
- **docker** (container runtime для запуска контейнеризированного приложения)
- **kind** (для создания kubernetes кластера)
- **kubectl** (инструмент командной строки для управления кластерами Kubernetes)