import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0

Grid {
    id: grid
    property int nSingleRowHeight : 40
    rows: 4
    columns: 4
    width: parent.width
    height: nSingleRowHeight * rows

    Rectangle{
        id: x1y1
        width: 120
        height: nSingleRowHeight
        anchors.left: parent.left
        ComboBox {
            id: comboBox
            font.family: "Times New Roman"
            font.bold: true
            font.pointSize: 18
            model: ["POST","GET"]
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Rectangle{
        id: x2y1
        x: x1y1.width
        enabled: true
        width: parent.width - x3y2.width
        height: nSingleRowHeight
        //anchors.top: parent.top
        //anchors.topMargin: 6
        color: "#00a03e"
        TextInput {
            id: urlinput
            text: 'http://www.example.com:8080/'
            //anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            //anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Times New Roman"
            font.pointSize: 18
        }
    }
    Rectangle{
        id:x3y1
        width: 100
        x: parent.width - x3y1.width
        height: nSingleRowHeight

        Button {
            id: sendButton
            text: qsTr("Send")
            font.family: "Times New Roman"
            font.bold: true
            font.pointSize: 18
            anchors.fill: parent
            onClicked: {
                //todo:判断前缀合规性
                var xhr = new XMLHttpRequest();
                xhr.open(comboBox.currentText, urlinput.text, false);
                xhr.send(JSON.parse(datainput.text));
                console.log(xhr.responseText);
            }
        }
    }


    Rectangle{
        id: x1y2
        width: x1y1.width
        height: x1y1.height
        color: "#b14a4a"
        enabled: true
        y: x1y1.height
//        anchors.top: x1y1.bottom
//        anchors.topMargin: 6
//        anchors.left: parent.left
        //anchors.leftMargin: 10
        Label {
            id: prepare
            text: qsTr("Data(Raw)")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Times New Roman"
            font.bold: true
            font.pointSize: 18
        }
    }
    Rectangle{
        id: x2y2
        enabled: true
        x: x2y1.x
        y: nSingleRowHeight

        width: parent.width - 240
        height: nSingleRowHeight
        color: "#4ab0b0"

        TextInput {
            id:datainput
            text: '{}'
            anchors.top: parent.top
            anchors.topMargin: 6
            font.family: "Times New Roman"
            font.pointSize: 18
        }
    }
    Rectangle{
        id:x3y2
        width: handler.currentText.length * 18
        x: parent.width - handler.currentText.length * 18
        y: nSingleRowHeight
        height: nSingleRowHeight
        ComboBox {
            id: handler
            model: ["PlaceOrder","CancelOrder","GetAccinfo"]
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Times New Roman"
            font.bold: true
            font.pointSize: 18
        }
    }
}

