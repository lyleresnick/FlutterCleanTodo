//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

abstract class UseCaseStore {

    dynamic getObject(String key);
    void setObject(String key, dynamic object);
}