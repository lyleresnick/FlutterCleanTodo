//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'NetworkIssue.dart';

sealed class Result<Entity, DomainIssue> {}

class success<Entity, DomainIssue> extends Result<Entity, DomainIssue> {
  final Entity data;
  success(this.data);
}

class failure<Entity, DomainIssue> extends Result<Entity, DomainIssue> {
  final String description;
  failure(this.description);
}

class domainIssue<Entity, DomainIssue> extends Result<Entity, DomainIssue> {
  final DomainIssue issue;
  domainIssue(this.issue);
}

class networkIssue<Entity, DomainIssue> extends Result<Entity, DomainIssue> {
  final NetworkIssue issue;
  networkIssue(this.issue);
}
