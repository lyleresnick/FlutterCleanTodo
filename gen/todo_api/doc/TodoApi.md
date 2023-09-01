# todo_api.api.TodoApi

## Load the API package
```dart
import 'package:todo_api/api.dart';
```

All URIs are relative to *https://todo-backend-lyle.fly.dev/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTodo**](TodoApi.md#createtodo) | **POST** /todo | Add a new todo
[**deleteTodo**](TodoApi.md#deletetodo) | **DELETE** /todo/{todoId} | Deletes a todo
[**getAllTodos**](TodoApi.md#getalltodos) | **GET** /todo | get all todos
[**getTodoById**](TodoApi.md#gettodobyid) | **GET** /todo/{todoId} | Find todo by ID
[**updateTodo**](TodoApi.md#updatetodo) | **PUT** /todo/{todoId} | Updates a todo


# **createTodo**
> TodoResponse createTodo(todoParams)

Add a new todo

Create a new todo

### Example
```dart
import 'package:todo_api/api.dart';

final api_instance = TodoApi();
final todoParams = TodoParams(); // TodoParams | Create a new todo

try {
    final result = api_instance.createTodo(todoParams);
    print(result);
} catch (e) {
    print('Exception when calling TodoApi->createTodo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **todoParams** | [**TodoParams**](TodoParams.md)| Create a new todo | 

### Return type

[**TodoResponse**](TodoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTodo**
> deleteTodo(todoId)

Deletes a todo

delete a todo

### Example
```dart
import 'package:todo_api/api.dart';

final api_instance = TodoApi();
final todoId = todoId_example; // String | Todo id to delete

try {
    api_instance.deleteTodo(todoId);
} catch (e) {
    print('Exception when calling TodoApi->deleteTodo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **todoId** | **String**| Todo id to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllTodos**
> List<TodoResponse> getAllTodos()

get all todos

get all todos

### Example
```dart
import 'package:todo_api/api.dart';

final api_instance = TodoApi();

try {
    final result = api_instance.getAllTodos();
    print(result);
} catch (e) {
    print('Exception when calling TodoApi->getAllTodos: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<TodoResponse>**](TodoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTodoById**
> TodoResponse getTodoById(todoId)

Find todo by ID

Returns a single todo by id

### Example
```dart
import 'package:todo_api/api.dart';

final api_instance = TodoApi();
final todoId = todoId_example; // String | ID of todo to return

try {
    final result = api_instance.getTodoById(todoId);
    print(result);
} catch (e) {
    print('Exception when calling TodoApi->getTodoById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **todoId** | **String**| ID of todo to return | 

### Return type

[**TodoResponse**](TodoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTodo**
> TodoResponse updateTodo(todoId, todoParams)

Updates a todo



### Example
```dart
import 'package:todo_api/api.dart';

final api_instance = TodoApi();
final todoId = todoId_example; // String | ID of todo
final todoParams = TodoParams(); // TodoParams | Create a new todo

try {
    final result = api_instance.updateTodo(todoId, todoParams);
    print(result);
} catch (e) {
    print('Exception when calling TodoApi->updateTodo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **todoId** | **String**| ID of todo | 
 **todoParams** | [**TodoParams**](TodoParams.md)| Create a new todo | 

### Return type

[**TodoResponse**](TodoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

