//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:todo_api/api.dart';

enum Priority {
    high,
    medium,
    low,
    none
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

int bangsFromPriority(Priority priority) {

    switch(priority) {
    case Priority.high:
        return 3;
    case Priority.medium:
        return 2;
    case Priority.low:
        return 1;
    case Priority.none:
        return 0;
    default:
        throw FormatException("bangsFromPriority: invalid priority $priority");
    }
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

String priorityToString(Priority rawValue) {
    final nameWithPrefix = rawValue.toString();
    return nameWithPrefix.split('.').last;
}

Priority priorityFromPriorityEnum(PriorityEnum rawValue) {

    switch(rawValue) {
        case PriorityEnum.high:
            return Priority.high;
        case PriorityEnum.medium:
            return Priority.medium;
        case PriorityEnum.low:
            return Priority.low;
        case PriorityEnum.none:
            return Priority.none;
        default:
            assert(false, "rawValue must be high, medium, low or none");
    }
    return Priority.none;
}

PriorityEnum priorityEnumFromPriority(Priority priority) {

    return switch(priority) {
        Priority.high => PriorityEnum.high,
        Priority.medium => PriorityEnum.medium,
        Priority.low => PriorityEnum.low,
        Priority.none => PriorityEnum.none
    };
}


