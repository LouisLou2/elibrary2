import 'package:elibapp/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:elibapp/features/sign_in/repo/sign_in_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_strings.dart';
import '../../../helper/toast/toast_helper.dart';
import '../../../shared/widget/custom_filled_button.dart';
import '../../../style/ui_size.dart';
import '../../../util/format_tool.dart';
import '../bloc/sign_in_event.dart';

class EnterEmailPage extends StatefulWidget{
  const EnterEmailPage({super.key});

  @override
  State<EnterEmailPage> createState() => _EnterEmailPageState();
}

class _EnterEmailPageState extends State<EnterEmailPage> {
  //使用它，可以在表单组件的外部使用表单状态
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController idenController;

  late int lastTime;

  String? emailTip;

  @override
  void initState() {
    initializeControllers();
    lastTime=0;
    emailTip=null;
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void initializeControllers() {
    //listener在文本更改时会被调用
    idenController = TextEditingController(
      text: context.read<SignInRepo>().nowEmail,
    )..addListener(validateAllThrottle);
  }

  void disposeControllers() {
    idenController.dispose();
  }

  void validateAllThrottle(){
    int now = DateTime.now().millisecondsSinceEpoch;
    if(now-lastTime< 300)return;
    lastTime=now;
    _formKey.currentState?.validate();
  }

  // 此方法最后调用
  bool allFieldValid(){
    return _formKey.currentState?.validate()??false;
  }
  String? validateEmail(String? value){
    if(value==null||value.isEmpty){
      emailTip= AppStrs.pleaseEnterEmail;
    }else if(!FormatTool.isEmailValid(value)){
      emailTip= AppStrs.invalidEmail;
    }else{
      emailTip=null;
    }
    return emailTip;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool _) => context.read<SignInBloc>().add(SignInEvent.usePwd),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: ()=>context.read<SignInBloc>().add(SignInEvent.usePwd),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
            padding: const EdgeInsets.only(top: 120),
            child:Column(
              children: [
                Align(
                  child: Text(
                    AppStrs.enterSchoolEmail,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: UiSize.gap.hugeGap,),
                Form(
                  key:_formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: AppStrs.schoolEmail,
                            hintText: AppStrs.schoolEmail,
                            prefixIcon: const Icon(Icons.email_outlined),
                            filled: false,
                            prefixIconColor: Theme.of(context).colorScheme.primary,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 5,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: idenController,
                          validator: validateEmail,
                        ),
                        SizedBox(height: UiSize.gap.largeGap,),
                        customFilledButton(
                          context: context,
                          text: AppStrs.sendCode,
                          onPressed: submitEmail,
                          backgroundColor: CupertinoColors.systemBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitEmail() async {
    if(!allFieldValid()) {
      ToastHelper.warn(
        title: AppStrs.invalidInput,
      );
      return;
    }
    context.read<SignInBloc>().add(
      ReqCode(idenController.text,),
    );
  }
}