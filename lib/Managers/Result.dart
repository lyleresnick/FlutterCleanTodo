

abstract class Result {
}


class SuccessResult<Entity> extends Result {
    Entity data;
    SuccessResult({this.data});
}

class FailureResult extends Result {
    int code;
    String description;

    FailureResult({this.code, this.description});
}

class DomainIssueResult<Issue> extends Result {
    Issue reason;
    DomainIssueResult({this.reason});
}