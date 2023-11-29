/*https://stackoverflow.com/questions/63251355/flutter-how-to-use-firebase-storage-to-get-new-data-if-json-file-in-firebase-st
/// Move them outside of the class as Top Level functions
List<Data> readFile(File file) {
  try{
    String data = file.readAsStringSync();
    return dataFromJson(data);
  } catch(e){ 
    print(e.toString());
    return List<Data>(); // or return an empty list, up to you
  }
}

// No need of encoder now because response body is already a String
void writeFile(Map<String, dynamic> arg) =>
  arg['file']?.writeAsStringSync(arg['data'], flush: true);

class DataServices {

  DateTime dateApi;

  static const String url = 'https://firebasestorage.googleapis.com/v0/b/tft-test-48c87.appspot.com/o/loadData.json?alt=media&token=92e3d416-62dc-4137-93a3-59ade95ac38f';
  static const String urlUpdate = 'https://firebasestorage.googleapis.com/v0/b/tft-test-48c87.appspot.com/o/loadData.json';

  Future<List<Data>> getData() async {
    bool update = await compareLastUpdate;
    if(update) { // that means the update times are the same, so retrieving form json file is better than doing http request
       final file  = await _createFile();
       if(await file.exists()) return await compute(readFile, file);
       else return null; //or an empty List
       // If it doesn't exists (probably first time running the app)
       // then retrieve an empty list, null or check how to fill the list from somewhere else
    }
    try {
      final response = await http.get(url);
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      if (200 == response.statusCode) {
        final String utfData = utf8.decode(response.bodyBytes); //just decode it yourself instead of using response.body which uses [latin1] by default
        final List<Data> data = await compute(dataFromJson, utfData);
        final file  = await _createFile();
        Map<String, dynamic> args = {
          'file': file,
          'data': utfData
          //'data': response.body // pass the return body instead of the data
        };
        await compute(writeFile, args);
        await preferences.setString('updateDate', dateApi.toString()); //Save the new date
        return data;
      } else {
        return List<Data>();
      }
    } catch (e) {
      return List<Data>();
    }
  }

 File _createFile() async{
   Directory tempDir = await getTemporaryDirectory(); // or check for a cache dir also
   return File('${tempDir.path}/Data.json');
 }


Future<bool> get compareLastUpdate async{
  final dateCache = await _lastUpdateDB;
  dateApi = await _lastUpdateApi;

  if(dateCache == null) return false;    
  return dateApi?.isAtSameMomentAs(dateCache) ?? false; // or just isAfter()
  // If dateApi is null (an error conection or some throw) just return false or throw an error and 
  // catch it somewhere else (and give info to the user why it couldn't update)
}

Future<DateTime> get _lastUpdateApi async{
  try {
     final response = await http.get(urlUpdate);
     DateTime dateTime;
     if (200 == response.statusCode) {
       final data = jsonDecode(response.body));
       dateTime = DateTime.tryParse(data['updated'] ?? '');
     } 
     return dateTime;
   } catch (e) {
     return null;
   }
}

  Future<DateTime> get _lastUpdateDB async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return DateTime.tryParse(preferences.getString('updateDate') ?? ''); // Or if it's null use an old date
    // The first time the app opens there is no updateDate value, so it returns null, if that
    // happens replace it by an old date, one you know your api will be always newer,
    // Ex: 1999-08-06 02:07:53.973 Your Api/App didn't even exist back then
    // Or just use an empty String so the tryParser returns null
  }
}

*/
