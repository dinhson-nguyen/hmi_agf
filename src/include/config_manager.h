#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QVariantMap>
#include <QQmlApplicationEngine>
#include <QQmlContext>

class ConfigManager : public QObject {
    Q_OBJECT
public:
    explicit ConfigManager(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void saveConfig(const QVariantMap &configData, const QString &configPath) {
        QJsonObject jsonObject = QJsonObject::fromVariantMap(configData);
        QJsonDocument jsonDoc(jsonObject);

        QFile configFile(configPath);
        if (configFile.open(QIODevice::WriteOnly)) {
            configFile.write(jsonDoc.toJson());
            configFile.close();
            qWarning() << "save success:" << configPath;
        }
    }

    Q_INVOKABLE QVariantMap loadConfig(const QString &configPath) {
        QFile configFile(configPath);
        if (!configFile.open(QIODevice::ReadOnly)) {
            qWarning() << "Could not open config file:" << configPath;
            return QVariantMap();
        }

        QByteArray fileData = configFile.readAll();
        QJsonDocument jsonDoc = QJsonDocument::fromJson(fileData);
        return jsonDoc.object().toVariantMap();
    }
};
