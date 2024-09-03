#include "include/backend.h"
#include <iostream>
#include <sstream>
#include "include/json.hpp"
#include <string>
#include <regex>
#include <std_stamped_msgs/EmptyStamped.h>
#include <cstdio>
#include <fstream>
#include <string>
#include <unistd.h>
#include <QQmlComponent>

using json = nlohmann::json;
Backend::Backend(QObject* parent)
    : QObject(parent), nh(),
    uri("mongodb://localhost:27017"),
    client(uri), db(client["admin"]),
    collection(db["pallet_buffer"]),
    collection_queue(db["pallet_queue"])
    
{
    // Initialize the subscriber in the constructor
    
    battery_percent_sub = nh.subscribe("/arduino_driver/float_param/battery_percent", 1, &Backend::batteryPercentCallback, this);
    battery_voltage_sub = nh.subscribe("/arduino_driver/float_param/battery_voltage", 1, &Backend::batteryVoltageCallback, this);
    battery_current_sub = nh.subscribe("/arduino_driver/float_param/battery_ampe", 1, &Backend::batteryCurrentCallback, this);
    robot_mode_sub = nh.subscribe("/robot_mode", 1, &Backend::robotModeCallback, this);
    robot_status_sub = nh.subscribe("/robot_status", 1, &Backend::robotStatusCallback, this);
    fastech_input_sub = nh.subscribe("/fastech_input", 1, &Backend::fastechInputCallBack, this);
    fastech_output_sub = nh.subscribe("/fastech_output", 1, &Backend::fastechOutputCallBack, this);
    velocity_sub = nh.subscribe("/final_cmd_vel_mux/output", 1, &Backend::cmdVelCallBack, this);
    pallet_status_sub = nh.subscribe("/empty_topic", 1, &Backend::palletStatusCallback, this);

    request_run_stop_pub = nh.advertise<std_stamped_msgs::StringStamped>("/request_run_stop", 1);
    reset_error_pub = nh.advertise<std_stamped_msgs::EmptyStamped>("/reset_error", 1);
    robot_mode_pub = nh.advertise<std_stamped_msgs::StringStamped>("/request_mode", 1);
    robot_control_pub = nh.advertise<std_stamped_msgs::StringStamped>("/request_working_stt", 1);
    
    robot_stop_pub = nh.advertise<std_stamped_msgs::StringStamped>("/request_start_mission", 1);

    // Service
    
    pop_last_pallet = nh.advertiseService("/conveyor_buffer/pop_buffer_last", &Backend::servicePopPalletCallback, this);
    append_head_pallet = nh.advertiseService("/conveyor_buffer/append_buffer_head", &Backend::serviceAppendPalletCallback, this); 
    get_last_pallet = nh.advertiseService("/conveyor_buffer/get_buffer_last", &Backend::serviceLookupPalletCallback, this);
    stop_error_agf = nh.serviceClient<std_stamped_msgs::StringService>("/stop_trigger_manager");
    reset_error_agf = nh.serviceClient<std_stamped_msgs::StringService>("/reset_trigger_manager");
    bug_manual_mode = true;
    index = 0;
    max_index = 0;
    _queue = "_queue";
    zone_ = "zone_";
    QTranslator* translator = new QTranslator();
    // m_translator.load(QStringLiteral(":/simplequick.qm"));
    // qApp->installTranslator(&m_translator);
    // qApp->removeTranslator(&m_translator);


    std::string name = "";
    try {
        YAML::Node config = YAML::LoadFile("/home/mkac/robot_config/robot_define.yaml");

        // The outer element is an array
        if (config["agv_name"] && config["agv_name"].IsScalar()) {
            std::string name = config["agv_name"].as<std::string>();
            // std::string ip_server = config["server_address"].as<std::string>();
            std::string ip_server = "_";
            server_address = QString::fromStdString(ip_server);

            agv_name = QString::fromStdString(name);
        }

    }
    catch (const YAML::BadFile& e) {
        ROS_WARN("Cannot get AGV name");
    }
    catch (const YAML::ParserException& e) {
        ROS_WARN("Cannot get AGV name");
    }
    
    

}

