git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip install -r requirements.txt
sudo python setup.py install
cd ..
go get -u github.com/tomnomnom/assetfinder
go get github.com/ffuf/ffuf
go get -u github.com/tomnomnom/httprobe
git clone https://github.com/m4ll0k/takeover.git
cd takeover
sudo python3 setup.py install
cd ..
go get github.com/tomnomnom/waybackurls
go get github.com/hakluke/hakrawler
