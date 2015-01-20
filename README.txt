# You will need to upgrade jQuery version on your Jahia.

# To do this, go to assets deployed module

  cd webapps/ROOT/modules/assets/javascript/

# Backup old librairies

  mv jquery.js jquery-1.6.2.js
  mv jquery.min.js jquery-1.6.2.min.js

# Then get the lastest version

  wget http://code.jquery.com/jquery-1.11.2.js -O jquery.js
  wget http://code.jquery.com/jquery-1.11.2.min.js -O jquery.min.js

# then edit jquery.jahia.js  and change jqXHR.isResolved() to jqXHR.state() == 'resolved'

  sed -i.bak "s/jqXHR.isResolved\(\)/jqXHR.state\(\) == \'resolved\'/g" jquery.jahia.js

