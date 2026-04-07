//listDemo.apex

List<String> petNames = new List<String>();
petNames.add('Fluffy');
petNames.add('Spot');
petNames.add('Rover');
System.debug('🐶 My pet names are: ' + petNames);

petNames.sort();
System.debug('🐶 My pet names in sorted order are: ' + petNames);

String accessedItem = petNames.get(1);
System.debug('🐶 I accessed ' + accessedItem + ' from my pet names.');
System.debug('🐶 My pet names are now: ' + petNames);
