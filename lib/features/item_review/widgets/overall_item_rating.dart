import 'package:acomerlapp/features/item_review/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class OverallItemRating extends StatelessWidget {
  const OverallItemRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row( 
      children: [
        Expanded(flex:3, child:Text('4.5', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column( 
            children: [ 
              ProgressIndicatorItem( value: 0.7,text : '5'),
              ProgressIndicatorItem( value: 0.4,text : '4'),
              ProgressIndicatorItem( value: 0.6,text : '3'),
              ProgressIndicatorItem( value: 0.3,text : '2'),
              ProgressIndicatorItem( value: 0.1,text : '1'),
            ],
          ),
        )
      ],
    );
  }
}