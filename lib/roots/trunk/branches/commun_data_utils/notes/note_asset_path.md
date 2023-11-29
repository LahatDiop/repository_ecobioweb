name: ecobioweb
description: Biologica
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
sdk: 3.3.0-91.0.dev
#sdk: 3.2.0-210.4.beta
#sdk: 3.16.0-0.4.pre
#sdk: 3.3.0-80.0.dev
#sdk: '3.1.4'
#sdk: '3.1.0-262.2.beta'
#sdk: '3.1.0-63.1.beta'
#sdk: '2.17.0-266.8.beta'
#sdk: '^3.1.0-63.1.beta'
#sdk: ">=3.11.0-0.1.pre <3.1.0"

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
flutter:
sdk: flutter


# The following adds the Cupertino Icons font to your application.
# Use with the CupertinoIcons class for iOS style icons.
cupertino_icons: ^1.0.2
postgres: ^2.6.0
postgresql2: ^1.0.4
postgres_pool: ^2.1.6
dio: ^5.0.0
hash: ^1.0.4
shared_preferences: ^2.1.0
flutter_login: ^4.1.1
flutter_fadein: ^2.0.0
intl: any
flutter_session_manager: ^1.0.3
path_provider: ^2.0.14
path: ^1.8.1
sqlite3_flutter_libs: ^0.5.13
drift_sqflite: ^2.0.1
drift: ^2.13.0
drift_dev: ^2.13.1
logger: ^2.0.2+1
#logging_manager: ^2.3.1 discontinued
flutter_secure_storage: ^9.0.0
sqflite: ^2.2.8
clay_containers: ^0.3.2
dotted_border: ^2.0.0+3
localstorage: ^4.0.1+2
url_launcher: ^6.1.10
convex_bottom_bar: ^3.2.0
font_awesome_flutter: ^10.4.0
email_validator: ^2.1.17
image_picker: ^1.0.4
string_validator: ^1.0.0
ffi: ^2.0.1
reflectable: ^4.0.5
source_gen: ^1.2.6
quiver: ^3.2.1
http: ^1.1.0
flutter_slidable: ^3.0.0
animations: ^2.0.7
animated_text_kit: ^4.2.2
#moor: ^4.6.1+1 discontinued
#moor_flutter: ^4.1.0 discontinued
#moor_generator: ^4.6.0+1 moor_generator
provider: ^6.0.5
flutter_localizations:
sdk: flutter
pubspec_parse: ^1.2.3
cached_network_image: ^3.2.3
lottie: ^2.4.0
theme_provider: ^0.6.0
bot_toast: ^4.0.4
flutter_svg: ^2.0.7
app_bar_with_search_switch: ^1.5.4
flutter_staggered_grid_view: ^0.7.0
get_it: ^7.6.4
mobx: ^2.2.1
smooth_page_indicator: ^1.1.0
carousel_slider: ^4.2.1
logging_manager_flutter: ^2.2.1
dart_style: ^2.3.2
analyzer_plugin: ^0.11.2
analyzer: ^5.13.0





#json_annotation: ^4.8.1
#flutter_signin_button: ^2.0.0-nullsafety.0

dev_dependencies:
#moor_generator: ^4.6.0+1
#analyzer: ^4.7.0
#analyzer: ^6.3.0
flutter_test:
sdk: flutter

# The "flutter_lints" package below contains a set of recommended lints to
# encourage good coding practices. The lint set provided by the package is
# activated in the `analysis_options.yaml` file located at the root of your
# package. See that file for information about deactivating specific lint
# rules and activating additional ones.
build_runner: ^2.4.6
#json_serializable: ^6.5.4
flutter_lints: ^3.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

# The following line ensures that the Material Icons font is
# included with your application, so that you can use the icons in
# the material Icons class.
uses-material-design: true

assets:
- assets/images/
- assets/images/agriculture
- assets/images/agriculture/vegan
- assets/images/apiculture
- assets/images/apiculture/honey
- assets/images/beverages_images
- assets/images/bioedilizia
- assets/images/categories_images
- assets/images/flags
- assets/images/frutto
- assets/images/verdure
- assets/images/admin
- assets/images/grocery_images
- assets/images/home
- assets/images/hotel
- assets/images/inspiration
- assets/images/screenshots
- assets/json
- assets/language
- assets/fonts
- assets/fonts/gilroy


# To add assets to your application, add an assets section, like this:
# assets:
#   - images/a_dot_burr.jpeg
#   - images/a_dot_ham.jpeg

# An image asset can refer to one or more resolution-specific "variants", see
# https://flutter.dev/assets-and-images/#resolution-aware

# For details regarding adding assets from package dependencies, see
# https://flutter.dev/assets-and-images/#from-packages

# To add custom fonts to your application, add a fonts section here,
# in this "flutter" section. Each entry in this list should have a
# "family" key with the font family name, and a "fonts" key with a
# list giving the asset and other descriptors for the font. For
# example:
# fonts:
#   - family: Schyler
#     fonts:
#       - asset: fonts/Schyler-Regular.ttf
#       - asset: fonts/Schyler-Italic.ttf
#         style: italic
#   - family: Trajan Pro
#     fonts:
#       - asset: fonts/TrajanPro.ttf
#       - asset: fonts/TrajanPro_Bold.ttf
#         weight: 700
#
# For details regarding fonts from package dependencies,
# see https://flutter.dev/custom-fonts/#from-packages
