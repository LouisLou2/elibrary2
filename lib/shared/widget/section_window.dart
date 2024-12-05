import 'package:elibapp/shared/widget/spec/text_widget.dart';
import 'package:elibapp/shared/widget/text_action_widget.dart';
import 'package:flutter/material.dart';

import 'custom_filled_button.dart';

class SectionWindow extends StatelessWidget{
  final String title;
  final VoidCallback? titleOnTap;
  final String actionText;
  final VoidCallback? actionOnTap;
  final List<Widget>widgets;
  final double? fontSize;
  const SectionWindow({super.key, required this.title,required this.actionText,this.actionOnTap,required this.widgets,this.fontSize,this.titleOnTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
            child: TextActionWidget(
              text: SpecTextWidget.mediumTitle(text: title, context: context),
              size: fontSize,
              onTap: titleOnTap,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemCount: widgets.length,
            itemBuilder: (BuildContext context,int index){
              return widgets[index];
            },
          ),
          const SizedBox(height: 8,),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: customFilledButton(
                    context: context,
                    text: actionText,
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                    textColor: Theme.of(context).colorScheme.tertiary,
                    onPressed: actionOnTap,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}