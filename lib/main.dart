
import 'package:flutter/material.dart';
import 'package:flutter_product/product.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  
      
  runApp(const InitialScreen());
  }
  class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
      return  MaterialApp(
        title: 'Flutter Demo',
      debugShowCheckedModeBanner:false ,
      home: ProductScreen(),
      );
     }
      }  
    

  

