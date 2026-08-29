

String getName(){
  return "dd";
}

void sleep()async{
  print('i am here');
 
 int index = await getValueFromList();
  print('i am here $index');
 
}

Future<bool> getFirstName() async{
   await Future.delayed(Duration(minutes: 300));
  return true;
}

Future<int> getValueFromList(){
  var list = [1,2,3,4,5,6,7,8];
  int index = 0;
  for(var value in list){
    if(value == 6){
      
      return Future.value(index);
    }
    index++;
  }
  return Future.value(-1);
}