std::vector<std::string> Backend::splitString(std::string str, char delimiter) {
    std::vector<std::string> result;
    std::stringstream ss(str);
    std::string item;

    while (std::getline(ss, item, delimiter)) {
        result.push_back(item);
    }

    return result;
}


void Backend::batteryPercentCallback(const std_stamped_msgs::Float32Stamped& msg) {
    batteryPercentageStr = double(msg.data);
    if (batteryPercentageStr >= 99) batteryPercentageStr = 100;
    emit batteryPercentageChanged();

}

void Backend::batteryVoltageCallback(const std_stamped_msgs::Float32Stamped& msg) {
    batteryVoltageStr = double(msg.data);
    emit batteryVoltageChanged();

}

void Backend::batteryCurrentCallback(const std_stamped_msgs::Float32Stamped& msg) {
    batteryCurrentStr = double(msg.data);
    emit batteryCurrentChanged();

}

void Backend::robotModeCallback(const std_stamped_msgs::StringStamped::ConstPtr& msg) {
    // robot_mode = std::string(msg ->data);
    robotModeStr = QString::fromStdString(msg->data);
    emit robotModeChanged();
}

void Backend::robotStatusCallback(const std_stamped_msgs::StringStamped::ConstPtr& msg) {

    std::string data = msg->data;
    try
    {
        json jsondata = json::parse(data);
        statusValue = jsondata["status"];
        detailValue = jsondata["detail"];
        robot_mode = jsondata["mode"];
        errorValue = jsondata["error_code"];
    }
    catch (...)
    {
        ROS_WARN("Loi chuyen doi json callback /robot_status");
    }


    if (statusValue == "PAUSED") {
        getControlStr = QString::fromStdString(statusValue);
        emit getControlChanged();
    }
    else if (statusValue == "RUNNING")
    {
        getControlStr = QString::fromStdString(statusValue);
        statusValue = "NORMAL";
        emit getControlChanged();
    }
    else if (statusValue == "WAITING")
    {
        getControlStr = QString::fromStdString("RUNNING");
        emit getControlChanged();
    }

    if (robot_mode == "AUTO") {
        bug_manual_mode = true;
    }
    robotStatusStr = QString::fromStdString(statusValue);
    emit robotStatusChanged();


    robotDetailStr = QString::fromStdString(detailValue);
    emit robotDetailChanged();


    robotErrorStr = QString::fromStdString(errorValue);
    emit robotErrorChanged();

    // robotModeStr = QString::fromStdString(modeValue);
    // emit robotModeChanged();

}

void Backend::fastechInputCallBack(const std_msgs::Int16MultiArray::ConstPtr& msg) {
    std::vector<int16_t> data_ = msg->data;
    fastechData.clear();
    fastechData.reserve(data_.size());
    for (int i = 0; i < data_.size();i++) {
        fastechData.push_back(static_cast<int>(data_[i]));
    }
    emit getFastechInputChanged();

}

void Backend::fastechOutputCallBack(const std_msgs::Int16MultiArray::ConstPtr& msg) {
    // fastechDataOutput.clear();
    // fastechDataOutput.reserve(msg->data.size());
    // for (int value : msg->data) {
    //     fastechDataOutput.push_back(static_cast<int>(value));
    // }
    std::vector<int16_t> data_ = msg->data;
    fastechDataOutput.clear();
    fastechDataOutput.reserve(data_.size());
    for (int i = 0; i < data_.size();i++) {
        fastechDataOutput.push_back(static_cast<int>(data_[i]));
    }

    emit getFastechOutputChanged();

}

void Backend::cmdVelCallBack(const geometry_msgs::Twist& msg) {
    vel_linear = double(msg.linear.x);
    vel_angular = double(msg.angular.z);

    emit velChanged();

}




int Backend::getFastechRear(int index) {
    return fastechData[int(index) - 1];
}

int Backend::getFastechFront(int index) {
    return fastechDataOutput[int(index) - 1];
}

double Backend::batteryPercentage() const {
    return batteryPercentageStr;
}

double Backend::batteryVoltage() const {
    return batteryVoltageStr;
}

double Backend::batteryCurrent() const {
    return batteryCurrentStr;
}

QString Backend::robotMode() const {
    return robotModeStr;
}

