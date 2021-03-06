import QtQuick 2.10
import QtQuick.Controls 2.3
import ".."

Menu {
	id: control
	dim: false
	modal: true

	property int type: 0
	property int currentInd: -1

	Repeater {
		id: rep
		model: ["Play", "Add To Queue",
			"Add To Playlist", "Show Details", "Remove"]

		delegate: MenuItem {
			text: modelData

			onTriggered: {
				control.close()
				var ind = index+1

				if (ind == 3)
					playlistDialog.openWith(2, type, currentInd)
				else
					MainManager.trackActionTriggered(ind, currentInd)

				if (ind == 4)
					detailsDialog.open()
			}
		}
	}
}
