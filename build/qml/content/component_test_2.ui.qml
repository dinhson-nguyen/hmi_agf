import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 400

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

        onEditTextChanged: {
            filteredModel.clear()
            for (var i = 0; i < fullModel.length; i++) {
                if (fullModel[i].toLowerCase().indexOf(editText.toLowerCase(
                                                           )) !== -1) {
                    filteredModel.append({
                                             "text": fullModel[i]
                                         })
                }
            }
        }

        Component.onCompleted: {
            for (var i = 0; i < fullModel.length; i++) {
                filteredModel.append({
                                         "text": fullModel[i]
                                     })
            }
        }
    }
}
