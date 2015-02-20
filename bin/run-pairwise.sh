if [ "X$1X" = "XX" ] ; then
    echo "$0 [ p | v ]" ; exit
else
    if [ "X$1X" == "XpX" ] ;then
        TYPEN="price"
    else # "v"
        TYPEN="volume"
    fi
fi     

grep -v "^#" ./support/enter-${TYPEN}-info.raw > enter-${TYPEN}-info.feature

egrep -v "^#" ./support/${TYPEN}_inputs.yml |sed -e "s,],]~,g" -e "s,$, ," \
| tr -d "\012" |tr "~" "\012" > /tmp/$$_o_${TYPEN}_inputs.yml

pairwise /tmp/$$_o_${TYPEN}_inputs.yml >> enter-${TYPEN}-info.feature
rm -f /tmp/$$_o_${TYPEN}_inputs.yml
