//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'package:todo_api/api.dart';

class NetworkClient {
  ApiClient _apiClient;
  late TodoApi _todoApi;
  TodoApi get todoApi => _todoApi;

  NetworkClient(): _apiClient = ApiClient() {
    _todoApi = TodoApi(_apiClient);
  }
}