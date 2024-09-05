/****************************************************************************
** Meta object code from reading C++ file 'backend.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.7.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/include/backend.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'backend.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.7.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSBackendENDCLASS_t {};
constexpr auto qt_meta_stringdata_CLASSBackendENDCLASS = QtMocHelpers::stringData(
    "Backend",
    "batteryPercentageChanged",
    "",
    "batteryVoltageChanged",
    "batteryCurrentChanged",
    "robotModeChanged",
    "robotStatusChanged",
    "robotDetailChanged",
    "robotErrorChanged",
    "getNameChanged",
    "getIPChanged",
    "getControlChanged",
    "getFastechInputChanged",
    "getFastechOutputChanged",
    "velChanged",
    "volumePercentageChanged",
    "systemStatusChanged",
    "getFastechRear",
    "index",
    "getFastechFront",
    "resetError",
    "requestMode",
    "str",
    "requestControl",
    "setVolume",
    "percent",
    "getVolume",
    "shutdown",
    "state",
    "getVolume_on_off",
    "i",
    "requestStop",
    "requestReset",
    "change_to_japan",
    "change_to_eng",
    "getNameAGV",
    "getIP",
    "getIPServer",
    "initColor",
    "setDataBuffer",
    "id",
    "setDataQueue",
    "saveDataBuffer",
    "jsonstring",
    "saveDataQueue",
    "deleteDataBuffer",
    "deleteDataQueue",
    "getStateSystem",
    "batteryPercentage",
    "batteryVoltage",
    "batteryCurrent",
    "robotStatus",
    "robotDetail",
    "robotError",
    "getControl",
    "robotMode",
    "getLinear",
    "getAngular",
    "systemStatus"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSBackendENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
      39,   14, // methods
      11,  317, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      15,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,  248,    2, 0x06,   12 /* Public */,
       3,    0,  249,    2, 0x06,   13 /* Public */,
       4,    0,  250,    2, 0x06,   14 /* Public */,
       5,    0,  251,    2, 0x06,   15 /* Public */,
       6,    0,  252,    2, 0x06,   16 /* Public */,
       7,    0,  253,    2, 0x06,   17 /* Public */,
       8,    0,  254,    2, 0x06,   18 /* Public */,
       9,    0,  255,    2, 0x06,   19 /* Public */,
      10,    0,  256,    2, 0x06,   20 /* Public */,
      11,    0,  257,    2, 0x06,   21 /* Public */,
      12,    0,  258,    2, 0x06,   22 /* Public */,
      13,    0,  259,    2, 0x06,   23 /* Public */,
      14,    0,  260,    2, 0x06,   24 /* Public */,
      15,    0,  261,    2, 0x06,   25 /* Public */,
      16,    0,  262,    2, 0x06,   26 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
      17,    1,  263,    2, 0x02,   27 /* Public */,
      19,    1,  266,    2, 0x02,   29 /* Public */,
      20,    0,  269,    2, 0x02,   31 /* Public */,
      21,    1,  270,    2, 0x02,   32 /* Public */,
      23,    1,  273,    2, 0x02,   34 /* Public */,
      24,    1,  276,    2, 0x02,   36 /* Public */,
      26,    0,  279,    2, 0x02,   38 /* Public */,
      27,    1,  280,    2, 0x02,   39 /* Public */,
      29,    1,  283,    2, 0x02,   41 /* Public */,
      31,    1,  286,    2, 0x02,   43 /* Public */,
      32,    1,  289,    2, 0x02,   45 /* Public */,
      33,    0,  292,    2, 0x02,   47 /* Public */,
      34,    0,  293,    2, 0x02,   48 /* Public */,
      35,    0,  294,    2, 0x02,   49 /* Public */,
      36,    0,  295,    2, 0x02,   50 /* Public */,
      37,    0,  296,    2, 0x02,   51 /* Public */,
      38,    0,  297,    2, 0x02,   52 /* Public */,
      39,    1,  298,    2, 0x02,   53 /* Public */,
      41,    1,  301,    2, 0x02,   55 /* Public */,
      42,    1,  304,    2, 0x02,   57 /* Public */,
      44,    1,  307,    2, 0x02,   59 /* Public */,
      45,    1,  310,    2, 0x02,   61 /* Public */,
      46,    1,  313,    2, 0x02,   63 /* Public */,
      47,    0,  316,    2, 0x02,   65 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Int, QMetaType::Int,   18,
    QMetaType::Int, QMetaType::Int,   18,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   22,
    QMetaType::Void, QMetaType::QString,   22,
    QMetaType::Int, QMetaType::Int,   25,
    QMetaType::Int,
    QMetaType::Void, QMetaType::Int,   28,
    QMetaType::Void, QMetaType::Int,   30,
    QMetaType::Void, QMetaType::QString,   22,
    QMetaType::Void, QMetaType::QString,   22,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::QString,
    QMetaType::QString,
    QMetaType::QString,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   40,
    QMetaType::Void, QMetaType::Int,   40,
    QMetaType::Void, QMetaType::QString,   43,
    QMetaType::Void, QMetaType::QString,   43,
    QMetaType::Void, QMetaType::QString,   43,
    QMetaType::Void, QMetaType::QString,   43,
    QMetaType::QString,

 // properties: name, type, flags
      48, QMetaType::Double, 0x00015001, uint(0), 0,
      49, QMetaType::Double, 0x00015001, uint(1), 0,
      50, QMetaType::Double, 0x00015001, uint(2), 0,
      51, QMetaType::QString, 0x00015001, uint(4), 0,
      52, QMetaType::QString, 0x00015001, uint(5), 0,
      53, QMetaType::QString, 0x00015001, uint(6), 0,
      54, QMetaType::QString, 0x00015001, uint(9), 0,
      55, QMetaType::QString, 0x00015001, uint(3), 0,
      56, QMetaType::Double, 0x00015001, uint(12), 0,
      57, QMetaType::Double, 0x00015001, uint(12), 0,
      58, QMetaType::QString, 0x00015001, uint(14), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject Backend::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSBackendENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSBackendENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSBackendENDCLASS_t,
        // property 'batteryPercentage'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'batteryVoltage'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'batteryCurrent'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'robotStatus'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'robotDetail'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'robotError'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'getControl'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'robotMode'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'getLinear'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'getAngular'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'systemStatus'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<Backend, std::true_type>,
        // method 'batteryPercentageChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'batteryVoltageChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'batteryCurrentChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'robotModeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'robotStatusChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'robotDetailChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'robotErrorChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'getNameChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'getIPChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'getControlChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'getFastechInputChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'getFastechOutputChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'velChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'volumePercentageChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'systemStatusChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'getFastechRear'
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'getFastechFront'
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'resetError'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'requestMode'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'requestControl'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'setVolume'
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'getVolume'
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'shutdown'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'getVolume_on_off'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'requestStop'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'requestReset'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'change_to_japan'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'change_to_eng'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'getNameAGV'
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'getIP'
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'getIPServer'
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'initColor'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'setDataBuffer'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'setDataQueue'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'saveDataBuffer'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'saveDataQueue'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'deleteDataBuffer'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'deleteDataQueue'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'getStateSystem'
        QtPrivate::TypeAndForceComplete<QString, std::false_type>
    >,
    nullptr
} };

