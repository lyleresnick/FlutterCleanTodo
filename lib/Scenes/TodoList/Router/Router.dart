//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

typedef void ChangedItemCallback(RowPresentationModel model);

abstract interface class Router  {
    void routeShowItemDetail();

}
