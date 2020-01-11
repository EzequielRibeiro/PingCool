QT += qml quick network concurrent core svg gui-private
CONFIG += c++11
DEFINES += QTADMOB_QML

android {
    QT += androidextras
}

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
        main.cpp \
        mytcpsocket.cpp \
        start.cpp \
        pingmodel.cpp \
        ping.cpp \

HEADERS += \
    start.h \
    mytcpsocket.h \
    pingmodel.h \
    ping.h \

RESOURCES += qml.qrc \


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


android {
    DISTFILES += \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat \
        android/app/build.gradle \
        android/google-services.json \
	android/src/org/ping/cool/QtAdMobActivity.java \

}

IOS_PACKAGE_SOURCE_DIR = $$PWD/ios
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
include(QtAdMob.pri)


ios:
{
    ios:QMAKE_INFO_PLIST = $$IOS_PACKAGE_SOURCE_DIR/Info.plist
    ios:QMAKE_IOS_DEPLOYMENT_TARGET = 7.0
}

DISTFILES += \
    ios/GoogleMobileAds/GoogleMobileAds.framework/GoogleMobileAds \
    ios/GoogleMobileAds/GoogleMobileAds.framework/Headers \
    ios/GoogleMobileAds/GoogleMobileAds.framework/Modules/module.modulemap \
    ios/GoogleMobileAds/GoogleMobileAds.framework/Versions/A/GoogleMobileAds \
    ios/GoogleMobileAds/GoogleMobileAds.framework/Versions/Current \
    ios/GoogleMobileAds/Mediation Adapters/README.txt \
    ios/GoogleMobileAds/README.txt



