import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    visible: true
    width: 400
    height: 400

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        ComboBox {
            id: comboBox
            width: 200
            editable: true

            property var fullModel: ["Apple", "Banana", "Cherry", "Date", "Grape", "Kiwi", "Lemon", "Mango"]

            model: ListModel {
                id: filteredModel
            }

            delegate: ItemDelegate {
                text: model.text
            }

            // Khi văn bản thay đổi
            // onEditTextChanged: {

            //     // console.log("Text entered: " + editText)
            //     // filteredModel.clear()
            //     // for (var i = 0; i < fullModel.length; i++) {
            //     //     if (fullModel[i].toLowerCase().indexOf(editText.toLowerCase(
            //     //                                                )) !== -1) {
            //     //         filteredModel.append({
            //     //                                  "text": fullModel[i]
            //     //                              })
            //     //     }
            //     // }

            //     // Nếu văn bản nhập không có trong danh sách, thêm vào
            //     if (filteredModel.count === 0 && editText !== "") {
            //         filteredModel.append({
            //                                  "text": editText
            //                              })
            //     }
            // }
            Component.onCompleted: {
                // Khởi tạo danh sách ban đầu
                for (var i = 0; i < fullModel.length; i++) {
                    filteredModel.append({
                                             "text": fullModel[i]
                                         })
                }
            }
        }

        Button {
            text: "Show ComboBox Data"
            onClicked: {
                // Hiển thị giá trị hiện tại của ComboBox trong console
                console.log("Current ComboBox Text: " + comboBox.editText)
            }
        }
    }
}
