contains(QT_ARCH,i386) {
}
contains(QT_ARCH,x86_64) {
    DEFINES+=EVHTP_SYS_ARCH=64
}
WAYWARD_DIR=$$PWD/../wayward
#INCLUDEPATH += $$PWD
#INCLUDEPATH += $$PWD/compat
#INCLUDEPATH += $$PWD/htparse
#INCLUDEPATH += $$PWD/3rdparty/libevhtp
#INCLUDEPATH += $$PWD/3rdparty/libevhtp/compat
#INCLUDEPATH += $$PWD/3rdparty/libevhtp/oniguruma
INCLUDEPATH += $$PWD/../3rdparty/synth

HEADERS += $$WAYWARD_DIR/support/data_franca/adapter.hpp
HEADERS += $$WAYWARD_DIR/support/data_franca/adapters.hpp
HEADERS += $$WAYWARD_DIR/support/data_franca/mutator.hpp
HEADERS += $$WAYWARD_DIR/support/data_franca/object.hpp
HEADERS += $$WAYWARD_DIR/support/data_franca/reader.hpp
HEADERS += $$WAYWARD_DIR/support/data_franca/spectator.hpp
HEADERS += $$WAYWARD_DIR/support/data_franca/types.hpp
HEADERS += $$WAYWARD_DIR/support/data_franca/writer.hpp

SOURCES += $$WAYWARD_DIR/support/data_franca/mutator.cpp
SOURCES += $$WAYWARD_DIR/support/data_franca/object.cpp
SOURCES += $$WAYWARD_DIR/support/data_franca/spectator.cpp

HEADERS += $$WAYWARD_DIR/support/datetime/clock.hpp
HEADERS += $$WAYWARD_DIR/support/datetime/datetime.hpp
HEADERS += $$WAYWARD_DIR/support/datetime/duration_units.hpp
HEADERS += $$WAYWARD_DIR/support/datetime/interval.hpp
HEADERS += $$WAYWARD_DIR/support/datetime/private.hpp
HEADERS += $$WAYWARD_DIR/support/datetime/timezone.hpp
HEADERS += $$WAYWARD_DIR/support/datetime/type.hpp

SOURCES += $$WAYWARD_DIR/support/datetime/clock.cpp
SOURCES += $$WAYWARD_DIR/support/datetime/datetime.cpp
SOURCES += $$WAYWARD_DIR/support/datetime/interval.cpp
SOURCES += $$WAYWARD_DIR/support/datetime/type.cpp

HEADERS += $$WAYWARD_DIR/support/any.hpp
HEADERS += $$WAYWARD_DIR/support/benchmark.hpp
HEADERS += $$WAYWARD_DIR/support/bitflags.hpp
HEADERS += $$WAYWARD_DIR/support/cloning_ptr.hpp
HEADERS += $$WAYWARD_DIR/support/command_line_options.hpp
HEADERS += $$WAYWARD_DIR/support/data_franca.hpp
HEADERS += $$WAYWARD_DIR/support/data_visitor.hpp
HEADERS += $$WAYWARD_DIR/support/datetime.hpp
HEADERS += $$WAYWARD_DIR/support/either.hpp
HEADERS += $$WAYWARD_DIR/support/error.hpp
HEADERS += $$WAYWARD_DIR/support/event_loop.hpp
HEADERS += $$WAYWARD_DIR/support/event_loop_private.hpp
HEADERS += $$WAYWARD_DIR/support/fiber.hpp
HEADERS += $$WAYWARD_DIR/support/format.hpp
HEADERS += $$WAYWARD_DIR/support/http.hpp
HEADERS += $$WAYWARD_DIR/support/intrusive_list.hpp
HEADERS += $$WAYWARD_DIR/support/json.hpp
HEADERS += $$WAYWARD_DIR/support/logger.hpp
HEADERS += $$WAYWARD_DIR/support/maybe.hpp
HEADERS += $$WAYWARD_DIR/support/meta.hpp
HEADERS += $$WAYWARD_DIR/support/monad.hpp
HEADERS += $$WAYWARD_DIR/support/options.hpp
HEADERS += $$WAYWARD_DIR/support/plugin.hpp
HEADERS += $$WAYWARD_DIR/support/result.hpp
HEADERS += $$WAYWARD_DIR/support/string.hpp
HEADERS += $$WAYWARD_DIR/support/teamwork.hpp
HEADERS += $$WAYWARD_DIR/support/thread_local.hpp
HEADERS += $$WAYWARD_DIR/support/type.hpp
HEADERS += $$WAYWARD_DIR/support/types.hpp
HEADERS += $$WAYWARD_DIR/support/type_info.hpp
HEADERS += $$WAYWARD_DIR/support/uri.hpp

SOURCES += $$WAYWARD_DIR/support/any.cpp
#SOURCES += $$WAYWARD_DIR/support/benchmark.cpp
SOURCES += $$WAYWARD_DIR/support/command_line_options.cpp
SOURCES += $$WAYWARD_DIR/support/error.cpp
SOURCES += $$WAYWARD_DIR/support/event_loop.cpp
SOURCES += $$WAYWARD_DIR/support/fiber.cpp
SOURCES += $$WAYWARD_DIR/support/format.cpp
SOURCES += $$WAYWARD_DIR/support/http.cpp
SOURCES += $$WAYWARD_DIR/support/json.cpp
SOURCES += $$WAYWARD_DIR/support/logger.cpp
SOURCES += $$WAYWARD_DIR/support/plugin.cpp
SOURCES += $$WAYWARD_DIR/support/string.cpp
SOURCES += $$WAYWARD_DIR/support/teamwork.cpp
SOURCES += $$WAYWARD_DIR/support/types.cpp
SOURCES += $$WAYWARD_DIR/support/uri.cpp

HEADERS += $$WAYWARD_DIR/content_type.hpp
HEADERS += $$WAYWARD_DIR/respond_to.hpp
#HEADERS += $$WAYWARD_DIR/routes.hpp
HEADERS += $$WAYWARD_DIR/session.hpp
HEADERS += $$WAYWARD_DIR/template_engine.hpp
HEADERS += $$WAYWARD_DIR/w.hpp

#SOURCES += $$WAYWARD_DIR/synth/synth.cpp

SOURCES += $$WAYWARD_DIR/app.cpp
SOURCES += $$WAYWARD_DIR/content_type.cpp
SOURCES += $$WAYWARD_DIR/log.cpp
SOURCES += $$WAYWARD_DIR/render.cpp
SOURCES += $$WAYWARD_DIR/respond_to.cpp
SOURCES += $$WAYWARD_DIR/template_engine.cpp
OTHER_FILES += $$WAYWARD_DIR/CMakeLists.txt

