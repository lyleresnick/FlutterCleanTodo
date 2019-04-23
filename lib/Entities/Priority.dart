

enum Priority {
    high,
    medium,
    low,
    none
}

int bangs(Priority priority) {

    switch (priority) {
        case Priority.high:
            return 3;
        case Priority.medium:
            return 2;
        case Priority.low:
            return 1;
        case Priority.none:
            return 0;
    }
    return 0;
}

Priority priorityFromBangs(int bangs) {

    switch(bangs) {
        case 3:
            return Priority.high;
        case 2:
            return Priority.medium;
        case 1:
            return Priority.low;
        case 0:
            return Priority.none;
        default:
            assert(false, "bangs must be 0, 1, 2 or 3");
    }
    return Priority.none;
}

Priority priorityFromString(String rawValue) {

    switch(rawValue) {
        case "high":
            return Priority.high;
        case "medium":
            return Priority.medium;
        case "low":
            return Priority.low;
        case "none":
            return Priority.none;
        default:
            assert(false, "rawValue must be high, medium, low or none");
    }
    return Priority.none;
}
