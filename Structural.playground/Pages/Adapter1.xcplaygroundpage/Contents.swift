
// Old Interface
protocol OldMediaPlayer {
    func insertGramophoneRecord(title: String)
    func play()
}

// Old realisation
class Gramophone: OldMediaPlayer {
    func insertGramophoneRecord(title: String) {
        print("Inserting \(title) Gramophone Record")
    }
    
    func play() {
        print("Pressing 'Play' lever on gramophone")
    }
}


// Actual interface
protocol NewMediaPlayer {
    func insertCD(title: String)
    func playCD()
}

// Actual realisation
class CDPlayer: NewMediaPlayer {
    func insertCD(title: String) {
        print("Inserting \(title) CD")
    }
    
    func playCD() {
        print("Pressing 'Play' button on CD-player")
    }
}


// Adapter
class MediaAdapter: OldMediaPlayer {
    
    private let mediaPlayer: CDPlayer
    
    init(mediaPlayer: CDPlayer) {
        self.mediaPlayer = mediaPlayer
    }
    
    func insertGramophoneRecord(title: String) {
        mediaPlayer.insertCD(title: title)
    }
    
    func play() {
        mediaPlayer.playCD()
    }
}


// Demo
let actualPlayer = Gramophone()
let adaptedMediaPlayer = MediaAdapter(mediaPlayer: CDPlayer())

var list: [OldMediaPlayer] = []
list.append(actualPlayer)
list.append(adaptedMediaPlayer)

for player in list {
    player.insertGramophoneRecord(title: "[Elvis Presley - Elastic Heart]")
    player.play()
}
