# poc-s3-presigned-url
Implementation of a file upload to s3 using presigned urls

# Demo
<div align="center">
  <img src="./.github/demo presigned url.gif" align="center" width="1200" />
</div>

### Commands
To access localstack container:
```
docker-compose exec localstack bash
```

To list all items on files bucket:
```
aws --endpoint-url=http://localhost:4566 s3 ls s3://files
```


### Notes
- Always certificate about the bucket permission. In our scenario, we don't need a public repo, all files uploaded can be downloaded by aws interface.


### Links

- This article shows how to configure a real s3 service
https://medium.com/@aidan.hallett/securing-aws-s3-uploads-using-presigned-urls-aa821c13ae8d

- This video describes how create aws resources and IAM polices
https://www.youtube.com/watch?v=yGYeYJpRWPM
