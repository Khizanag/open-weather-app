//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 12 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `accent`.
    static let accent = Rswift.ColorResource(bundle: R.hostingBundle, name: "accent")
    /// Color `background-color`.
    static let backgroundColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "background-color")
    /// Color `bg-gradient-end`.
    static let bgGradientEnd = Rswift.ColorResource(bundle: R.hostingBundle, name: "bg-gradient-end")
    /// Color `bg-gradient-start`.
    static let bgGradientStart = Rswift.ColorResource(bundle: R.hostingBundle, name: "bg-gradient-start")
    /// Color `blue-gradient-end`.
    static let blueGradientEnd = Rswift.ColorResource(bundle: R.hostingBundle, name: "blue-gradient-end")
    /// Color `blue-gradient-start`.
    static let blueGradientStart = Rswift.ColorResource(bundle: R.hostingBundle, name: "blue-gradient-start")
    /// Color `green-gradient-end`.
    static let greenGradientEnd = Rswift.ColorResource(bundle: R.hostingBundle, name: "green-gradient-end")
    /// Color `green-gradient-start`.
    static let greenGradientStart = Rswift.ColorResource(bundle: R.hostingBundle, name: "green-gradient-start")
    /// Color `ochre-gradient-end`.
    static let ochreGradientEnd = Rswift.ColorResource(bundle: R.hostingBundle, name: "ochre-gradient-end")
    /// Color `ochre-gradient-start`.
    static let ochreGradientStart = Rswift.ColorResource(bundle: R.hostingBundle, name: "ochre-gradient-start")
    /// Color `primary-color`.
    static let primaryColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "primary-color")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "accent", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accent(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accent, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "background-color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func backgroundColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.backgroundColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "bg-gradient-end", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func bgGradientEnd(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.bgGradientEnd, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "bg-gradient-start", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func bgGradientStart(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.bgGradientStart, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "blue-gradient-end", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func blueGradientEnd(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.blueGradientEnd, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "blue-gradient-start", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func blueGradientStart(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.blueGradientStart, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "green-gradient-end", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func greenGradientEnd(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.greenGradientEnd, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "green-gradient-start", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func greenGradientStart(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.greenGradientStart, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ochre-gradient-end", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func ochreGradientEnd(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.ochreGradientEnd, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ochre-gradient-start", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func ochreGradientStart(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.ochreGradientStart, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "primary-color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func primaryColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.primaryColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "accent", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accent(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accent.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "background-color", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func backgroundColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.backgroundColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "bg-gradient-end", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func bgGradientEnd(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.bgGradientEnd.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "bg-gradient-start", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func bgGradientStart(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.bgGradientStart.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "blue-gradient-end", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func blueGradientEnd(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.blueGradientEnd.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "blue-gradient-start", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func blueGradientStart(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.blueGradientStart.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "green-gradient-end", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func greenGradientEnd(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.greenGradientEnd.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "green-gradient-start", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func greenGradientStart(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.greenGradientStart.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "ochre-gradient-end", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func ochreGradientEnd(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.ochreGradientEnd.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "ochre-gradient-start", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func ochreGradientStart(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.ochreGradientStart.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "primary-color", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func primaryColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.primaryColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 11 images.
  struct image {
    /// Image `celsius`.
    static let celsius = Rswift.ImageResource(bundle: R.hostingBundle, name: "celsius")
    /// Image `compass`.
    static let compass = Rswift.ImageResource(bundle: R.hostingBundle, name: "compass")
    /// Image `data_load_error`.
    static let data_load_error = Rswift.ImageResource(bundle: R.hostingBundle, name: "data_load_error")
    /// Image `drop`.
    static let drop = Rswift.ImageResource(bundle: R.hostingBundle, name: "drop")
    /// Image `icon`.
    static let icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon")
    /// Image `pressure`.
    static let pressure = Rswift.ImageResource(bundle: R.hostingBundle, name: "pressure")
    /// Image `raining`.
    static let raining = Rswift.ImageResource(bundle: R.hostingBundle, name: "raining")
    /// Image `sun`.
    static let sun = Rswift.ImageResource(bundle: R.hostingBundle, name: "sun")
    /// Image `tab_forecast`.
    static let tab_forecast = Rswift.ImageResource(bundle: R.hostingBundle, name: "tab_forecast")
    /// Image `tab_today`.
    static let tab_today = Rswift.ImageResource(bundle: R.hostingBundle, name: "tab_today")
    /// Image `wind`.
    static let wind = Rswift.ImageResource(bundle: R.hostingBundle, name: "wind")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "celsius", bundle: ..., traitCollection: ...)`
    static func celsius(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.celsius, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "compass", bundle: ..., traitCollection: ...)`
    static func compass(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.compass, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "data_load_error", bundle: ..., traitCollection: ...)`
    static func data_load_error(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.data_load_error, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "drop", bundle: ..., traitCollection: ...)`
    static func drop(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.drop, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "icon", bundle: ..., traitCollection: ...)`
    static func icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pressure", bundle: ..., traitCollection: ...)`
    static func pressure(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pressure, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "raining", bundle: ..., traitCollection: ...)`
    static func raining(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.raining, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "sun", bundle: ..., traitCollection: ...)`
    static func sun(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sun, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "tab_forecast", bundle: ..., traitCollection: ...)`
    static func tab_forecast(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tab_forecast, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "tab_today", bundle: ..., traitCollection: ...)`
    static func tab_today(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tab_today, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "wind", bundle: ..., traitCollection: ...)`
    static func wind(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.wind, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 5 nibs.
  struct nib {
    /// Nib `ErrorView`.
    static let errorView = _R.nib._ErrorView()
    /// Nib `ForecastTableHeaderView`.
    static let forecastTableHeaderView = _R.nib._ForecastTableHeaderView()
    /// Nib `ForecastTableViewCell`.
    static let forecastTableViewCell = _R.nib._ForecastTableViewCell()
    /// Nib `LoaderComponentView`.
    static let loaderComponentView = _R.nib._LoaderComponentView()
    /// Nib `TodayDetailItemView`.
    static let todayDetailItemView = _R.nib._TodayDetailItemView()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ErrorView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.errorView) instead")
    static func errorView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.errorView)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ForecastTableHeaderView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.forecastTableHeaderView) instead")
    static func forecastTableHeaderView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.forecastTableHeaderView)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ForecastTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.forecastTableViewCell) instead")
    static func forecastTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.forecastTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "LoaderComponentView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.loaderComponentView) instead")
    static func loaderComponentView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.loaderComponentView)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "TodayDetailItemView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.todayDetailItemView) instead")
    static func todayDetailItemView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.todayDetailItemView)
    }
    #endif

    static func errorView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.errorView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func forecastTableHeaderView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ForecastTableHeaderView? {
      return R.nib.forecastTableHeaderView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ForecastTableHeaderView
    }

    static func forecastTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ForecastTableViewCell? {
      return R.nib.forecastTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ForecastTableViewCell
    }

    static func loaderComponentView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.loaderComponentView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func todayDetailItemView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.todayDetailItemView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localization` struct is generated, and contains static references to 4 localization keys.
    struct localization {
      /// en translation: Application needs permission to use your location. To show weather, please go to settings and allow application use your location.
      ///
      /// Locales: en
      static let error_message_no_location_authorized = Rswift.StringResource(key: "error_message_no_location_authorized", tableName: "Localization", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Error occured while loading data
      ///
      /// Locales: en
      static let error_message_default_error = Rswift.StringResource(key: "error_message_default_error", tableName: "Localization", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Information was not allowed to load into the page. Please refresh page or try again later.
      ///
      /// Locales: en
      static let error_message_no_information_loaded = Rswift.StringResource(key: "error_message_no_information_loaded", tableName: "Localization", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: You  don't have internet connection. Please try using mobile intenet or WiFi and then refresh that page
      ///
      /// Locales: en
      static let error_message_no_internet = Rswift.StringResource(key: "error_message_no_internet", tableName: "Localization", bundle: R.hostingBundle, locales: ["en"], comment: nil)

      /// en translation: Application needs permission to use your location. To show weather, please go to settings and allow application use your location.
      ///
      /// Locales: en
      static func error_message_no_location_authorized(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error_message_no_location_authorized", tableName: "Localization", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localization", preferredLanguages: preferredLanguages) else {
          return "error_message_no_location_authorized"
        }

        return NSLocalizedString("error_message_no_location_authorized", tableName: "Localization", bundle: bundle, comment: "")
      }

      /// en translation: Error occured while loading data
      ///
      /// Locales: en
      static func error_message_default_error(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error_message_default_error", tableName: "Localization", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localization", preferredLanguages: preferredLanguages) else {
          return "error_message_default_error"
        }

        return NSLocalizedString("error_message_default_error", tableName: "Localization", bundle: bundle, comment: "")
      }

      /// en translation: Information was not allowed to load into the page. Please refresh page or try again later.
      ///
      /// Locales: en
      static func error_message_no_information_loaded(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error_message_no_information_loaded", tableName: "Localization", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localization", preferredLanguages: preferredLanguages) else {
          return "error_message_no_information_loaded"
        }

        return NSLocalizedString("error_message_no_information_loaded", tableName: "Localization", bundle: bundle, comment: "")
      }

      /// en translation: You  don't have internet connection. Please try using mobile intenet or WiFi and then refresh that page
      ///
      /// Locales: en
      static func error_message_no_internet(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error_message_no_internet", tableName: "Localization", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localization", preferredLanguages: preferredLanguages) else {
          return "error_message_no_internet"
        }

        return NSLocalizedString("error_message_no_internet", tableName: "Localization", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _ErrorView.validate()
    }

    struct _ErrorView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "ErrorView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      static func validate() throws {
        if UIKit.UIImage(named: "data_load_error", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'data_load_error' is used in nib 'ErrorView', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "blue-gradient-start", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'blue-gradient-start' is used in nib 'ErrorView', but couldn't be loaded.") }
          if UIKit.UIColor(named: "primary-color", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'primary-color' is used in nib 'ErrorView', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }

    struct _ForecastTableHeaderView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "ForecastTableHeaderView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ForecastTableHeaderView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ForecastTableHeaderView
      }

      fileprivate init() {}
    }

    struct _ForecastTableViewCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "ForecastTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ForecastTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ForecastTableViewCell
      }

      fileprivate init() {}
    }

    struct _LoaderComponentView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "LoaderComponentView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _TodayDetailItemView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "TodayDetailItemView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = RootTabBarController

      let bundle = R.hostingBundle
      let name = "Main"

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "cloud.moon") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'cloud.moon' is used in storyboard 'Main', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "raining", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'raining' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "tab_today", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'tab_today' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "AccentColor", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'AccentColor' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "background-color", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'background-color' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "primary-color", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'primary-color' is used in storyboard 'Main', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
