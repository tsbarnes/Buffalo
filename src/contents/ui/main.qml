/*
    SPDX-License-Identifier: GPL-2.0-or-later
    SPDX-FileCopyrightText: %{CURRENT_YEAR} %{AUTHOR} <%{EMAIL}>
*/

import QtQuick 2.6
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.13 as Kirigami

Kirigami.ApplicationWindow {
    id: root

    title: i18n("Buffalo")

    minimumWidth: Kirigami.Units.gridUnit * 20
    minimumHeight: Kirigami.Units.gridUnit * 20

    property int counter: 0

    globalDrawer: Kirigami.GlobalDrawer {
        title: i18n("Buffalo")
        titleIcon: "buffalo"
        isMenu: !root.isMobile
        actions: [
            Kirigami.Action {
                text: i18n("Plus One")
                icon.name: "list-add"
                onTriggered: {
                    counter += 1
                }
            },
            Kirigami.Action {
                text: i18n("Quit")
                icon.name: "gtk-quit"
                onTriggered: Qt.quit()
            }
        ]
    }

    contextDrawer: Kirigami.ContextDrawer {
        id: contextDrawer
    }

    pageStack.initialPage: page

    Kirigami.ScrollablePage {
        id: page

        Layout.fillWidth: true

        title: i18n("Buffalo")

        actions.main: Kirigami.Action {
            text: i18n("Login")
            icon.name: "login"
            tooltip: i18n("Log into Mastodon")
            onTriggered: {
                counter += 1
            }
        }

        ColumnLayout {
            width: page.width

            anchors.centerIn: parent

            Kirigami.Heading {
                text: i18n("Mastodon Timeline")
                Layout.alignment: Qt.AlignCenter
            }

            Controls.Button {
                Layout.alignment: Qt.AlignHCenter
                text: "+ 1"
                onClicked: counter += 1
            }
        }
    }
}
