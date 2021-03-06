TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

CONFIG += c++1y
QMAKE_CXXFLAGS += -std=c++1y
QMAKE_LFLAGS +=  -std=c++1y

INCLUDEPATH += ../

win32 {
    LIBS  += -lkernel32 -ladvapi32 -luser32 -lws2_32 -lwsock32 -lcrypt32 -lIphlpapi -lPsapi -lsetupapi
    contains(QT_ARCH,i386) {
        INCLUDEPATH += "C:/Qt/Qt5.5.0/Tools/mingw492_32/include/"
        INCLUDEPATH += "C:/Qt/Qt5.5.0/Tools/mingw492_32/include/mariadb"
        LIBS  += -LC:/Qt/Qt5.5.0/Tools/mingw492_32/lib
        LIBS  += -LC:/Qt/Qt5.5.0/Tools/mingw492_32/lib/mariadb
        message("32 bit $${LIBS}")
    }
    contains(QT_ARCH,x86_64) {
        INCLUDEPATH += C:/msys2/mingw64/include/mariadb
        LIBS  += -lz
        LIBS  += -LC:/msys2/mingw64/lib
        message("64 bit $${LIBS}")
    }
}else:macx{
}else:unix{
    LIBS  += -lz -lpthread -ldl -lunwind -lpq -lmysqlclient
    INCLUDEPATH += /usr/include/postgresql
}

include(deployment.pri)
qtcAddDeployment()
include (evhtp.pri)
include (wpersistence.pri)
include (wayward.pri)

#SOURCES += main.cpp

OTHER_FILES += ../examples/blog/models.hpp

#SOURCES += ../test.cpp
#OTHER_FILES += ../examples/blog/blog.cpp

SOURCES += ../examples/blog/blog.cpp
OTHER_FILES += ../test.cpp

OTHER_FILES += ../SConstruct
OTHER_FILES += ../wayward_build.py
OTHER_FILES += ../CMakeLists.txt
OTHER_FILES += ../w_util/CMakeLists.txt
OTHER_FILES += ../examples/blog/CMakeLists.txt

INCLUDEPATH=$$unique(INCLUDEPATH)
QMAKE_CFLAGS=$$unique(QMAKE_CFLAGS)
QMAKE_CXXFLAGS=$$unique(QMAKE_CXXFLAGS)
QMAKE_LFLAGS=$$unique(QMAKE_LFLAGS)
