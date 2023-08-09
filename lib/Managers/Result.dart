import 'NetworkIssue.dart';

sealed class Result<Entity> {}

class success<Entity> extends Result<Entity> {
  final Entity data;
  success(this.data);
}

class failure<Entity> extends Result<Entity> {
  final String description;
  failure(this.description);
}

class networkIssue<Entity> extends Result<Entity> {
  final NetworkIssue issue;
  networkIssue(this.issue);
}
