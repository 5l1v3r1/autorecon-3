dom=$1
echo $dom

sublist3r -d $dom -o sublister.txt
assetfinder $dom > assetfinder.txt
ffuf -w subdomains-1000.txt -u FUZZ.$dom -o ffuf.txt
cat sublister.txt assetfinder.txt ffuf.txt | sort | uniq > subdomains.txt
rm sublister.txt assetfinder.txt ffuf.txt
cat subdomains.txt | httprobe --prefer-https > subdomain.txt
Sub0ver -l subdomains.txt -o takeover.txt -timeout 5 && rm subdomains.txt &
cat subdomain.txt | waybackurls > waybackurl.txt
cat subdomain.txt | hakrawler -depth 5 -outdir hakrawler.txt
cat hakrawler.txt waybackurl.txt > urls.txt
rm hakrawler.txt waybackurl.txt
cat urls.txt | ./kxss > xss.txt
cat urls.txt | sort | uniq | grep =http > openredirect.txt
mkdir $dom
mv openredirect.txt xss.txt urls.txt takeover.txt subdomain.txt -t /$dom/
