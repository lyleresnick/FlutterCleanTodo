

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

class DomainMatterResult<Reason> extends Result {
    Reason reason;
    DomainMatterResult({this.reason});
}