import 'package:freezed_annotation/freezed_annotation.dart';
part "Result.freezed.dart";

@freezed
class Result<Entity, Issue> with _$Result<Entity, Issue> {
  const factory Result.success(Entity data) = _Success<Entity,Issue>;
  const factory Result.failure(int code, String description) = _Failure<Entity,Issue>;
  const factory Result.domainIssue(Issue reason) = _DomainIssue<Entity,Issue>;
}
