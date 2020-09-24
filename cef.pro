QT += quick quickwidgets core

CONFIG += c++11
CONFIG += qtquickcompiler
CONFIG+=qml_debug

TARGET=cef

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


HEADERS+= \
        $$PWD/QCefView/QCefView.h \
        $$PWD/QCefClient/QCefClient.h \
        $$PWD/QCefApp/QCefApp.h \
        $$PWD/QCefContext/QCefContext.h \
        MainDlg/MainDlg.h \
        test.h \
        $$PWD/QCefRenderHandler/QCefRenderHandler.h \
        $$PWD/QCefV8Handler/QCefV8Handler.h

SOURCES += \
        MainDlg/MainDlg.cpp \
        main.cpp \
        $$PWD/QCefView/QCefView.cpp \
        $$PWD/QCefClient/QCefClient.cpp \
        $$PWD/QCefApp/QCefApp.cpp \
        $$PWD/QCefContext/QCefContext.cpp \
        test.cpp \
        $$PWD/QCefRenderHandler/QCefRenderHandler.cpp \
        $$PWD/QCefV8Handler/QCefV8Handler.cpp
RESOURCES += $$PWD/qml/qml.qrc


win32:{
   INCLUDEPATH+=$$PWD/libs/win/cef
   LIBS+=-L$$PWD/libs/win/cef/lib -llibcef_dll_wrapper -llibcef
   LIBS+=-luser32
}

FORMS +=