void Backend::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Backend *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->batteryPercentageChanged(); break;
        case 1: _t->batteryVoltageChanged(); break;
        case 2: _t->batteryCurrentChanged(); break;
        case 3: _t->robotModeChanged(); break;
        case 4: _t->robotStatusChanged(); break;
        case 5: _t->robotDetailChanged(); break;
        case 6: _t->robotErrorChanged(); break;
        case 7: _t->getNameChanged(); break;
        case 8: _t->getIPChanged(); break;
        case 9: _t->getControlChanged(); break;
        case 10: _t->getFastechInputChanged(); break;
        case 11: _t->getFastechOutputChanged(); break;
        case 12: _t->velChanged(); break;
        case 13: _t->volumePercentageChanged(); break;
        case 14: _t->systemStatusChanged(); break;
        case 15: { int _r = _t->getFastechRear((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 16: { int _r = _t->getFastechFront((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 17: _t->resetError(); break;
        case 18: _t->requestMode((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 19: _t->requestControl((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 20: { int _r = _t->setVolume((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 21: { int _r = _t->getVolume();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 22: _t->shutdown((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 23: _t->getVolume_on_off((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 24: _t->requestStop((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 25: _t->requestReset((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 26: _t->change_to_japan(); break;
        case 27: _t->change_to_eng(); break;
        case 28: { QString _r = _t->getNameAGV();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 29: { QString _r = _t->getIP();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 30: { QString _r = _t->getIPServer();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 31: _t->initColor(); break;
        case 32: _t->setDataBuffer((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 33: _t->setDataQueue((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 34: _t->saveDataBuffer((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 35: _t->saveDataQueue((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 36: _t->deleteDataBuffer((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 37: _t->deleteDataQueue((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 38: { QString _r = _t->getStateSystem();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::batteryPercentageChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::batteryVoltageChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::batteryCurrentChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::robotModeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::robotStatusChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::robotDetailChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::robotErrorChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::getNameChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::getIPChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::getControlChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 9;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::getFastechInputChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 10;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::getFastechOutputChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 11;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::velChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 12;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::volumePercentageChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 13;
                return;
            }
        }
        {
            using _t = void (Backend::*)();
            if (_t _q_method = &Backend::systemStatusChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 14;
                return;
            }
        }
    } else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Backend *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< double*>(_v) = _t->batteryPercentage(); break;
        case 1: *reinterpret_cast< double*>(_v) = _t->batteryVoltage(); break;
        case 2: *reinterpret_cast< double*>(_v) = _t->batteryCurrent(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->robotStatus(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->robotDetail(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->robotError(); break;
        case 6: *reinterpret_cast< QString*>(_v) = _t->getControl(); break;
        case 7: *reinterpret_cast< QString*>(_v) = _t->robotMode(); break;
        case 8: *reinterpret_cast< double*>(_v) = _t->getLinear(); break;
        case 9: *reinterpret_cast< double*>(_v) = _t->getAngular(); break;
        case 10: *reinterpret_cast< QString*>(_v) = _t->systemStatus(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *Backend::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Backend::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSBackendENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Backend::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 39)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 39;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 39)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 39;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
    return _id;
}

// SIGNAL 0
void Backend::batteryPercentageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Backend::batteryVoltageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Backend::batteryCurrentChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Backend::robotModeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void Backend::robotStatusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void Backend::robotDetailChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void Backend::robotErrorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void Backend::getNameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void Backend::getIPChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void Backend::getControlChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void Backend::getFastechInputChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void Backend::getFastechOutputChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}

// SIGNAL 12
void Backend::velChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void Backend::volumePercentageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}

// SIGNAL 14
void Backend::systemStatusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 14, nullptr);
}
QT_WARNING_POP
