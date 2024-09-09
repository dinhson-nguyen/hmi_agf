#include <bsoncxx/builder/stream/document.hpp>
#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>
#include <mongocxx/uri.hpp>
#include "json.hpp"
#include <iostream>
#include <string>

class ModelPallet {
public:
    // Constructor để khởi tạo từ nlohmann::json
    ModelPallet(const nlohmann::json& json) {
        Model = json.at("Model").get<std::string>();
        Count = json.at("Count").get<std::string>();
        length = json.at("length").get<std::string>();
        height = json.at("height").get<std::string>();
        width = json.at("width").get<std::string>();
        pallet_type = json.at("pallet_type").get<std::string>();
    }

    // Phương thức để chuyển đối tượng thành BSON
    bsoncxx::document::value to_bson() const {
        return bsoncxx::builder::stream::document{} 
            << "Model" << Model
            << "Count" << Count
            << "length" << length
            << "height" << height
            << "width" << width
            << "pallet_type" << pallet_type
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
    std::string Model;
    std::string Count;
    std::string length;
    std::string height;
    std::string width;
    std::string pallet_type;
};