QString Backend::robotStatus() const {
    return robotStatusStr;
}

QString Backend::robotDetail() const {
    if (bug_manual_mode == 0) {
        return QString::fromStdString("Please change AGV mode to AUTO");
    }
    return robotDetailStr;
}

QString Backend::robotError() const {
    return robotErrorStr;
}

QString Backend::getControl() const {
    return getControlStr;
}

QString Backend::getNameAGV() {
    return agv_name;
}

double Backend::getLinear() const {
    return vel_linear;
}

double Backend::getAngular() const {
    return vel_angular;
}


void Backend::resetError() {
    std_stamped_msgs::EmptyStamped msg;
    if (robotModeStr.toStdString() == "AUTO") {

        reset_error_pub.publish(msg);

    }
    else {
        bug_manual_mode = false;
        // ROS_INFO_STREAM(robotModeStr.toStdString());
    }
    
}


void Backend::requestMode(const QString& str) {

    std_stamped_msgs::StringStamped request_mode_msg;
    request_mode_msg.stamp = ros::Time::now();
    request_mode_msg.data = str.toStdString();
    robot_mode_pub.publish(request_mode_msg);
}


void Backend::requestControl(const QString& str) {

    std_stamped_msgs::StringStamped request_control_msg;
    request_control_msg.stamp = ros::Time::now();
    if (robotModeStr.toStdString() == "AUTO") {

        if (str.toStdString() == "STOP") {
            request_control_msg.data = "STOP";
            request_run_stop_pub.publish(request_control_msg);
        }
        else {
            request_control_msg.data = "RUN";
            request_run_stop_pub.publish(request_control_msg);
        }

    }
    else {
        bug_manual_mode = false;
        // ROS_INFO_STREAM(robotModeStr.toStdString());
    }

}

int Backend::getVolume() {
    std::string result = exec("amixer -D pulse sget Master");

    int volumePercentage = getVolumePercentage(result);

    return volumePercentage;
}

int Backend::setVolume(int percent) {
    std::string command = "amixer -D pulse sset Master " + std::to_string(percent) + "%";
    system(command.c_str());
    return percent;
}

void Backend::shutdown(int state) {
    if (state == 1) {
        std::string command = " ";
    }
}

void Backend::getVolume_on_off(int i) {
    if (i == 0) {
        std::string result = exec("pactl set-sink-mute @DEFAULT_SINK@ true");
    }
    else std::string result = exec("pactl set-sink-mute @DEFAULT_SINK@ false");


}

void Backend::change_to_japan() {

    // qApp ->installTranslator(&m_translator);

}

void Backend::change_to_eng() {
    qApp->removeTranslator(&m_translator);
}

QString Backend::getIP() {
    std::string ip = " ";
    FILE* pipe = popen("ip -4 addr show dev enp3s0", "r");
    if (!pipe) {
        return QString::fromStdString(ip);
    }

    char buffer[128];
    std::string result = "";
    while (fgets(buffer, sizeof(buffer), pipe) != nullptr) {
        result += buffer;
    }

    // Close the pipe
    pclose(pipe);

    // Use regular expression to find the IP address
    std::regex ipRegex(R"((\d{1,3}\.){3}\d{1,3})");
    std::smatch ipMatch;
    if (std::regex_search(result, ipMatch, ipRegex)) {
        return QString::fromStdString(ipMatch.str());
    }
    return QString::fromStdString(ip);
}


QString Backend::getIPServer() {
    return server_address;
}

void Backend::palletStatusCallback(const std_msgs::Empty& msg){
    initColor();
}

// Hàm chuyển đổi số thực thành chuỗi với độ chính xác mong muốn
// std::string Backend::toStringWithPrecision(float value, int precision) {
//     std::ostringstream out;
//     out << std::fixed << std::setprecision(precision) << value;
//     return out.str();
// }

