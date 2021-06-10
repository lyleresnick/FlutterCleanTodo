

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

class SemanticErrorResult<Reason> extends Result {
    Reason reason;
    SemanticErrorResult({this.reason});
}