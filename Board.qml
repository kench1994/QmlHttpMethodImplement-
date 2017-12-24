import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0

Grid {
    id: grid
    property int nSingleRowHeight : 40
    rows: 7
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
        width: parent.width - x3y1.width-x1y1.width-requestRect.width
        height: nSingleRowHeight
        //anchors.top: parent.top
        //anchors.topMargin: 6
        color: "#00897b"
        TextInput {
            id: urlInput
            text: 'http://www.example.com:8080/'
            //anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            //anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Times New Roman"
            font.pointSize: 18
            selectByMouse: true

        }

    }
    Rectangle{
        id:requestRect
        x:x3y1.x-width//x2y1.x+x2y1.width
        color: "#009688"
        width: 10 * (2 + requestInput.text.length)//200
        height: nSingleRowHeight
        TextInput {
            id:requestInput
            text: 'PlaceOrder'
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Times New Roman"
            font.pointSize: 18
            selectByMouse: true

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
                xhr.open(comboBox.currentText, urlInput.text+requestInput.text, true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function() { // Call a function when the state changes.
                    if (xhr.readyState == 4) {
                        if (xhr.status == 200) {
                            console.log("ok")
                            responser.text = xhr.responseText;
                        } else {
                            console.log("error: " + xhr.status)
                            responser.text = "error: " + xhr.status;
                        }
                    }
                }
                console.log(dataInput.text+orderCodeInput.text)
                if(dataInput.text+orderCodeInput.text != "")
                xhr.send(JSON.parse(JSON.stringify( dataInput.text+orderCodeInput.text )));
                else xhr.send(null);

                console.log(xhr.responseText);
            }
        }
    }


    Rectangle{
        id: x1y2
        width: x1y1.width
        height: x1y1.height
        color: "#80cbc4"
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

        width: parent.width - x1y1.width - x3y1.width - orderCodeRect.width
        height: nSingleRowHeight
        color: "#26a69a"

        TextInput {
            id:dataInput
            text: '{'
            anchors.top: parent.top
            anchors.topMargin: 6
            font.family: "Times New Roman"
            font.pointSize: 18
            selectByMouse: true

        }
    }
    Rectangle{
        id: orderCodeRect
        x:x3y2.x-width
        y: nSingleRowHeight
        color: "#4db6ac"
        width: 10 * (orderCodeInput.length+2)
        height: nSingleRowHeight
        TextInput {
            id:orderCodeInput
            text: '"n":700000}'
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Times New Roman"
            font.pointSize: 18
            selectByMouse: true
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
            onCurrentTextChanged: {
                requestInput.text = handler.currentText;
            }
        }
    }
    Rectangle{
        id: rectangle1
        color: "#616161"
        y:x1y1.height+x1y2.height
        width: parent.width
        height: parent.height-x1y1.height-x1y2.height
        Label{
            id:responser
            text:""
            font.family: "Times New Roman"
            font.pointSize: 18
            anchors.left: parent.left
            anchors.leftMargin: 6
            anchors.right: parent.right
            anchors.rightMargin: 6
            anchors.top: parent.top
            anchors.topMargin: 6

        }
    }
}

