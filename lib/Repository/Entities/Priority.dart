//  Copyright © 2019 Lyle Resnick. All rights reserved.

enum Priority { high, medium, low, none }

extension PriorityExt on Priority {
  int get bangs {
    switch (this) {
      case Priority.high:
        return 3;
      case Priority.medium:
        return 2;
      case Priority.low:
        return 1;
      case Priority.none:
        return 0;
    }
  }

  static Priority fromBangs(int bangs) {
    switch (bangs) {
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
        return Priority.none;
    }
  }

  static Priority fromString(String rawValue) {
    switch (rawValue) {
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
        return Priority.none;
    }
  }
}
