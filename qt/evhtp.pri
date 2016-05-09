contains(QT_ARCH,i386) {
}
contains(QT_ARCH,x86_64) {
    DEFINES+=EVHTP_SYS_ARCH=64
}
EVHTP_DIR=$$PWD/../3rdparty/libevhtp

INCLUDEPATH +=$$EVHTP_DIR
INCLUDEPATH += $$EVHTP_DIR/compat
INCLUDEPATH += $$EVHTP_DIR/htparse
INCLUDEPATH += $$EVHTP_DIR/oniguruma

HEADERS += evhtp-config.h
HEADERS += $$EVHTP_DIR/evhtp.h
HEADERS += $$EVHTP_DIR/htparse.h
HEADERS += $$EVHTP_DIR/evhtp_numtoa.h
HEADERS += $$EVHTP_DIR/evthr.h


SOURCES += $$EVHTP_DIR/evhtp.c
SOURCES += $$EVHTP_DIR/htparse.c
SOURCES += $$EVHTP_DIR/evhtp_numtoa.c
SOURCES += $$EVHTP_DIR/evthr.c

LIBS += -levent -levent_pthreads -levent_extra -levent_openssl -lssl -lcrypto
