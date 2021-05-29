#import "CountryPickerPlugin.h"
#if __has_include(<country_picker/country_picker-Swift.h>)
#import <country_picker/country_picker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "country_picker-Swift.h"
#endif

@implementation CountryPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCountryPickerPlugin registerWithRegistrar:registrar];
}
@end
