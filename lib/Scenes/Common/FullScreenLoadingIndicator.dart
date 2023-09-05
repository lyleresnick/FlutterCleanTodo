//  Copyright (c) 2023 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';

class FullScreenLoadingIndicator extends StatelessWidget {
  const FullScreenLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: Colors.lightGreen,));
  }
}
