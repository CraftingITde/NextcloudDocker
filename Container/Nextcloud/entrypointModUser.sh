#!/bin/bash

if [ ! -z "${USER_ID}" ]; then
    echo User: $USER_ID
    usermod -u $USER_ID www-data
fi

if [ ! -z "${GROUP_ID}" ]; then
    echo Group: $GROUP_ID 
    groupmod -g $GROUP_ID www-data
fi

if [ ! -z "${ADDITIONAL_GROUPS}" ]; then
    # Beispiel-Input: "1001:developers;1002:admins;1003:managers;"
    # Splitten des Eingabestrings in einzelne Gruppen
    IFS=';' read -ra groups <<<"$ADDITIONAL_GROUPS"

    # Durchlaufen jeder Gruppe im Format GROUP_ID:GROUP_NAME
    for group_info in "${groups[@]}"; do
        # Überprüfen, ob die Gruppe nicht leer ist (letztes Semikolon könnte eine leere Gruppe erzeugen)
        if [ -n "$group_info" ]; then
            # Splitten des GROUP_ID und GROUP_NAME
            IFS=':' read -r group_id group_name <<<"$group_info"

            # Prüfen, ob Gruppe bereits existiert
            if getent group "$group_name" >/dev/null 2>&1; then
                echo "Gruppe $group_name existiert bereits."
            else
                # Erstellen der Gruppe mit der angegebenen ID und dem Namen
                groupadd -g "$group_id" "$group_name"
                echo "Gruppe $group_name mit ID $group_id erstellt."
            fi

            # Benutzer der Gruppe hinzufügen
            usermod -aG "$group_name" www-data
            echo "Benutzer www-data wurde der Gruppe $group_name hinzugefügt."
        fi
    done
fi