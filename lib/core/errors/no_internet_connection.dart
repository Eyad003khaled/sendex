import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class NoInternetConnection extends StatelessWidget {

  
  final Function fetchDataCallback;

  const NoInternetConnection({super.key, required this.fetchDataCallback});
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context,
          List<ConnectivityResult> connectivity, Widget child) {
        final bool connected = !connectivity.contains(ConnectivityResult.none);

        // Show a toast if the device is offline
        if (!connected) {
          return child;
          
        }

        // If internet is restored, trigger the success state in the Bloc
        if (connected) {
          // Triggering a success state in the BrandsCubit (or whichever cubit is appropriate)
          fetchDataCallback();
        }
         return const SizedBox.shrink();
         // Return a placeholder or whatever widget you want when no connection
      },
      child: const SizedBox.shrink()
      
      // showToast(
      //       false,tr(AppStrings.noInternetTitle),tr(AppStrings.noInternetSubtitle)
      //     ), // Placeholder widget (could be a loading indicator or empty space)
    );
    
  }
  
}
