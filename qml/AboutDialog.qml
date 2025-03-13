import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// Create Object dialog box
Dialog {
    id: dialog
    title: "TP LABO Hydraulique ver 1.0.7"
    standardButtons: Dialog.Ok
    anchors.centerIn: Overlay.overlay

    onAccepted: console.log("Ok clicked")

    property string link: "https://sites.google.com/view/tp-labo-hydraulique/";
    Text {
        id:textdialog_tp
        text: "M. HAFIANE Mohamed with colobaration of M. CHAFFI Chaffi and M. SERGUETTE M. "+
            '<html><style type="text/css"></style><a href="' +link + '">  Site des TP LABO Hydraulique</a></html>'
        ///onLinkActivated: Qt.openUrlExternally(link)
        wrapMode: Text.WordWrap
        font.bold : true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    Connections {
        target: textdialog_tp
        function onLinkActivated() {
            Qt.openUrlExternally(link)
        }
    }
}
