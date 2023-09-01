//  Copyright © 2023 Lyle Resnick. All rights reserved.

void jsonNullCheck(Map<dynamic, dynamic> json, List<String> propertyNameList,
    String entityName) {
  propertyNameList.forEach((name) {
    if (json[name] == null)
      throw FormatException("missing json property: '$name' in: $entityName");
  });
}
