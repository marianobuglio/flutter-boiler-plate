import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile({super.key, 
    required this.title, 
    required this.subtitle, 
    this.trailing, 
    required this.icon, 
    this.onTap
  });

  final String title;
  final IconData icon;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(icon, color: TColors.primary, size: 28,),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.black)),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.black)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}