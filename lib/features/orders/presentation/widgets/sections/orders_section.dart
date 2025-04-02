
import 'package:flutter/material.dart';
import 'package:sendex_test/core/utils/app_dimensions.dart';
import 'package:sendex_test/features/orders/presentation/widgets/orders_card.dart';

import '../../../../../core/services/responsive_helper.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_header_text.dart';



class OrdersSection extends StatelessWidget {
const OrdersSection({ super.key });

  @override
  Widget build(BuildContext context){
    return   SingleChildScrollView(
      child: Column(
        children: [

             const CustomAppBar(),
               SizedBox (height: ResponsiveHelper.getProportionateHeight(context, 40),),
              const Padding(
                padding: EdgeInsets.only(left: AppDimensions.fontSizeSmall12,right: AppDimensions.fontSizeSmall12),
                child: CustomHeaderText(text: AppStrings.yourOrders,),
              ),
                SizedBox (height: ResponsiveHelper.getProportionateHeight(context, 10)),
              const OrdersCard(),
              
               SizedBox(height: ResponsiveHelper.getProportionateHeight(context, 30),),
          
        
        ],
      ),
    );
  }
}