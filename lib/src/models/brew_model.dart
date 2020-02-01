class BrewModel {
  int _brewPage;
  String _brewPageName;
  String _brewPageType;
  String _brewPageLastEdited;
  List<_BrewPage> _brewPages = [];

  BrewModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['brew_page_list'].length);
    _brewPage = parsedJson['brew_page'];
    _brewPageName = parsedJson['brew_page_name'];
    _brewPageType = parsedJson['brew_page_type'];
    _brewPageLastEdited = parsedJson['brew_page_last_edited'];
    List<_BrewPage> temp = [];
    for (int i = 0; i < parsedJson['brew_page_list'].length; i++) {
      _BrewPage brewPage = _BrewPage(parsedJson['brew_page_list'][i]);
      temp.add(brewPage);
    }

    _brewPages = temp;
  }

  List<_BrewPage> get brewPages => _brewPages;
  String get brewPageLastEdited => _brewPageLastEdited;
  String get brewPageType => _brewPageType;
  String get brewPageName => _brewPageName;
  int get brewPage => _brewPage;
}

class _BrewPage {
  int _brewDate;
  String _brewStatus;
  String _brewDescription;
  String _brewStartDate;
  String _brewSize;
  String _brewBoilTime;
  double _brewOriginalGravity;
  double _brewFinalGravity;
  int _brewDaysInWort;
  String _brewBottleDate;
  int _brewBottleDaysAging;
  double _brewBottleAbv;
  String _brewIbu;
  String _brewSrm;
  String _brewCarbonationLevel;
  List<Map<String, int>> _brewBottleCount = [];
  List<Map<String, dynamic>> _brewRecipe = [];

  _BrewPage(brewPage) {
    _brewDate = brewPage['brew_date'];
    _brewStatus = brewPage['brew_status'];
    _brewDescription = brewPage['brew_description'];
    _brewStartDate = brewPage['brew_start_date'];
    _brewSize = brewPage['brew_size'];
    _brewBoilTime = brewPage['brew_boil_time'];
    _brewOriginalGravity = brewPage['brew_original_gravity'];
    _brewFinalGravity = brewPage['brew_final_gravity'];
    _brewDaysInWort = brewPage['brew_days_in_wort'];
    _brewBottleDate = brewPage['brew_bottle_date'];
    _brewBottleDaysAging = brewPage['brew_bottle_days_aging'];
    _brewBottleAbv = brewPage['brew_bottle_abv'];
    _brewIbu = brewPage['brew_ibu'];
    _brewSrm = brewPage['brew_srm'];
    _brewCarbonationLevel = brewPage['brew_carbonation_level'];
    for (int i = 0; i < brewPage['brew_bottle_count'].length; i++) {
      _brewBottleCount.add(brewPage['brew_bottle_count'][i]);
    }
    for (int j = 0; j < brewPage['brew_recipe'].length; j++) {
      _brewRecipe.add(brewPage['brew_recipe'][j]);
    }
  }

  int get brewDate => _brewDate;
  String get brewStatus => _brewStatus;
  String get brewDescription => _brewDescription;
  String get brewStartDate => _brewStartDate;
  String get brewSize => _brewSize;
  String get brewBoilTime => _brewBoilTime;
  double get brewOriginalGravity => _brewOriginalGravity;
  double get brewFinalGravity => _brewFinalGravity;
  int get brewDaysInWort => _brewDaysInWort;
  String get brewBottleDate => _brewBottleDate;
  int get brewBottleDaysAging => _brewBottleDaysAging;
  double get brewBottleAbv => _brewBottleAbv;
  String get brewIbu => _brewIbu;
  String  get brewSrm => _brewSrm;
  String get brewCarbonationLevel => _brewCarbonationLevel;
  List<Map<String, int>> get brewBottleCount => _brewBottleCount;
  List<Map<String, dynamic>> get brewRecipe => _brewRecipe;
}