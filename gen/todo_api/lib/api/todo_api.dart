//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TodoApi {
  TodoApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add a new todo
  ///
  /// Create a new todo
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [TodoParams] todoParams (required):
  ///   Create a new todo
  Future<Response> createTodoWithHttpInfo(TodoParams todoParams,) async {
    // ignore: prefer_const_declarations
    final path = r'/todo';

    // ignore: prefer_final_locals
    Object? postBody = todoParams;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Add a new todo
  ///
  /// Create a new todo
  ///
  /// Parameters:
  ///
  /// * [TodoParams] todoParams (required):
  ///   Create a new todo
  Future<TodoResponse?> createTodo(TodoParams todoParams,) async {
    final response = await createTodoWithHttpInfo(todoParams,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TodoResponse',) as TodoResponse;
    
    }
    return null;
  }

  /// Deletes a todo
  ///
  /// delete a todo
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] todoId (required):
  ///   Todo id to delete
  Future<Response> deleteTodoWithHttpInfo(String todoId,) async {
    // ignore: prefer_const_declarations
    final path = r'/todo/{todoId}'
      .replaceAll('{todoId}', todoId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Deletes a todo
  ///
  /// delete a todo
  ///
  /// Parameters:
  ///
  /// * [String] todoId (required):
  ///   Todo id to delete
  Future<void> deleteTodo(String todoId,) async {
    final response = await deleteTodoWithHttpInfo(todoId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// get all todos
  ///
  /// get all todos
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getAllTodosWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/todo';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// get all todos
  ///
  /// get all todos
  Future<List<TodoResponse>?> getAllTodos() async {
    final response = await getAllTodosWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<TodoResponse>') as List)
        .cast<TodoResponse>()
        .toList(growable: false);

    }
    return null;
  }

  /// Find todo by ID
  ///
  /// Returns a single todo by id
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] todoId (required):
  ///   ID of todo to return
  Future<Response> getTodoByIdWithHttpInfo(String todoId,) async {
    // ignore: prefer_const_declarations
    final path = r'/todo/{todoId}'
      .replaceAll('{todoId}', todoId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Find todo by ID
  ///
  /// Returns a single todo by id
  ///
  /// Parameters:
  ///
  /// * [String] todoId (required):
  ///   ID of todo to return
  Future<TodoResponse?> getTodoById(String todoId,) async {
    final response = await getTodoByIdWithHttpInfo(todoId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TodoResponse',) as TodoResponse;
    
    }
    return null;
  }

  /// Updates a todo
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] todoId (required):
  ///   ID of todo
  ///
  /// * [TodoParams] todoParams (required):
  ///   Create a new todo
  Future<Response> updateTodoWithHttpInfo(String todoId, TodoParams todoParams,) async {
    // ignore: prefer_const_declarations
    final path = r'/todo/{todoId}'
      .replaceAll('{todoId}', todoId);

    // ignore: prefer_final_locals
    Object? postBody = todoParams;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Updates a todo
  ///
  /// 
  ///
  /// Parameters:
  ///
  /// * [String] todoId (required):
  ///   ID of todo
  ///
  /// * [TodoParams] todoParams (required):
  ///   Create a new todo
  Future<TodoResponse?> updateTodo(String todoId, TodoParams todoParams,) async {
    final response = await updateTodoWithHttpInfo(todoId, todoParams,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TodoResponse',) as TodoResponse;
    
    }
    return null;
  }
}
