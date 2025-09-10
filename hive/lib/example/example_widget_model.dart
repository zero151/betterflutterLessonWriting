import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'example_widget_model.g.dart';
class ExampleWidgetModel{

  void doSome() async{
    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(UserAdapter());
    }
    var box = await Hive.openBox<User>('testbox');
    final index = await box.add(User('qwert', 12));
    final u = box.getAt(index);
    print('${box.values}');
    print('${box.getAt(index)}');
    
    

    // var box = await Hive.openBox<dynamic>('testbox');
    // await box.put('name', 'max');
    // final index = await box.add([1,2,3,4]);
    // print('${box.get('name')}');
    // print('${box.getAt(index)}');
    // print(index);
    // box.close();
  }
}

@HiveType(typeId: 0)
class User{
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  User(this.name, this.age);
}

