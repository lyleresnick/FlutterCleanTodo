//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'UseCaseStore.dart';

class RealUseCaseStore extends UseCaseStore {

    static final store = RealUseCaseStore._();

    final _data = Map<String, dynamic>();

    RealUseCaseStore._();

    @override
    dynamic getObject(String key) {
        return _data[key];
    }

    @override
    void setObject(String key, dynamic object) {
        _data[key] = object;
    }
}
