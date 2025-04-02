
import 'package:flutter/material.dart';
import 'package:sendex_test/features/orders/presentation/widgets/orders_card.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_header_text.dart';
import '../items/custom_order_list_view_item.dart';



class OrdersSection extends StatelessWidget {
const OrdersSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  const SingleChildScrollView(
      child: Column(
        children: [

             CustomAppBar(),
               SizedBox (height: 40,),
              Padding(
                padding: EdgeInsets.only(left: 12,right: 12),
                child: CustomHeaderText(text: AppStrings.yourOrders,),
              ),
               SizedBox (height: 10,),
              OrdersCard(),
              // const CustomOrderListViewItem(clientName: "eyad",address: "Cairo",status: AppStrings.pending,),
              SizedBox(height: 30,),
          
        
        ],
      ),
    );
  }
}