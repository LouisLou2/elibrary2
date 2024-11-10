import 'dart:async';

import 'package:elibapp/config/business_basic_rule.dart';
import 'package:elibapp/features/sign_in/bloc/sign_in_event.dart';
import 'package:elibapp/features/sign_in/bloc/sign_in_state.dart';
import 'package:elibapp/features/sign_in/repo/sign_in_repo.dart';
import 'package:elibapp/helper/toast/toast_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

import '../../../entity/res.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepo _repo = GetIt.I<SignInRepo>();

  Timer? _timer;

  SignInBloc() : super(SignInState.typingEmailPwd) {
    // on
    on<UseEmailCode>((event, emit) {
      if (state == SignInState.typingEmailPwd || state is TypingEmailCode) {
        _timer?.cancel(); // 可能会从输入验证码的状态转到输入邮箱的状态，所以需要取消timer
        emit(SignInState.typingEmail);
      }
    });

    on<UsePwd>((event, emit) {
      if (state == SignInState.typingEmail) {
        emit(SignInState.typingEmailPwd);
      }
    });

    on<GiveEmailPwd>((event, emit) {
      if (state == SignInState.typingEmailPwd) {
        _verifyEmailPwd(event.email, event.pwd);
      }
    });

    on<GiveEmailCode>((event, emit) {
      if (state.runtimeType == TypingEmailCode) {
        _verifyEmailCode(event.code);
      }
    });

    on<ReqCode>((event, emit) {
      if (state == SignInState.waitingResend){
        assert (event.email == null);
        _sendEmailCode(null);
      }
      if (state == SignInState.typingEmail) {
        assert(event.email != null);
        // 获取是否还有剩余时间
        int leftSec = _repo.secLeft;
        if ( event.email == _repo.nowEmail) {
          if(leftSec > 0) {
            emit(TypingEmailCode(leftSec));
            _startTimer();
          }
        } else {
          // 仍然需要时间
          if (leftSec > 0) {
            ToastHelper.warn(title: '太频繁了，请等待${leftSec}秒');
          } else {
            _sendEmailCode(event.email);
          }
        }
      }
    });

    on<CountSecond>((event, emit) {
      if (state is TypingEmailCode) {
        int second = (state as TypingEmailCode).timeLeft;
        if (second > 0) {
          emit(TypingEmailCode(second - 1));
        } else {
          _timer?.cancel();
          emit(SignInState.waitingResend);
        }
      }
    });

    on<SendCodeSuccess>((event, emit) {
      if (state == SignInState.typingEmail || state is TypingEmailCode) {
        emit(const TypingEmailCode(BusinessBasicRule.sendEmailCodeIntervalInSec));
        _startTimer();
      }
    });

    on<VerifySuccess>((event, emit) {
      // 将timer取消
      _timer?.cancel();
      // 需要转到下一个页面
      print ('@@@@@@@@@@@@@转到下一个页面');
    });

  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(const CountSecond());
    });
  }

  void _verifyEmailPwd(String email, String pwd) async {
    // 立刻给出loading状态
    EasyLoading.show();
    Res<void> res = await _repo.verifyEmailPwdAndSaveUser(email, pwd);
    // 隐藏loading
    EasyLoading.dismiss();
    // 如果失败，给出toast
    if (!res.isSuccess) {
      ToastHelper.showToaster(code: res.code, title: res.message);
      return;
    }
    // 成功，发出事件
    add(SignInEvent.verifySuccess);
  }

  void _verifyEmailCode(String code) async {
    EasyLoading.show();
    Res<void> res = await _repo.verifyEmailCodeAndSaveUser(_repo.nowEmail, code);
    EasyLoading.dismiss();
    // 如果失败，给出toast
    if (!res.isSuccess) {
      ToastHelper.showToaster(code: res.code, title: res.message);
      return;
    }
    // 成功，发出事件
    add(SignInEvent.verifySuccess);
  }

  void _sendEmailCode(String? email) async {
    EasyLoading.show();
    Res<void> res = email == null ? await _repo.resendEmailCode() : await _repo.sendEmailCode(email);
    EasyLoading.dismiss();
    // 如果失败，给出toast
    if (!res.isSuccess) {
      ToastHelper.showToaster(code: res.code, title: res.message);
      return;
    }
    _repo.noteSendEmailCodeTime(email!);
    // 成功，发出事件
    add(SignInEvent.sendCodeSuccess);
  }
}