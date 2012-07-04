#!/bin/bash

DIR=`dirname $0`
cd $DIR
export DOTMACHOME=`pwd`

source $DOTMACHOME/bash/bash_install.sh
# source $DOTMACHOME/vim/install.bash

function writeBashProfile() {
  cat > $HOME/.bash_profile << EOF
#!/bin/bash
export DOTMACHOME="$DOTMACHOME"
source "$DOTMACHOME/dotfiles/bash_profile"
EOF
}

echo "#### Installing environment ####"
echo "dotmac home dir: $DOTMACHOME"

for file in `ls dotfiles`; do
  if [ $file == 'bash_profile' ]; then
    writeBashProfile
  else
    ln -s $DOTMACHOME/dotfiles/$file $HOME/.$file
  fi
done

configureBash
