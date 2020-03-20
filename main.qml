import QtQuick 2.13
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 250
    height: 500
    title: qsTr("Hello World")
    Text {
               id: title_text
               text: qsTr("Sign in")
               color: "purple"
               font.pixelSize: 20
               anchors.top:parent.top
               anchors.topMargin: 10
               anchors.horizontalCenter: parent.horizontalCenter
           }
    TextField{
        id:text_login
        placeholderText: qsTr("login")
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top:title_text.bottom

    }
    TextField{
        id:text_passin
        placeholderText: qsTr("password")
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top:text_login.bottom
    }
    TextField{
        id:text_logup
        placeholderText: qsTr("login")
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top:title_text.bottom
        visible:false

    }
    TextField{
        id:text_passup1
        placeholderText: qsTr("password")
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top:text_logup.bottom
        visible:false
    }
    TextField{
        id:text_passup2
        placeholderText: qsTr("repeat your password")
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top:text_passup1.bottom
        visible:false

    }
    TextField{
        id:text_nickname
        placeholderText: qsTr("nickname")
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top:text_passup2.bottom
        visible:false
    }
    Text {
        id: slash
        text: qsTr("/")
        color: "black"
        font.pixelSize: 15
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        id: title_inf1
        text: qsTr("_")
        visible: false
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top:text_passin.bottom
    }
    Text {
        id: title_inf2
        text: qsTr("_")
        visible: false
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top:text_nickname.bottom
    }
    Text {
        id: sign_in
        text: qsTr("sign in")
        font.pixelSize: 15
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: slash.right
        anchors.leftMargin: 5
        MouseArea{
                cursorShape:Qt.PointingHandCursor
                anchors.fill: parent
                onClicked: {
                    text_login.visible=!text_login.visible
                    text_passin.visible=!text_passin.visible
                    text_logup.visible=!text_logup.visible
                    text_passup1.visible=!text_passup1.visible
                    text_passup2.visible=!text_passup2.visible
                    text_nickname.visible=!text_nickname.visible
                    title_text.text="Sing in"
                }
        }
    }
    Text {
        id: sign_up
        text: qsTr("sign up")
        font.pixelSize: 15
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: slash.left
        anchors.rightMargin: 5
        MouseArea{
                cursorShape:Qt.PointingHandCursor
                anchors.fill: parent
                onClicked: {
                    text_login.visible=!text_login.visible
                    text_passin.visible=!text_passin.visible
                    text_logup.visible=!text_logup.visible
                    text_passup1.visible=!text_passup1.visible
                    text_passup2.visible=!text_passup2.visible
                    text_nickname.visible=!text_nickname.visible
                    title_text.text="Sing up"
                }
        }
    }
    Button{
        id:button_sighin
        anchors.top: title_inf1.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("sign in")
        visible: text_login.text.length>=5 & text_passin.text.length>=5
        onClicked: {
            title_inf1.visible=true
            title_inf1.text="Please wait..."
        }
    }
    Button{
        id:button_sighup
        anchors.top: title_inf2.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("sign up")
        visible: text_logup.text.length>=5 & text_passup1.text.length>=5 & text_passup2.text.length>=5 & text_nickname.text.length>=5
        onClicked: {
            if(text_passup1.text!=text_passup2.text)
                title_inf2.text="Error. Password doesn't much"
            else
                title_inf2.text="Cheack your mail"
            title_inf2.visible=true
        }
    }

}

