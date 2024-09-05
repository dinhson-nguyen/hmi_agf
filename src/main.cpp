#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#include <ros/ros.h>
#include "include/backend.h"
#include <std_stamped_msgs/StringStamped.h>
#include <QTranslator>
#include <QDebug>
#include <QDir>
class hmiApp : public QObject {
    Q_OBJECT
private:
    ros::NodeHandle nh;
    QGuiApplication app;

    QQmlApplicationEngine engine;
    Backend backend;
    ros::Publisher hmi_status_pub;
    std_stamped_msgs::StringStamped hmi_msg;

    void set_qt_environment() {
        // qputenv( "QT_IM_MODULE", QByteArray( "qtvirtualkeyboard" ) );
        engine.rootContext()->setContextProperty("backend", &backend);
    }



public:

    void init_ros_timer() {
        QTimer* rosTimer = new QTimer(this);
        connect(rosTimer, &QTimer::timeout, this, [this]() {
            hmi_msg.stamp = ros::Time::now();
            hmi_status_pub.publish(hmi_msg);
            // backend.initColor();
            ros::spinOnce();
            });
        rosTimer->start(200); // Adjust the interval as needed
    }

    hmiApp(int argc, char** argv);
    
    int _exit();
};

hmiApp::hmiApp(int argc, char** argv)
    : app(argc, argv), nh() // Correct initialization of QGuiApplication
{

    // QTranslator* translator = new QTranslator();
    // translator->load(QStringLiteral(":/simplequick.qm"));
    // app.installTranslator(translator);

    // ROS_INFO_STREAM(status_);
    // app.installTranslator(&translator);
    set_qt_environment();

    hmi_status_pub = nh.advertise<std_stamped_msgs::StringStamped>("/hmi_status", 1);
    const QUrl url(QStringLiteral("qrc:/content/App.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    qmlRegisterType<Backend>("backendqt", 1, 0, "Backend");
    engine.rootContext()->setContextProperty("backend", &backend);
    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);
    backend.setEngine(&engine);
    backend.initColor();
    
    // Initialize ROS timer to process callbacks
    init_ros_timer();
}

int hmiApp::_exit() {
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }
    return app.exec();
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "backend_node");
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    hmiApp hmi(argc, argv);
    // hmi.init_ros_timer();

    ROS_INFO("Application started");

    return hmi._exit();
}

#include "main.moc"
