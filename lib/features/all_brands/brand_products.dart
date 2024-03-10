import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/cards/horizontal_card.dart';
import 'package:acomerlapp/common/widgets/sortable_list/sortable_list.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Brand Products'),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              HorizontalCard(image: TImages.appleLogo, title: 'Apple', subtitle: '256 products'),
          
              SizedBox(height: TSizes.spaceBtwItems),
          
              SortableItems()
            ],
          ),
        ),
      ),
    );
  }
}