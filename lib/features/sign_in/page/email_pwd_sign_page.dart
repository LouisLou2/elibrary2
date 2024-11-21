import 'package:elibapp/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:elibapp/features/sign_in/bloc/sign_in_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_strings.dart';
import '../../../helper/toast/toast_helper.dart';
import '../../../shared/widget/custom_filled_button.dart';
import '../../../style/ui_size.dart';
import '../../../util/format_tool.dart';
class SignInPage extends StatefulWidget{
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //使用它，可以在表单组件的外部使用表单状态
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> pwdVisibleNotifier = ValueNotifier(true);
  late final TextEditingController idenController;
  late final TextEditingController pwdController;

  late int lastTime;

  String? emailTip;
  String? pwdTip;

  @override
  void initState() {
    lastTime=0;
    emailTip=pwdTip=null;
    initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void initializeControllers() {
    //listener在文本更改时会被调用
    idenController = TextEditingController()
      ..addListener(validateAllThrottle);
    pwdController = TextEditingController()
      ..addListener(validateAllThrottle);
  }

  void disposeControllers() {
    idenController.dispose();
    pwdController.dispose();
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
    if(value==null || value.isEmpty){
      emailTip= AppStrs.pleaseEnterEmail;
    }else if(!FormatTool.isEmailValid(value)){
      emailTip= AppStrs.invalidEmail;
    }else{
      emailTip=null;
    }
    return emailTip;
  }

  String? validatePwd(String? value){
    if(value==null||value.isEmpty){
      pwdTip = AppStrs.pleaseEnterPassword;
    }else if(!FormatTool.isPwdValid(value)){
      pwdTip =AppStrs.invalidPassword;
    }else{
      pwdTip=null;
    }
    return pwdTip;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Align(
                child: Text(
                  AppStrs.useSchoolEmail,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: UiSize.hugeGap,),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                      const SizedBox(height: 20),
                      ValueListenableBuilder(
                        valueListenable: pwdVisibleNotifier,
                        builder: (_, pwdObscure, __)=>TextFormField(
                          obscureText: pwdObscure,
                          controller: pwdController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          //onChanged: (_) => _formKey.currentState?.validate(),
                          decoration: InputDecoration(
                            labelText: AppStrs.password,
                            hintText: AppStrs.password,
                            prefixIcon: const Icon(CupertinoIcons.lock),
                            prefixIconColor: Theme.of(context).colorScheme.primary,
                            filled: false,
                            suffixIcon: IconButton(
                              icon: Icon(
                                pwdObscure ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black,
                                size: 20,
                              ),
                              onPressed: () => pwdVisibleNotifier.value = !pwdObscure,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 5,
                              ),
                            ),
                          ),
                          validator: validatePwd,
                        ),
                      ),
                      const SizedBox(height: 170,),
                      Semantics(
                        label: AppStrs.signIn,
                        child: customFilledButton(
                          context: context,
                          text: AppStrs.signIn,
                          onPressed: signInPressed,
                          backgroundColor: CupertinoColors.systemBlue,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Semantics(
                        label: AppStrs.useEmailCode,
                        child: customFilledButton(
                          context: context,
                          text: AppStrs.useEmailCode,
                          onPressed: ()=>context.read<SignInBloc>().add(SignInEvent.useEmailCode),
                          backgroundColor: Theme.of(context).focusColor,
                          textColor: CupertinoColors.systemBlue,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: (){},
                            child: Text(
                              AppStrs.forgotPassword,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: CupertinoColors.systemBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '* ${AppStrs.useEmailCodeIfFirst}',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // logic
  String makeTip(){
    return '${emailTip!=null?'$emailTip; ':''}${pwdTip!=null?'$pwdTip; ':''}${pwdTip!=null?AppStrs.passwordRules:''}';
  }

  void signInPressed() async {
    if(!allFieldValid()) {
      ToastHelper.warn(title: makeTip());
      return;
    }
    context.read<SignInBloc>().add(
        GiveEmailPwd(idenController.text, pwdController.text,)
    );
  }
}