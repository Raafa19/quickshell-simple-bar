pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root
    readonly property MetaData audioMedia: MetaData {}
    property var players: Mpris.players?.values
    property var mainPlayer: players[0]

    component MetaData: QtObject {
        property string titulo: root.mainPlayer?.trackTitle || "Título Desconocido"
        property string artista: root.mainPlayer?.trackArtist || "Artista Desconocido"
        property string album: root.mainPlayer?.trackAlbum || "Álbum Desconocido"
        property string artUri: root.mainPlayer?.trackArtUrl || ""
    }
}
