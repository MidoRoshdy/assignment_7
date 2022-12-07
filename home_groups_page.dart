import 'package:flutter/material.dart';
import 'package:whatsapp/core/text_styles.dart';

class HomeGroupsPage extends StatelessWidget {
  const HomeGroupsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 100,
       itemBuilder: (ctx,index)=> Text(index.toString(),style: TextStyles.splashTextStyle2,),
     );
  }
}