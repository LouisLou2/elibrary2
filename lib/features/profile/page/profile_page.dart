import 'package:elibapp/common/rb_record_type.dart';
import 'package:elibapp/entity/user/user_auth_params.dart';
import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_strings.dart';
import '../../../shared/widget/image_tile.dart';
import '../../../shared/widget/info_display/headline2.dart';
import '../../../shared/widget/setting_section.dart';
import '../../../style/ui_color.dart';
import '../../../style/ui_size.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {

    final UserStateRepo userRepo = context.read<UserStateRepo>();
    final int userId = userRepo.userId;
    final String userName = userRepo.userName;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child:Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 30,
                    ),
                  ),
                ],
              ),
              HeadLine2(
                title: AppStrs.account,
                size: 37,
              ),
              const Divider(
                height: 8,
                thickness: 1,
              ),
              SizedBox(height: UiSize.gap.mediumGap,),
              Expanded(
                child:ListView(
                  shrinkWrap: true,
                  children:[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: ImageTile(
                        image: CircleAvatar(
                          radius: 28,
                          child: Text(
                            userName[0],
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: 25,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                        circleImage: true,
                        title: userName,
                        titleWeight: FontWeight.w500,
                        fontSize: 22,
                        actionWidget: IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: UiSize.gap.mediumGap),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: UiSize.padding.largePadding),
                        child: Text(
                          '你的姓名将向其他人展示',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 20,right: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                          width: 0.4,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '我的借阅',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                direction: Axis.horizontal,
                                children: [
                                  Text(
                                    '全部',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: 14,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Theme.of(context).hintColor,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: UiSize.gap.mediumGap,),
                          Material(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _buildPhase(
                                    _wrappedIcon(
                                      Icons.all_inbox,
                                      color: Colors.blueAccent,
                                    ),
                                    '全部',
                                    ()=> NavigationHelper.toRBRecordPage(RBRecordType.All),
                                  ),
                                ),
                                Expanded(
                                  child: _buildPhase(
                                    _wrappedIcon(
                                      Icons.timer,
                                      color: Colors.blueAccent,
                                    ),
                                    '待取书',
                                     ()=> NavigationHelper.toRBRecordPage(RBRecordType.WaitingPickup),
                                  ),
                                ),
                                Expanded(
                                  child: _buildPhase(
                                    _wrappedIcon(
                                      Icons.book_outlined,
                                      color: Colors.blueAccent,
                                    ),
                                    '待归还',
                                    ()=> NavigationHelper.toRBRecordPage(RBRecordType.WaitingReturn),
                                  ),
                                ),
                                Expanded(
                                  child: _buildPhase(
                                    _wrappedIcon(
                                      Icons.more_horiz_outlined,
                                      color: Colors.blueAccent,
                                    ),
                                    '其他',
                                    (){},
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: UiSize.gap.mediumGap,),
                    GridView(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.5,
                        mainAxisExtent: 80,
                      ),
                      children: [
                        _gridItem(icon: Icons.star, iconColor: Colors.orange,title: '我的收藏',onTap: (){}),
                        _gridItem(icon: Icons.history, iconColor: Colors.blue,title: '浏览记录',onTap: (){}),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top:UiSize.padding.smallPadding, bottom: UiSize.padding.largePadding),
                        child: Text(
                          '轻触以查看全部',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    _buildSettingTitle(icon: Icons.timeline_rounded, iconColor: Colors.red,title: AppStrs.myFines, onTap: () { }),
                    SizedBox(height: UiSize.gap.mediumGap,),
                    _buildSettingTitle(icon: Icons.palette_rounded, iconColor: UiColor.relieveGreen,title: AppStrs.appearance, onTap: () { }),
                    SizedBox(height: UiSize.gap.mediumGap,),
                    _buildSettingTitle(icon: Icons.settings, iconColor: Colors.grey,title: AppStrs.moreSetting, onTap: () { }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wrappedIcon(IconData icon, {Color? color}){
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color?.withOpacity(0.3),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget _buildPhase(Widget icon, String title,VoidCallback onTap){
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Align(
          alignment: Alignment.center,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            children: [
              icon,
              const SizedBox(height: 5,),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSettingTitle({required IconData icon,Color? iconColor, required String title,required VoidCallback onTap}){
    return ListTile(
      onTap: onTap,
      tileColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 0.4,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
      leading: _wrappedIcon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 19,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
      ),
    );
  }

  Widget _gridItem({required IconData icon,Color? iconColor, required String title,required VoidCallback onTap}){
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 0.4,
        ),
      ),
      tileColor: Theme.of(context).colorScheme.surface,
      contentPadding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      leading: _wrappedIcon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 17,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}