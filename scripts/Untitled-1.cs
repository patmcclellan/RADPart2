// APEX test
List<String> myList = new List<String>();
myList.add('Another');
myList.add('Test');

for (String s : myList) {
    System.debug('🔹 ' + s);
}
