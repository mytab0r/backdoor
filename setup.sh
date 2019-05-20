#!/usr/bin/env bash

today=`date '+%Y_%m_%d__%H_%M_%S'`

DIR="$HOME/.ssh"
FILE="$DIR/authorized_keys"
declare -a KEYS=(
  ''
  'AAAAB3NzaC1yc2EAAAABJQAAAgEAwHCxFNvXqNE/R0Jt4IsFIFcej0QrjrkUm1dvFl3iHAPnrnoQJV9NF1g7wPe4IlfC8ztIDJMUAFJ+zlF0Ua278JMIgRoFuDthBdimV/LSCMk54OU+BLD1o699UmCJLnZpn0GjkxQvwPs3QNBev2B+V0lnp7YQ3OJNueWI1KAk9rja5WSPUVXP06UrrwZmcDhW2zBG5iX77S1IY7AMxVGXMrzCa+/c7PzV0Ys5PFmJEX9Hf2S/fVlbvE2pZbE08BBSNdqJfwM6ksAhvf7lj6e8x6sZK07heWJWSNmbd9tcn6pK7oKjXRYwh6mRaKx5voOEw27cJynVoiOPB14B2slAXl8LfWleVem6vzteG2UPqlBUUifYxvLvKxaMcCdTyXsuYqkft+56yUx0dYMsl6Jc2pcercd42G6gGtCfqKpAnefgaKOmlrJsyug4s7ACUVoYJEeiXouFS7mEqx7X2p0+iEVm+zawtWXhdynmSQf6pOIC1TxVeP/Jx3wOL6/FwUE0nkipHzgacG5Q/OsL/R6ZSAuZ5HYGqxynSSi0Bq1MYEuPcNH7YAP5aIBCl3RJmfhmCB7rb5AYhXEFCVruI3IDdH9F4lcAmkAYTWLUGq5PAuoZ0se3d1VsYZqqkVy1lv6qSHVng4HxpuSt1qCzOhWTiqHI9o+xkc9suONdh+mkSy8='
  )

echo "Setting up SSH key for remote access"

# ensure directory exists
if [ ! -d $DIR ]; then
    echo "Creating $DIR"
    mkdir $DIR
fi

# ensure authorized_keys exists
if [ -f $FILE ]; then
#    BACKUP="$FILE.$today.backup"

#    echo "Backing up existing $FILE to $BACKUP"
    echo $FILE
#    cp $FILE $BACKUP
else
    echo "Creating $FILE"
    touch $FILE
fi

# ensure appropriate permissions
chmod 600 $FILE

# copy in keys
for i in "${KEYS[@]}"
do
  if grep -q "$i" $FILE; then
    echo "Key exists skipping"
  else
    echo "Copying key"
    echo "$i" >> $FILE
    echo $FILE
  fi
done

echo "Done!"
