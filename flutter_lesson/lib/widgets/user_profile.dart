import 'package:flutter/material.dart';

// ignore: camel_case_types
class User_Profile extends StatelessWidget{
  User_Profile({super.key});
  final firstMenuData = <MenuRowData>[
    MenuRowData(icon: Icons.favorite, text: 'Избранное'),
    MenuRowData(icon: Icons.call, text: 'Недавние звонки'),
    MenuRowData(icon: Icons.devices_sharp, text: 'Устройства'),
    MenuRowData(icon: Icons.folder, text: 'Папка с чатами'),
  ];
  final secondMenuData = <MenuRowData>[
    MenuRowData(icon: Icons.notifications, text: 'Уведомления и звуки'),
    MenuRowData(icon: Icons.privacy_tip, text: 'Конфиденциальность'),
    MenuRowData(icon: Icons.memory, text: 'Данные и память'),
    MenuRowData(icon: Icons.brush, text: 'Оформление'),
    MenuRowData(icon: Icons.language, text: 'Язык'),
  ];
  final thirdMenuData = <MenuRowData>[
    MenuRowData(icon: Icons.help_center, text: 'Помощь'),
    MenuRowData(icon: Icons.question_answer, text: 'Вопросы о телеграмм'),
  ];

  @override
  Widget build(BuildContext Context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent, centerTitle: true, title: Text('Настройки')),
      body: ListView(
        children: [
          _User_Info(),
            SizedBox(height: 30,),
            _MenuWidget(menuRow: firstMenuData,),
            SizedBox(height: 30,),
            _MenuWidget(menuRow: secondMenuData,),
            SizedBox(height: 30,),
            _MenuWidget(menuRow: thirdMenuData,),
        ],
      )
      );
  }
}
class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  _MenuWidget({required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data)=> _MenuRowWidget(data: data)).toList()
      ),
    );
  }
}
class MenuRowData{
  final IconData icon; 
  final String text;
  MenuRowData({required this.icon, required this.text});
}

class _MenuRowWidget extends StatelessWidget {
  final MenuRowData data;

  const _MenuRowWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(data.icon),
          SizedBox(width: 10,),
          Text(data.text),
          Spacer(),
          Icon(Icons.chevron_right_sharp)
        ],
      ),
    );
  }
}

class _User_Info extends StatelessWidget {
  const _User_Info();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container(
        color: Colors.white,
          width: double.infinity,
          child: Column( children: [
            SizedBox(height: 30),
            _AvatarWidget(),
            SizedBox(height: 30),
            _UserName(),
            SizedBox(height: 10),
            _UserPhone(),
            SizedBox(height: 10),
            _UserNick(),
            SizedBox(height: 10),
          
          ],),
        ),
        Positioned(
          top: 25,
          right: 25, 
          child: Text('Изменить',style: TextStyle(color: Colors.blue),))]
    );
  }
}

class _UserNick extends StatelessWidget {
  const _UserNick();

  @override
  Widget build(BuildContext context) {
    return Text('@TikTak_2010',
    style: TextStyle(
      color: Colors.grey,
      fontSize: 17,
    ));
  }
}

class _UserPhone extends StatelessWidget {
  const _UserPhone();

  @override
  Widget build(BuildContext context) {
    return Text('8(911) 222 22 33',
    style: TextStyle(
      color: Colors.grey,
      fontSize: 15,
    ));
  }
}

class _UserName extends StatelessWidget {
  const _UserName();

  @override
  Widget build(BuildContext context) {
    return Text('Max', 
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),);
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget( );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Placeholder()
      );
  }
}