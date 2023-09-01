//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'package:todo_api/api.dart';

import '../Abstraction/NetworkIssue.dart';
import '../Abstraction/LongResult.dart' as Long;
import '../Abstraction/Result.dart';

mixin ExceptionGuard {
  Future<Result<Entity>> exceptionGuard<Entity>(Future<Entity> func()) async {
    try {
      final result = await func();
      return success(result);
    } on ApiException catch (ex) {
      if (ex.code == 400 &&
          ex.message != null &&
          ex.message!.startsWith('Socket operation failed:'))
        return networkIssue(NetworkIssue.noNetwork);
      return failure("${ex.code}  ${ex.message}");
    } catch (ex) {
      return failure(ex.toString());
    }
  }

  Future<Long.Result<Entity, DomainIssue>>
      longExceptionGuard<Entity, DomainIssue>(Future<Entity> func(),
          {required DomainIssue? domainFilter(Exception ex)}) async {
    try {
      final result = await func();
      return Long.success(result);
    } on ApiException catch (ex) {
      if (ex.code == 400 &&
          ex.message != null &&
          ex.message!.startsWith('Socket operation failed:'))
        return Long.networkIssue(NetworkIssue.noNetwork);
      final domainIssue = domainFilter(ex);
      if (domainIssue != null) return Long.domainIssue(domainIssue);
      return Long.failure("${ex.code}  ${ex.message}");
    } on DomainIssueException catch (ex) {
      final domainIssue = domainFilter(ex);
      if (domainIssue != null) return Long.domainIssue(domainIssue);
      return Long.failure(
          "Domain issue processing for ${ex.domainIssue} was not defined");
    } catch (ex) {
      return Long.failure(ex.toString());
    }
  }
}

class DomainIssueException<DomainIssue> implements Exception {
  final DomainIssue domainIssue;
  DomainIssueException(this.domainIssue);
}
