map<string, decimal>weatherOfCities = new map<string, decimal>();
weatherOfCities.put('Waterloo', -10.2); 
weatherOfCities.put('Eskişehir', 4.7); 
weatherOfCities.put('Toronto', -6.2);
weatherOfCities.put('Bali', 21.1); 
weatherOfCities.put('İzmir', 10.8); 
system.debug(weatherOfCities);

List<string>aboveAverage = new List<string>();
aboveAverage.add('Bali');
aboveAverage.add('İzmir');
system.debug('Cities above 10 degrees ==> ' + aboveAverage);

List<string>belowAverage = new List<string>();
belowAverage.add('Waterloo');
belowAverage.add('Eskisehir');
belowAverage.add('Toronto');
system.debug('Cities under 10 degrees==> ' + belowAverage);