bool Backend::servicePopPalletCallback(std_stamped_msgs::StringService::Request& req, std_stamped_msgs::StringService::Response& res) {
    arrangeQueue();
    json delete_result = deleteObjQueue(1);
    res.respond = delete_result.dump();

    return 1;
    
}
bool Backend::serviceLookupPalletCallback(std_stamped_msgs::StringService::Request& req, std_stamped_msgs::StringService::Response& res) {
    arrangeQueue();
    mongocxx::cursor cursor = collection_queue.find({});
    json empty = { };
    bsoncxx::builder::stream::document filter_builder;
    filter_builder << "queue" << 1;
    auto result = collection_queue.find_one(filter_builder.view());

    if (result) {
        // Chuyển đổi tài liệu thành JSON
        bsoncxx::document::view view = result->view();
        std::string obj_filter = bsoncxx::to_json(view);
        json object_ = json::parse(obj_filter);
        object_.erase("_id");
        object_.erase("queue");
        
        res.respond = object_.dump();
    } else  res.respond = empty.dump();;
   

    return 1;
    
}
bool Backend::serviceAppendPalletCallback(std_stamped_msgs::StringService::Request& req, std_stamped_msgs::StringService::Response& res ) {
    arrangeQueue();
    json data_obj = json::parse(req.request);
    int height_ = 10  ;
    ROS_INFO_STREAM("call service append success");
    Model model(data_obj);
    // Chèn vào MongoDB
    int result = model.insert(collection_queue);

    if(result == 1) {
        res.respond = "service success";
        return true;
    } else return false;
}

json Backend::deleteObjQueue(int queue) {
    mongocxx::cursor cursor = collection_queue.find({});
    json empty = { };
    bsoncxx::builder::stream::document filter_builder;
    filter_builder << "queue" << queue;
    auto result = collection_queue.find_one(filter_builder.view());

    if (result) {
        // Chuyển đổi tài liệu thành JSON
        bsoncxx::document::view view = result->view();
        std::string obj_filter = bsoncxx::to_json(view);
        json object_ = json::parse(obj_filter);
        object_.erase("_id");
        object_.erase("queue");
        
        // Perform the deletion operation
        auto delete_result = collection_queue.delete_one(view);

        if (delete_result && delete_result->deleted_count() > 0) {

            return object_;
        } else {

            return empty;
        }
    } else return empty;
}

void Backend::arrangeQueue() {
    // Lấy tất cả các document từ collection và sắp xếp theo trường "queue"
    auto cursor = collection_queue.find(
        bsoncxx::builder::stream::document{} << bsoncxx::builder::stream::finalize,
        mongocxx::options::find{}.sort(bsoncxx::builder::stream::document{} << "queue" << 1 << bsoncxx::builder::stream::finalize)
    );

    std::vector<bsoncxx::document::value> documents;
    for (auto&& doc : cursor) {
        documents.push_back(bsoncxx::document::value(doc));
    }

    // Cập nhật lại các giá trị queue
    int new_queue_value = 1;
    for (auto& doc : documents) {
        auto id = doc["_id"].get_oid().value;
        auto filter = bsoncxx::builder::stream::document{} << "_id" << id << bsoncxx::builder::stream::finalize;
        auto update = bsoncxx::builder::stream::document{} << "$set" << bsoncxx::builder::stream::open_document
                                                           << "queue" << new_queue_value++
                                                           << bsoncxx::builder::stream::close_document << bsoncxx::builder::stream::finalize;
        collection_queue.update_one(filter.view(), update.view());


    }

}

void Backend::colorPalletQueue(mongocxx::collection coll,
                            std::string prefix,
                            std::string id_,
                            std::string suffix) {
    mongocxx::cursor cursor = coll.find({});
    std::string color = "";
    rootObject = engine->rootObjects().first();
    std::vector<int32_t> list_numbers = {1,2,3,4,5, 6, 7, 8};
    for (auto&& doc : cursor) {
        
        // Create a function to process documents
        std::string data_ = bsoncxx::to_json(doc);
        json object_ = json::parse(data_);
        
        // Determine color based on type
        std::string high = object_["pallet_type"].get<std::string>();
        float hig = stringToFloat(high);

        std::cout << hig << std::endl;
        if (hig == 0) {
            
            color = "#FFEB3B";
        } else if (hig == 1) {
            
            color = "#FF9800";
        } else {
            color = "#4CAF50";
        }
        // Get the id and update color
        std::string obj_ ="";
        if (object_["queue"].is_number_integer()) {
            int32_t queue_value = object_["queue"].get<int32_t>();
            auto it = std::remove(list_numbers.begin(), list_numbers.end(), queue_value);

            // Xóa phần tử thừa sau khi dùng std::remove
            list_numbers.erase(it, list_numbers.end());
            // Tiếp tục xử lý với queue_value
            obj_ = prefix + std::to_string(queue_value) + suffix;            
        } else {
            // Xử lý trường hợp lỗi hoặc kiểu dữ liệu không phải là số nguyên
            std::cerr << "Error: queue is not an integer!" << std::endl;
        }
        
        QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(obj_));
        if (item) {
            item->setProperty("color", QColor(QString::fromStdString(color)));
        }
    };
    for (int i : list_numbers) {
        // std::cout << i << std::endl ;
        std::string obj__ = prefix + std::to_string(i) + suffix ;
        QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(obj__));
        if (item) {
            item->setProperty("color", QColor(QString::fromStdString("#CFD8DC")));
        }
    };

}

