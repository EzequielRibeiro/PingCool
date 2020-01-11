#-------------------------------------------------
#
# Project created by QtCreator 2015-06-10T23:28:49
#
#-------------------------------------------------

# For android target in main project assign
# ANDROID_PACKAGE_SOURCE_DIR variable to your
# manifest location

SOURCES += \
    $$PWD/admob/QtAdMobBannerAndroid.cpp \
    $$PWD/admob//QtAdMobBannerDummy.cpp \
    $$PWD/admob//QtAdMobInterstitialAndroid.cpp \
    $$PWD/admob//QtAdMobInterstitialDummy.cpp \
    $$PWD/admob//QtAdmobBanner.cpp \
    $$PWD/admob//QtAdmobInterstitial.cpp

OBJECTIVE_SOURCES += \
    $$PWD/admob/QtAdMobBannerIos.mm \
    $$PWD/admob/QtAdMobInterstitialIos.mm

HEADERS  += \
    $$PWD/admob/IQtAdMobBanner.h \
    $$PWD/admob/QtAdMobBannerAndroid.h \
    $$PWD/admob/QtAdMobBannerIos.h \
    $$PWD/admob/QtAdMobBannerDummy.h \
    $$PWD/admob/QtAdMobBanner.h \
    $$PWD/admob/IQtAdMobInterstitial.h \
    $$PWD/admob/QtAdMobInterstitial.h \
    $$PWD/admob/QtAdMobInterstitialIos.h \
    $$PWD/admob/QtAdMobInterstitialAndroid.h \
    $$PWD/admob/QtAdMobInterstitialDummy.h

ios {
    ios:QMAKE_CXXFLAGS += -fobjc-arc
    ios:QMAKE_LFLAGS += -ObjC
    ios:QT += gui_private
    ios:LIBS += -F $$PWD/ios/GoogleMobileAds -framework GoogleMobileAds \
                -framework AVFoundation \
                -framework AudioToolbox \
                -framework CoreTelephony \
                -framework MessageUI \
                -framework SystemConfiguration \
                -framework CoreGraphics \
                -framework AdSupport \
                -framework StoreKit \
                -framework EventKit \
                -framework EventKitUI \
                -framework CoreMedia \
                -framework MediaPlayer \
                -framework SafariServices \
                -framework GLKit \
                -framework CoreMotion \
                -framework CoreVideo \
                -framework MobileCoreServices
}

android {
    android:QT += androidextras gui-private

    !exists($$ANDROID_PACKAGE_SOURCE_DIR/src/org/ping/cool)
    {
        copydata.commands += $(COPY_DIR) $$shell_path($$PWD/android/src) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR)
    }

    first.depends = $(first) copydata
    export(first.depends)
    export(copydata.commands)
    android:QMAKE_EXTRA_TARGETS += first copydata
}
