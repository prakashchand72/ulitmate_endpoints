# ulitmate_endpoints
To get All possible endpoint for single target not wild card

## Note 
```
> dont be script kiddie change the code according to the requirement
> may be you will like to change the wordlist for fuzzing change on code
> make sure you have all the tools ready and change the path of the tool accordingly
> dont rely on tool check each output something gospider can breakout in that cat you can use grep get url ony
gospider -s https://astute72.vercel.app --js -d 2 --sitemap --robots -w -r -t 30 | grep -Eo 'https?://([a-z0-9]+[.])*astute72.vercel.app.*'
- can use mantra tool to find exposure on js file [ grep js from gospider and pass to mantra ]
```
## For ease

```php
(Thu Dec-12 3:50:45am)-(CPU 29.0%:0:Net 13)-(astute@fedora:~/tools/development)-(768K:14)
> ln -s ultimate_endpoint.sh ultimate_endpoint
(Thu Dec-12 3:50:58am)-(CPU 29.0%:0:Net 13)-(astute@fedora:~/tools/development)-(772K:15)
> chmod +x ultimate_endpoint 
(Thu Dec-12 3:51:07am)-(CPU 29.0%:0:Net 13)-(astute@fedora:~/tools/development)-(772K:15)
> sudo cp ultimate_endpoint /usr/bin
[sudo] password for astute: 
(Thu Dec-12 3:51:29am)-(CPU 29.0%:0:Net 13)-(astute@fedora:~/tools/development)-(772K:15)
> ultimate_endpoint target.com
```
