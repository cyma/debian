#!/bin/bash
# This script generates a service to change mac address every time the system boots.

# Check sudo privileges
if [[ "${UID}" -ne 0 ]]
then
  echo 'Permission denied. Run again with sudo privileges' >&2
  exit 1
fi

create_file()
{
  echo 'Creating file >> /etc/systemd/system/changemac@.service'
  echo ''
  echo '[Unit]' >> /etc/systemd/system/changemac@.service
  echo 'Description=changes mac for %I' >> /etc/systemd/system/changemac@.service
  echo 'Wants=network.target' >> /etc/systemd/system/changemac@.service
  echo 'Before=network.target' >> /etc/systemd/system/changemac@.service
  echo 'BindsTo=sys-subsystem-net-devices-%i.device' >> /etc/systemd/system/changemac@.service
  echo 'After=sys-subsystem-net-devices-%i.device' >> /etc/systemd/system/changemac@.service
  echo '' >> /etc/systemd/system/changemac@.service
  echo '[Service]' >> /etc/systemd/system/changemac@.service
  echo 'Type=oneshot' >> /etc/systemd/system/changemac@.service
  echo 'ExecStart=/usr/bin/macchanger -r %I' >> /etc/systemd/system/changemac@.service
  echo 'RemainAfterExit=yes' >> /etc/systemd/system/changemac@.service
  echo '' >> /etc/systemd/system/changemac@.service
  echo '[Install]' >> /etc/systemd/system/changemac@.service
  echo 'WantedBy=multi-user.target' >> /etc/systemd/system/changemac@.service
  echo ''
}

enable_service()
{
  # Show available interfaces
  ip a | grep ': <' | awk -F ':' '{print $1, $2}'
  echo ''
  # Ask for the user interface name
  read -p 'Enter interface name: ' INTERFACE_NAME
  # Confirm interface name
  read -p "Confirm enabling service for interface ${INTERFACE_NAME} [Y/n] " USER_CONFIRMATION
  echo "${USER_CONFIRMATION}"
  if [[ ( "${USER_CONFIRMATION}" != "y" )  && (( "${USER_CONFIRMATION}" != "Y" )) ]]
  then
    echo 'Operation canceled'
    exit 1
  else
    # Enable service
    echo "changemac@${INTERFACE_NAME}.service"
    sudo systemctl enable "changemac@${INTERFACE_NAME}.service"
  fi
}

# Run
if [[ -f '/etc/systemd/system/changemac@.service' ]]
then
  echo ''
  echo '1 - Exit'
  echo '2 - Enable service for other interface'
  echo ''
  read -p 'File already exists. Select option: ' MENU_OPTION
  case "${MENU_OPTION}" in
    1)
      exit 1
      ;;
    2)
      enable_service
      ;;
    *)
      echo 'Incorrect input. Exiting program.' >&2
      exit 1
      ;;
  esac
else
  create_file
  enable_service
fi
