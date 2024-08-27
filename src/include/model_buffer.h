#include <bsoncxx/builder/stream/document.hpp>
#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>
#include <mongocxx/uri.hpp>
#include "json.hpp"
#include <iostream>
#include <string>

class ModelBuffer {
public:
    // Constructor để khởi tạo từ nlohmann::json
    ModelBuffer(const nlohmann::json& json, int queue_size = 8) {
       
        id = json.at("id").get<std::string>();
        id_hang = json.at("id_hang").get<std::string>();
        status = json.at("status").get<std::string>();
        stt = json.at("stt").get<int32_t>();
        type = json.at("type").get<int32_t>();
        height = json.at("height").get<double>();
        width = json.at("width").get<double>();
        length = json.at("length").get<double>();
        zone_id = json.at("zone_id").get<int32_t>();
        column_id = json.at("column_id").get<int32_t>();
        location_id = json.at("location_id").get<int32_t>();
    }

    // Phương thức để chuyển đối tượng thành BSON
    bsoncxx::document::value to_bson() const {
        return bsoncxx::builder::stream::document{} 
            << "id" << id
            << "id_hang" << id_hang
            << "status" << status
            << "stt" << stt
            << "type" << type
 
            << "height" << height
            << "width" << width
            << "length" << length
            << "zone_id" << zone_id
            << "column_id" << column_id
            << "location_id" << location_id

            
            << bsoncxx::builder::stream::finalize;
    }

    // Phương thức để chèn đối tượng vào MongoDB
    int insert(mongocxx::collection& collection) const {
        auto result = collection.insert_one(to_bson().view());
        if (result) {
            
            std::cout << "Inserted with id: " << result->inserted_id().get_oid().value.to_string() << std::endl;
            return 1;
        } else {
            std::cerr << "Insert failed" << std::endl;
            return 0;
        }
    }
    // Phương thức để cập nhật đối tượng trong MongoDB
    int update(mongocxx::collection& collection, const bsoncxx::document::view_or_value& filter) const {
        bsoncxx::document::value update_document = bsoncxx::builder::stream::document{}
            << "$set" << to_bson().view()
            << bsoncxx::builder::stream::finalize;

        auto result = collection.update_one(filter, update_document.view());
        if (result && result->matched_count() > 0) {
            std::cout << "Document updated, matched count: " << result->matched_count()
                      << ", modified count: " << result->modified_count() << std::endl;
            return 1;
        } else {
            std::cerr << "Update failed or no document matched the filter" << std::endl;
            return 0;
        }
    }

private:

    std::string id;
    std::string id_hang;
    std::string status;
    int stt;
    int type;
    double height;
    double width;
    double length;
    int zone_id;
    int column_id;
    int location_id;

};
