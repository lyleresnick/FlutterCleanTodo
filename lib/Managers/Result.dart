

abstract class Result {
}


class ResultSuccess<Entity> extends Result {
    Entity data;
    ResultSuccess({this.data});
}

class ResultFailure<FailureSource> extends Result {
    FailureSource source;
    int code;
    String description;

    ResultFailure({this.source, this.code, this.description});
}

class ResultSemanticError<Reason> extends Result {
    Reason reason;
    ResultSemanticError({this.reason});
}