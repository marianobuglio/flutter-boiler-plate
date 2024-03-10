import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/appbar/tabbar.dart';
import 'package:acomerlapp/common/widgets/cards/horizontal_card.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:acomerlapp/common/widgets/layouts/grid_layout.dart';
import 'package:acomerlapp/common/widgets/notification/notification_counter.dart';
import 'package:acomerlapp/common/widgets/texts/sectionc_header.dart';
import 'package:acomerlapp/features/all_brands/all_brands.dart';
import 'package:acomerlapp/features/all_brands/brand_products.dart';
import 'package:acomerlapp/features/screenOne%20(store)/widgets/content_of_tab.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length:5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Screen One', style: Theme.of(context).textTheme.headlineMedium),
          showBackButton: false,
          actions: const [NotificationCounterIcon(iconColor: Colors.white, )],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled)  {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children:  [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(text: 'Search on store', showBorder: true, showBackground: false,padding: EdgeInsets.zero,),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TSectionHeading( title: 'Marcas', buttonTitle: 'Ver todo', showActionButton: true, onPressed: () => {Get.to(const AllBrandScreen())},),
      
                      GridLayout(itemCount: 4, mainAxisEvent: 80,itemBuilder: (_,index){
                        return   HorizontalCard(image: TImages.nikeLogo, title: "Nike", subtitle: "25 products",onTap: () => {Get.to( const BrandProducts())});
                      })
                    ],
                  )
                ),
      
                ///tabs 
                bottom: const CustomTabBar(tabs:[
                  Tab(text: 'All',),
                  Tab(text: 'Shoes',),
                  Tab(text: 'Clothes',),
                  Tab(text: 'Accessories',),
                  Tab(text: 'Brands',),
                ]),
              )
            ];
          },
          body: const TabBarView(
            children: [
             ContentOfTab(), 
             ContentOfTab(),
             ContentOfTab(),
             ContentOfTab(),
             ContentOfTab(),
            ],
          )
        ),
      ),
    );
  }
}









