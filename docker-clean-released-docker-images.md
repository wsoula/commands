```
echo Delete drillinginfo images that are not go-service-base-image or tesseract and have a versioned tag
docker rmi $(docker images | grep drillinginfo | grep -v go-service-base-image | grep -v tesseract | grep -e "drillinginfo\/\w*-\w*-*\w*-*\w*-*\w*-*\w*-*\w*\\+\s*[0-9]\\+.[0-9]\\+.[0-9]\\+" | awk '{print $1 ":" $2}' | xargs -n1 echo)
```
