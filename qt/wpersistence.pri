contains(QT_ARCH,i386) {
}
contains(QT_ARCH,x86_64) {
    DEFINES+=EVHTP_SYS_ARCH=64
}

PERISTENCE_DIR=$$PWD/../persistence

#INCLUDEPATH += $$PWD
#INCLUDEPATH += $$PWD/compat
#INCLUDEPATH += $$PWD/htparse
#INCLUDEPATH += $$PWD/3rdparty/libevhtp
#INCLUDEPATH += $$PWD/3rdparty/libevhtp/compat
#INCLUDEPATH += $$PWD/3rdparty/libevhtp/oniguruma
#INCLUDEPATH += $$PWD/3rdparty/synth
#HEADERS += $$PWD/evhtp-config.h
#HEADERS += $$PWD/evhtp.h
#HEADERS += $$PWD/htparse.h
#HEADERS += $$PWD/evhtp_numtoa.h


#SOURCES += $$PWD/evhtp.c
#SOURCES += $$PWD/htparse.c
#SOURCES += $$PWD/evhtp_numtoa.c


HEADERS += $$PERISTENCE_DIR/adapter.hpp
HEADERS += $$PERISTENCE_DIR/assign_attributes.hpp
HEADERS += $$PERISTENCE_DIR/association.hpp
HEADERS += $$PERISTENCE_DIR/ast.hpp
HEADERS += $$PERISTENCE_DIR/belongs_to.hpp
HEADERS += $$PERISTENCE_DIR/column.hpp
HEADERS += $$PERISTENCE_DIR/column_abilities.hpp
HEADERS += $$PERISTENCE_DIR/column_traits.hpp
HEADERS += $$PERISTENCE_DIR/connection.hpp
HEADERS += $$PERISTENCE_DIR/connection_pool.hpp
HEADERS += $$PERISTENCE_DIR/connection_provider.hpp
HEADERS += $$PERISTENCE_DIR/connection_retainer.hpp
HEADERS += $$PERISTENCE_DIR/context.hpp
HEADERS += $$PERISTENCE_DIR/create.hpp
HEADERS += $$PERISTENCE_DIR/data_as_literal.hpp
HEADERS += $$PERISTENCE_DIR/data_store.hpp
HEADERS += $$PERISTENCE_DIR/datetime.hpp
HEADERS += $$PERISTENCE_DIR/destroy.hpp
HEADERS += $$PERISTENCE_DIR/has_many.hpp
HEADERS += $$PERISTENCE_DIR/has_one.hpp
HEADERS += $$PERISTENCE_DIR/insert.hpp
HEADERS += $$PERISTENCE_DIR/p.hpp
HEADERS += $$PERISTENCE_DIR/persistence_macro.hpp
HEADERS += $$PERISTENCE_DIR/primary_key.hpp
HEADERS += $$PERISTENCE_DIR/projection.hpp
HEADERS += $$PERISTENCE_DIR/projection_as_structured_data.hpp
HEADERS += $$PERISTENCE_DIR/property.hpp
HEADERS += $$PERISTENCE_DIR/record.hpp
HEADERS += $$PERISTENCE_DIR/record_as_structured_data.hpp
HEADERS += $$PERISTENCE_DIR/record_ptr.hpp
HEADERS += $$PERISTENCE_DIR/record_type.hpp
HEADERS += $$PERISTENCE_DIR/record_type_builder.hpp
HEADERS += $$PERISTENCE_DIR/relational_algebra.hpp
HEADERS += $$PERISTENCE_DIR/result_set.hpp
HEADERS += $$PERISTENCE_DIR/validation_errors.hpp

SOURCES += $$PERISTENCE_DIR/adapter.cpp
SOURCES += $$PERISTENCE_DIR/assign_attributes.cpp
SOURCES += $$PERISTENCE_DIR/column.cpp
SOURCES += $$PERISTENCE_DIR/connection_pool.cpp
SOURCES += $$PERISTENCE_DIR/connection_provider.cpp
SOURCES += $$PERISTENCE_DIR/connection_retainer.cpp
SOURCES += $$PERISTENCE_DIR/data_as_literal.cpp
SOURCES += $$PERISTENCE_DIR/data_store.cpp
#SOURCES += $$PERISTENCE_DIR/datetime.cpp
SOURCES += $$PERISTENCE_DIR/insert.cpp
SOURCES += $$PERISTENCE_DIR/primary_key.cpp
SOURCES += $$PERISTENCE_DIR/projection.cpp
SOURCES += $$PERISTENCE_DIR/property.cpp
SOURCES += $$PERISTENCE_DIR/relational_algebra.cpp
#SOURCES += $$PERISTENCE_DIR/p.cpp
