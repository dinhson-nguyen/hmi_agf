#include <bsoncxx/builder/stream/document.hpp>
#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>
#include <mongocxx/uri.hpp>
#include "json.hpp"
#include <iostream>
#include <string>

class ModelQueue {
public:
    // Constructor để khởi tạo từ nlohmann::json
    Model(const nlohmann::json& json, int queue_size = 8) {
        id = json.at("Id").get<std::string>();
        Time = json.at("PalletInfo").get<std::string>();
        Model = json.at("Model").get<std::string>();
        length = json.at("Merchandise").get<std::string>();
        location_id = json.at("NameModel").get<std::string>();
        mechandise = json.at("Destination").get<std::string>();
        height = json.at("height").get<std::string>();
        model = json.at("model").get<std::string>();
        name_model = json.at("name_model").get<std::string>();
        type = json.at("type").get<std::string>();
        width = json.at("width").get<std::string>();
        zone_id = json.at("zone_id").get<std::string>();
        pallet_type = json.at("pallet_type").get<std::string>();
        queue = queue_size;
    }

    // Phương thức để chuyển đối tượng thành BSON
    bsoncxx::document::value to_bson() const {
        return bsoncxx::builder::stream::document{} 
            << "Id" << id
            << "destination" << destination
            << "id" << id
            << "length" << length
            << "location_id" << location_id
            << "mechandise" << mechandise
            << "height" << height
            << "model" << model
            << "name_model" << name_model
            << "type" << type
            << "width" << width
            << "zone_id" << zone_id
            << "pallet_type" << pallet_type
            << "queue" << queue
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
    std::string column_id;
    std::string destination;
    std::string id;
    std::string length;
    std::string location_id;
    std::string mechandise;
    std::string height;
    std::string model;
    std::string name_model;
    std::string type;
    std::string width;
    std::string zone_id;
    std::string pallet_type;
    int queue;
};