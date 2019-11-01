
build
```bash
docker build . -t benchu1k/t1:1.0
```
windows
```bash
docker run -dit --name fazhihao -v "E:\dockers\fazhihao\data\www\front:/home/www/front" -v "E:\dockers\fazhihao\data\www\LegalDailyCMS:/home/www/LegalDailyCMS" -p 8083:80 benchu1k/t1:1.0
```
osx
```bash
docker run -dit --name fazhihao -v ~/my-docs/env/dockers/fazhi1/data/www/front:/home/www/front -v ~/my-docs/env/dockers/fazhi1/data/www/LegalDailyCMS:/home/www/LegalDailyCMS -p 8083:80 benchu1k/t1:1.0
```