

abstract class Result {
}


class SuccessResult<Entity> extends Result {
    Entity data;
    SuccessResult({this.data});
}

class FailureResult<FailureSource> extends Result {
    FailureSource source;
    int code;
    String description;

    FailureResult({this.source, this.code, this.description});
}

class SemanticErrorResult<Reason> extends Result {
    Reason reason;
    SemanticErrorResult({this.reason});
}