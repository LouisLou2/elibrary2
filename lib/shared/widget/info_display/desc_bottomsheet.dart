import 'package:flutter/material.dart';

void showDescBottomSheet({required BuildContext context,required String title,String? desc,required double height}){
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (sheetContext){
      return SizedBox(
        height: MediaQuery.of(sheetContext).size.height * 0.4,
        width: MediaQuery.of(sheetContext).size.width,
        child:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SelectionArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(
                    title,
                    style: Theme.of(sheetContext).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    desc??'暂无',
                    style: Theme.of(sheetContext).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          )
        ),
      );
    },
  );
}