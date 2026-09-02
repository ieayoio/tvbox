
find . -name "*.json" -exec sed -i 's@"https\([^"]*\)\?raw\.githubusercontent\.com@"https://gh-proxy.org/https://raw.githubusercontent.com@g' {} \;
