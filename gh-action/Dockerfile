FROM nyholm/roave-bc-check:stable

LABEL "com.github.actions.name"="NYHOLM-roave-bc-check"
LABEL "com.github.actions.description"="roave-bc-check"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/Nyholm/roave-bc-check-docker"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Tobias Nyholm <tobias.nyohlm@gmail.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
