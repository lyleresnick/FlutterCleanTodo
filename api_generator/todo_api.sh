openapi-generator generate -i todo_api.yaml -g dart -o ../gen/todo_api --additional-properties=pubName=todo_api
cd ../gen/todo_api/lib
sed "s/'yyyy-MM-dd'/\"yyyy-MM-dd'T'HH:mm:ss'Z'\"/g" api.dart >api.dart.out
mv api.dart.out api.dart