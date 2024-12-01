import 'package:elibapp/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:elibapp/features/sign_in/bloc/sign_in_event.dart';
import 'package:elibapp/features/sign_in/repo/sign_in_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widget/info_display/headline2.dart';
import '../../../style/ui_size.dart';
import '../../../util/format_tool.dart';
import '../bloc/sign_in_state.dart';

class EnterVeriCodePage extends StatefulWidget{

  const EnterVeriCodePage({super.key,});
  @override
  State<EnterVeriCodePage> createState()=>_EnterVeriCodePageState();
}

class _EnterVeriCodePageState extends State<EnterVeriCodePage> with WidgetsBindingObserver{

  final TextEditingController _controller = TextEditingController();
  late FocusNode _inputFocus;
  final ValueNotifier<String> _veriCode = ValueNotifier('');

  @override
  void initState(){
    _inputFocus = FocusNode();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _inputFocus.requestFocus();
    });
  }

  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    _inputFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return PopScope(
      canPop: false,
      onPopInvoked: (bool _)=>context.read<SignInBloc>().add(SignInEvent.useEmailCode),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => context.read<SignInBloc>().add(SignInEvent.useEmailCode),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: UiSize.gap.largeGap),
              HeadLine2(
                title: '请输入验证码',
                size: 30,
                subTitle: '验证码已发送到 ${context.read<SignInRepo>().nowEmail}',
              ),
              SizedBox(height: UiSize.gap.mediumGap),
              _getCodeInput(context),
              GestureDetector(
                onTap: (){
                  SystemChannels.textInput.invokeMethod('TextInput.show');
                  _inputFocus.requestFocus();
                },
                child: _getCodeBoxes(context),
              ),
              SizedBox(height: UiSize.gap.smallGap),
              BlocBuilder<SignInBloc,SignInState>(
                builder: (context,state){
                  return state.timeLeft > 0 ?
                  Text(
                    '${state.timeLeft}秒后重新发送',
                  )
                    : TextButton(
                    onPressed: (){
                      context.read<SignInBloc>().add(const ReqCode(null));
                    },
                    child: Text(
                      '重新发送',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCodeInput(BuildContext context){
    return SizedBox(
      height: 0,
      width: 0,
      child: TextField(
        controller: _controller,
        focusNode: _inputFocus,
        maxLength: 6,
        keyboardType: TextInputType.number,
        enableInteractiveSelection: false,// 禁止长按弹出菜单
        inputFormatters: [
          FilteringTextInputFormatter.allow(FormatTool.onlyNumberRegex),
        ],
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: tyingCode,
      ),
    );
  }

  Widget _getCodeBoxes(BuildContext context){
    return ValueListenableBuilder(
      valueListenable: _veriCode,
      builder: (_,code,__){
        return GridView.count(
          crossAxisCount: 6,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 8,
          childAspectRatio: 0.95,
          children: List.generate(
            6,
            (index) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: code.length > index ? Border.all(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ):null,
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: code.length > index ? Text(
                code[index],
                style: Theme.of(context).textTheme.headlineLarge,
              ):const SizedBox(),
            ),
          ),
        );
      },
    );
  }

  void tyingCode(String code){
    _veriCode.value = code;
    if(code.length == 6){
      context.read<SignInBloc>().add(GiveEmailCode(code));
    }
  }
}