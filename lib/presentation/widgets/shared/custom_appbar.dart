import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});
  @override
  Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;
    return  SafeArea(
      bottom: false,
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(Icons.movie_outlined,color: colors.primary),
            const SizedBox(width: 5),
            Text('Cinemapedia',style: TextStyle(color: colors.primary,fontSize: 20,fontWeight: FontWeight.bold)),
            const Spacer(),//Spacer es usado para que el widget se expanda y ocupe todo el espacio disponible
            IconButton(onPressed: (){}, icon: const Icon(Icons.search))       
            ],
        ),
      ),
    ));
  }
}
