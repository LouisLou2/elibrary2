import 'package:elibapp/common/rb_record_type.dart';
import 'package:elibapp/features/reserve_borrow_record/page/rb_record_list.dart';
import 'package:elibapp/features/reserve_borrow_record/repo/rb_record_repo.dart';
import 'package:elibapp/shared/widget/util_widget/keep_alive_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RBRecordPage extends StatefulWidget {
  const RBRecordPage({super.key});

  @override
  State<RBRecordPage> createState() => _RBRecordPageState();
}

class _RBRecordPageState extends State<RBRecordPage> {

  late ValueNotifier<RBRecordType> _selectedSegment;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // from page arguments
    RBRecordType _recordType = ModalRoute.of(context)!.settings.arguments as RBRecordType;
    _selectedSegment = ValueNotifier<RBRecordType>(_recordType);
    _pageController = PageController(initialPage: _recordType.index);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: Text(
          '我的借阅',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: ValueListenableBuilder<RBRecordType>(
                      valueListenable: _selectedSegment,
                      builder: (context, value, child) {
                        return CupertinoSlidingSegmentedControl<RBRecordType>(
                          groupValue: value,
                          children: const {
                            RBRecordType.All: Text('全部'),
                            RBRecordType.WaitingPickup: Text('待取书'),
                            RBRecordType.WaitingReturn: Text('待还书'),
                          },
                          onValueChanged: (RBRecordType? newValue) {
                            if (newValue != null) {
                              _selectedSegment.value = newValue;
                              _pageController.jumpToPage(newValue.index);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: RepositoryProvider.value(
                value: GetIt.I<RBRecordRepo>(),
                child: PageView(
                  onPageChanged: (index) {
                    _selectedSegment.value = RBRecordType.values[index];
                  },
                  controller: _pageController,
                  children: const [
                    KeepAliveWrapper(
                      child: RBRecordListPage(type: RBRecordType.All)
                    ),
                    KeepAliveWrapper(
                      child: RBRecordListPage(type: RBRecordType.WaitingPickup)
                    ),
                    KeepAliveWrapper(
                      child: RBRecordListPage(type: RBRecordType.WaitingReturn)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}