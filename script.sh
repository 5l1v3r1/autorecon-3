dom=$1
echo $dom
mkdir $dom
sublist3r -d $dom -o $dom/sublister.txt
assetfinder $dom > $dom/assetfinder.txt
ffuf -w subdomains-1000.txt -u FUZZ.$dom -o $dom/ffuf.txt
cat $dom/sublister.txt $dom/assetfinder.txt $dom/ffuf.txt | sort | uniq > $dom/subdomains.txt
rm $dom/sublister.txt $dom/assetfinder.txt $dom/ffuf.txt
cat subdomains.txt | httprobe --prefer-https > $dom/subdomain.txt
takeover -l subdomains.txt -o $dom/takeover.txt
rm $dom/subdomains.txt
cat subdomain.txt | waybackurls > $dom/waybackurl.txt
cat subdomain.txt | hakrawler -depth 5 -outdir $dom/hakrawler.txt
cat hakrawler.txt waybackurl.txt | ./kxss > xss.txt
cat hakrawler.txt waybackurl.txt | sort | uniq | grep =http > openredirect.txt