void Backend::colorPallet(mongocxx::collection coll,
                            std::string prefix,
                            std::string id_,
                            std::string suffix) {
                                std::string color = "";
    mongocxx::cursor cursor = coll.find({});
    std::vector<int32_t> list_numbers = {1,2,3,4,5, 6, 7, 8,9,10};
    rootObject = engine->rootObjects().first();
    for (auto&& doc : cursor) {
        

        int32_t type = -1;
        auto element = doc["type"];  // Lấy phần tử "type"

        if (element) {
            // Kiểm tra kiểu dữ liệu và trích xuất giá trị
            if (element.type() == bsoncxx::type::k_int32) {
                int32_t type_value = element.get_int32();
                if (type_value== 0) {
                    color = "#FFEB3B";
                } else if (type_value == 1) {
                    color = "#FF9800";
                } else if (type_value == -1) {
                    color = "#CFD8DC";
                } else {
                    color = "#4CAF50";
                }
                // std::cout << "Type value: " << type_value << std::endl;
            } else {
                std::cerr << "Expected int32 but got different type" << std::endl;
            }
        } else {
            std::cerr << "Element not found or is null" << std::endl;
        }

        // Get the id and update color
        std::string obj_ ="";
        
        auto element_ = doc["stt"];  // Lấy phần tử "type"

        if (element_) {
            // Kiểm tra kiểu dữ liệu và trích xuất giá trị
            if (element_.type() == bsoncxx::type::k_int32) {
                int32_t type_value = element_.get_int32();
                auto it = std::remove(list_numbers.begin(), list_numbers.end(), type_value);

                // Xóa phần tử thừa sau khi dùng std::remove
                list_numbers.erase(it, list_numbers.end());
                // Tiếp tục xử lý với queue_value
                obj_ = prefix + std::to_string(type_value) + suffix;
            } else {
                std::cerr << "Expected int32 but got different type" << std::endl;
            }
        } else {
            std::cerr << "element_ not found or is null" << std::endl;
        }

        // QObject *rootObject = engine->rootObjects().first();
        QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(obj_));
        if (item) {
            item->setProperty("color", QColor(QString::fromStdString(color)));
        }
    };
    for (int i : list_numbers) {
        // std::cout << i << std::endl ;
        std::string obj__ = prefix + std::to_string(i) + suffix ;
        QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(obj__));
        if (item) {
            item->setProperty("color", QColor(QString::fromStdString("#CFD8DC")));
        }
    };
}

void Backend::initColor() {
    arrangeQueue();
    while ( engine->rootObjects().isEmpty()) {};
    rootObject = engine->rootObjects().first();
    colorPallet(collection,"zone_","zone_id","");
    colorPalletQueue(collection_queue,"zone_","queue","_queue");
}


