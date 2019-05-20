#!/usr/bin/env bash

today=`date '+%Y_%m_%d__%H_%M_%S'`

DIR="$HOME/.ssh"
FILE="$DIR/authorized_keys"
declare -a KEYS=(
  ''
  'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgB1a4zP2yNmnZP/Mpayd9wcvI3MbMa/7IhMJ9vMNbUpqftMmk9qJ4j7v0Y1TDKBkFNI/Ua8hHOFgfuuj8i8S0nxPjZ1KSyMSS1oP9urNaJ1FpgQHfFf+VZK9LZ5A4OBsbKqZH4uCKFJDAf2+WerDC7CEHCnnIF55+z2gB1f2FmA2K4o0rptF8JmjooAv8iUYzRw9NVtAScMEufywgeJ28yzYqSnstAA6TRFlyNsMyawj7b6xKRXw1//LrYZvoz9F0nFZzgLqxlkqx0lhb99GOauWdflwj6/xjNY6CbpifH/LOWH1bhRsrt29ftNgeL5G9PT83vYQpIQYVEuNN6/7EIkPsTkI+z7dZ+mDP/O8EIZljvY0XpiutjB6itJfWxy9ogSjp6OGxB1Hpa+Itmizdsb2d7uevTW1NWmw5opDELu3JYPus+Sjk7Ih6/niQHaUXz3qjf7rlQQSqCn6COzP9C3WJoDSkm3wsQYZZHkXCCcKqAiTCl4744/BzhlJMN0NAT2M/y2espJSvlLDRkTCAE2hCDPUoqBjF3UapaxoBUUFUjbXIsMaUTSE6pHJMWcYSYIzRVYoD8Y9f6nldgtZN3xLBB3DbwovFbPuWtCUgpvCx70Biy7QLmsXTwUnc8WhEBkB+Wz/9g3qJIcc1cRyra1a4m/xYUSUP522ojtefWKJw=='
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
