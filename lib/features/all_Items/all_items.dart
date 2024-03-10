import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/sortable_list/sortable_list.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllItemsScreen extends StatelessWidget {
  const AllItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: TAppBar(
        title: Text('popular Items'),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SortableItems(),
        ),
      ),
    );
  }
}

