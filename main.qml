import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    title: qsTr("HttpMethods")
    width: 840
    height: 300

    Board{
        id:board
         anchors.fill: parent
    }

}
