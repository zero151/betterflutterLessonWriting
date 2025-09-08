import 'dart:io';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:flutter/material.dart';

class ExampleWidgetModel extends ChangeNotifier{
  void readFile() async{
    final directory = await pathProvider.getApplicationDocumentsDirectory(); //пользователь должен знать
    final filePath = directory.path + '/my_file';
    final file = File(filePath);
    final isExists = await file.exists();
    if(!isExists){
      await file.create();
    }
    await file.writeAsString('привет мир');
    final result = await file.readAsString();
    
    print(result);
    print(file);






    // pathProvider.getApplicationSupportDirectory() вспомогательные файлы
    // pathProvider.getTemporaryDirectory() кеш
    

  }
}



class ExampleModelProvider extends InheritedNotifier{
  final ExampleWidgetModel model;

  const ExampleModelProvider({super.key,required this.model, required super.child}):super(notifier: model);

  static ExampleModelProvider? watch(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context){
    final widget = context
      .getElementForInheritedWidgetOfExactType<ExampleModelProvider>()?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }
  
}