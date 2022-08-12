#!/bin/bash
# This script install dependencies

# Check sudo privileges
if [[ "${UID}" -ne 0 ]]
then
  echo "Permission denied. Run again with sudo privileges" >&2
  exit 1
fi

# Update Upgrade
update_upgrade()
{
  sudo apt-get update && sudo apt-get upgrade -y
}


# LaTeX
TEX_LIST="texlive texlive-fonts-extra texlive-science texlive-pictures texlive-latex-extra \
          texlive-lang-english texlive-lang-spanish texlive-bibtex-extra \
          texlive-font-utils latexmk"

# Install
install_packages()
{
    sudo apt-get install -y ${TEX_LIST}
}

# Run
update_upgrade
install_packages
