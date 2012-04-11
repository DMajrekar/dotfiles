curl --silent "http://weather.yahooapis.com/forecastrss?p=UKXX0513&u=c" | grep -E '(Current Conditions:|C<BR)' | tail -n1 | sed -e 's/<BR \/>//' -e 's/\(.*\), \(.*\) C$/\2˚C/'