void Backend::setDataBuffer(QString id) {
    mongocxx::cursor cursor = collection.find({});
    bsoncxx::builder::stream::document filter_builder;
    filter_builder << "id" << id.toStdString();
    auto result = collection.find_one(filter_builder.view());

    if (result) {
        bsoncxx::document::view view = result->view();
        rootObject = engine->rootObjects().first();
        for (auto it = view.begin(); it != view.end(); ++it) {
            std::string key = "___" + it->key().to_string();  // Lấy tên key
            auto value = it->get_value();  // Lấy giá trị
            QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(key));
            if (item) {
                QString propertyValue;
                // Xử lý giá trị dựa trên kiểu dữ liệu của nó
                switch (value.type()) {
                    case bsoncxx::type::k_int32:
                        // std::cout << key << ": " << value.get_int32() << std::endl;
                        propertyValue = QString::number(value.get_int32());
                        break;
                    case bsoncxx::type::k_int64:
                        // std::cout << key << ": " << value.get_int64() << std::endl;
                        propertyValue = QString::number(value.get_int64());
                        break;
                    case bsoncxx::type::k_double:
                        // std::cout << key << ": " << value.get_double() << std::endl;
                        propertyValue = QString::number(value.get_double());
                        break;
                    case bsoncxx::type::k_utf8:
                        // std::cout << key << ": " << value.get_utf8().value.to_string() << std::endl;
                        propertyValue = QString::fromStdString(value.get_utf8().value.to_string());
                        break;
                    case bsoncxx::type::k_oid:
                        // std::cout << key << ": " << value.get_oid().value.to_string() << std::endl;
                         propertyValue = QString::fromStdString( value.get_oid().value.to_string());
                        break;
                }
                item->setProperty("text", propertyValue);
            }

            else {
                delayFunction(100);
                ROS_WARN("item not found: %s", key);
                std::cout << key << std::endl;
                
                for (auto it = view.begin(); it != view.end(); ++it) {
                    std::string key = "___" + it->key().to_string();  // Lấy tên key
                    auto value = it->get_value();  // Lấy giá trị
                    QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(key));
                    if (item) {
                        QString propertyValue;
                        // Xử lý giá trị dựa trên kiểu dữ liệu của nó
                        switch (value.type()) {
                            case bsoncxx::type::k_int32:
                                // std::cout << key << ": " << value.get_int32() << std::endl;
                                propertyValue = QString::number(value.get_int32());
                                break;
                            case bsoncxx::type::k_int64:
                                // std::cout << key << ": " << value.get_int64() << std::endl;
                                propertyValue = QString::number(value.get_int64());
                                break;
                            case bsoncxx::type::k_double:
                                // std::cout << key << ": " << value.get_double() << std::endl;
                                propertyValue = QString::number(value.get_double());
                                break;
                            case bsoncxx::type::k_utf8:
                                // std::cout << key << ": " << value.get_utf8().value.to_string() << std::endl;
                                propertyValue = QString::fromStdString(value.get_utf8().value.to_string());
                                break;
                            case bsoncxx::type::k_oid:
                                // std::cout << key << ": " << value.get_oid().value.to_string() << std::endl;
                                propertyValue = QString::fromStdString( value.get_oid().value.to_string());
                                break;
                        }
                        item->setProperty("text", propertyValue);
                    }
                }
            }
        }
    } else {
        QList<QQuickItem *> allObjects = rootObject->findChildren<QQuickItem *>();
        // QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(key));
        for (QQuickItem *item : allObjects) {
            if (!item->objectName().isEmpty()) {
                // Ví dụ: nếu đối tượng là Text hoặc TextEdit
                if (item->inherits("QQuickTextField")) {
                    item->setProperty("text", QString::fromStdString("Empty"));
                }
                // Bạn có thể thêm điều kiện cho các thuộc tính khác mà bạn cần gán giá trị
            }
        }
    }
}
void Backend::setDataQueue(int id) {
    mongocxx::cursor cursor = collection_queue.find({});
    bsoncxx::builder::stream::document filter_builder;
    filter_builder << "queue" << id;
    auto result = collection_queue.find_one(filter_builder.view());

    if (result) {
        // Chuyển đổi tài liệu thành JSON
        bsoncxx::document::view view = result->view();
        std::string obj_filter = bsoncxx::to_json(view);
        json jsonObject = json::parse(obj_filter);
        rootObject = engine->rootObjects().first();
        // jsonObject.erase("_id");
        for (auto it = jsonObject.begin(); it != jsonObject.end(); ++it) {
            std::string key = "_" + it.key();  // Lấy tên key
            auto value = it.value();     // Lấy giá trị
            // Tìm đối tượng QML dựa trên tên key
            QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(key));
            if (item) {
                // Chuyển đổi giá trị JSON thành QString
                QString propertyValue;
                if (value.is_string()) {
                    propertyValue = QString::fromStdString(value.get<std::string>());
                } else if (value.is_number_integer()) {
                    propertyValue = QString::number(value.get<int>());
                } else if (value.is_boolean()) {
                    propertyValue = value.get<bool>() ? "true" : "false";
                } else {
                    propertyValue = QString::fromStdString("[Unknown Type]");
                }
                item->setProperty("text", propertyValue);
            }
            else if ( key == "__id") {
                ROS_WARN("item not fadasddasdound: %s", key);
                std::cout << key << std::endl;
                QObject *itempp = rootObject->findChild<QObject*>(QString::fromStdString("uuid_queue"));
                if (itempp) {
                    itempp->setProperty("text", QString::fromStdString(view["_id"].get_oid().value.to_string()));
                }
            }
            else {
                delayFunction(100);
                ROS_WARN("item not found: %s", key);
                std::cout << key << std::endl;
                QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(key));
                if (item) {
                    // Chuyển đổi giá trị JSON thành QString
                    QString propertyValue;
                    if (value.is_string()) {
                        propertyValue = QString::fromStdString(value.get<std::string>());
                    } else if (value.is_number_integer()) {
                        propertyValue = QString::number(value.get<int>());
                    } else if (value.is_boolean()) {
                        propertyValue = value.get<bool>() ? "true" : "false";
                    } else {
                        propertyValue = QString::fromStdString("[Unknown Type]");
                    }

                    // Gán giá trị cho thuộc tính "text"
                    item->setProperty("text", propertyValue);
                }
            }
        }
    } else {
        QList<QQuickItem *> allObjects = rootObject->findChildren<QQuickItem *>();

        for (QQuickItem *item : allObjects) {
            if (!item->objectName().isEmpty()) {
                if (item->inherits("QQuickTextField")) {
                    item->setProperty("text", QString::fromStdString("Empty"));
                }
            }
        }
    }
}
void Backend::saveDataBuffer(QString jsonstring) {
    nlohmann::json jsonObj = nlohmann::json::parse(jsonstring.toStdString());
    jsonObj["stt"] = std::stoi(jsonObj["stt"].get<std::string>());
    jsonObj["type"] = std::stoi(jsonObj["type"].get<std::string>());
    jsonObj["height"] = stringToDouble(jsonObj["height"].get<std::string>());
    jsonObj["width"] = stringToDouble(jsonObj["width"].get<std::string>());
    jsonObj["length"] = stringToDouble(jsonObj["length"].get<std::string>());
    jsonObj["zone_id"] = std::stoi(jsonObj["zone_id"].get<std::string>());
    jsonObj["column_id"] = std::stoi(jsonObj["column_id"].get<std::string>());
    jsonObj["location_id"] = std::stoi(jsonObj["location_id"].get<std::string>());

    mongocxx::cursor cursor = collection.find({});
    std::string id_ = jsonObj["_id"].get<std::string>();
    bsoncxx::oid id(id_); // Thay bằng _id thực tế của bạn
    bsoncxx::builder::stream::document filter_builder;
    filter_builder << "_id" << id;
    ModelBuffer modelupdate(jsonObj);
    modelupdate.update(collection, filter_builder.view());
    initColor();

}
void Backend::saveDataQueue(QString jsonstring) {
    nlohmann::json jsonObj = nlohmann::json::parse(jsonstring.toStdString());
    jsonObj["queue"] = std::stoi(jsonObj["queue"].get<std::string>());
    mongocxx::cursor cursor = collection_queue.find({});

    std::string id_ = jsonObj["_id"].get<std::string>();
    bsoncxx::oid id(id_); // Thay bằng _id thực tế của bạn
    bsoncxx::builder::stream::document filter_builder;
    filter_builder << "_id" << id;

    Model modelupdate(jsonObj, jsonObj["queue"]);
    modelupdate.update(collection_queue, filter_builder.view());
    initColor();
}

void Backend::switchColorBuffer(mongocxx::collection coll,std::string old_id) {

}

void Backend::switchColorQueue(mongocxx::collection coll,std::string old_id, std::string update_id) {
    std::string obj__ = "zone_" + old_id + "_queue" ;
    QObject *item = rootObject->findChild<QObject*>(QString::fromStdString(obj__));
    
    if (item) {
        item->setProperty("color", QColor(QString::fromStdString("#CFD8DC")));
    }
    std::string obj_ = "zone_" + update_id + "_queue" ;
    std::cout << obj_ << std::endl;
    QObject *itemz = rootObject->findChild<QObject*>(QString::fromStdString(obj_));
    
    if (itemz) {
        itemz->setProperty("color", QColor(QString::fromStdString("#EF5350")));
    }
    
}

void Backend::deleteDataBuffer(QString jsonstring) {
    nlohmann::json jsonObj = nlohmann::json::parse(jsonstring.toStdString());
    std::cout << 1 << std::endl;
    std::string id_ = jsonObj["_id"].get<std::string>();
    std::cout << 2 << std::endl;
    mongocxx::cursor cursor = collection.find({});
    bsoncxx::oid id(id_); // Thay bằng _id thực tế của bạn
    bsoncxx::builder::stream::document filter_builder;
    filter_builder << "_id" << id;
    std::cout << 3 << std::endl;
    auto result = collection.find_one(filter_builder.view());

    if (result) {
        std::cout << 4 << std::endl;
        bsoncxx::document::view view = result->view();
        std::string status = "free" ;
        jsonObj["status"] = status;
        jsonObj["type"] = -1;
        jsonObj["stt"] = std::stoi(jsonObj["stt"].get<std::string>());
        jsonObj["id_hang"] = status;
        jsonObj["height"] = stringToDouble(jsonObj["height"].get<std::string>());
        jsonObj["width"] = stringToDouble(jsonObj["width"].get<std::string>());
        jsonObj["length"] = stringToDouble(jsonObj["length"].get<std::string>());
        jsonObj["zone_id"] = std::stoi(jsonObj["zone_id"].get<std::string>());
        jsonObj["column_id"] = std::stoi(jsonObj["column_id"].get<std::string>());
        jsonObj["location_id"] = std::stoi(jsonObj["location_id"].get<std::string>());
        ModelBuffer modelupdate(jsonObj);
        modelupdate.update(collection, filter_builder.view());
        // auto delete_result = collection.delete_one(view);
    }
    initColor();

}
void Backend::deleteDataQueue(QString jsonstring) {

    std::string jsonObj = jsonstring.toStdString();

    mongocxx::cursor cursor = collection_queue.find({});
    std::string id_ = jsonObj;
    bsoncxx::oid id(id_); // Thay bằng _id thực tế của bạn
    bsoncxx::builder::stream::document filter_builder;
    filter_builder << "_id" << id;
    auto result = collection_queue.find_one(filter_builder.view());

    if (result) {
        bsoncxx::document::view view = result->view();
        // Perform the deletion operatin
        auto delete_result = collection_queue.delete_one(view);
    }
    initColor();
    
}


void Backend::requestStop(const QString &str) {

    std_stamped_msgs::StringStamped request_stop_msg;
    request_stop_msg.stamp = ros::Time::now();
    std::string data_ = "STOP";
    request_stop_msg.data = data_;
    robot_stop_pub.publish(request_stop_msg);

    std_stamped_msgs::StringService::Request req;
    std_stamped_msgs::StringService::Response res;
    std_stamped_msgs::StringService srv;
    req.request = "Hello, this is a request stop_trigger_manager ";

    
    if (stop_error_agf.call(req,res))
    {
        ROS_INFO("Response: %s", res.respond.c_str());
    }
    else
    {
        ROS_ERROR("Failed to call service string_service");
    }

}

void Backend::requestReset(const QString &str) {



    std_stamped_msgs::StringService::Request req;
    std_stamped_msgs::StringService::Response res;
    std_stamped_msgs::StringService srv;
    req.request = "Hello, this is a request reset_trigger_manager ";

    
    if (reset_error_agf.call(req,res))
    {
        ROS_INFO("Response: %s", res.respond.c_str());
    }
    else
    {
        ROS_ERROR("Failed to call service string_service");
    }
}
