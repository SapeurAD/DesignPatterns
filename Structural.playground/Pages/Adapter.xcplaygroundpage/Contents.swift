
protocol MediaPlayer {
    func play(audioType: String, filename: String)
}

protocol AdvancedMediaPlayer {
    func play(filename: String)
}

class Mp4Player: AdvancedMediaPlayer {
    func play(filename: String) {
        print("Playing mp4 file: " + filename)
    }
}

class VlcPlayer: AdvancedMediaPlayer {
    func play(filename: String) {
        print("Playing vlc file: " + filename)
    }
}

class MediaAdapter: MediaPlayer {
    private var advancedMediaPlayer: AdvancedMediaPlayer!
    
    init(audioType: String) {
        if audioType == "mp4" {
            advancedMediaPlayer = Mp4Player()
        }
        else if audioType == "vlc" {
            advancedMediaPlayer = VlcPlayer()
        }
    }
    
    func play(audioType: String, filename: String) {
        advancedMediaPlayer.play(filename: filename)
    }
}

class AudioPlayer: MediaPlayer {
    private var mediaAdapter: MediaAdapter!
    
    func play(audioType: String, filename: String) {
        if audioType == "mp3" {
            print("Playing mp3 file: " + filename)
        }
        else if audioType == "mp4" || audioType == "vlc" {
            mediaAdapter = MediaAdapter(audioType: audioType)
            mediaAdapter.play(audioType: audioType, filename: filename)
        }
        else { print("Invalid mediafile!") }
    }
}


// Demo
let audioPlayer = AudioPlayer()
audioPlayer.play(audioType: "mp3", filename: "Sia - Elastic Heart.mp3")
audioPlayer.play(audioType: "mp4", filename: "Metallica - Unforgiven.mp4")
audioPlayer.play(audioType: "vlc", filename: "Vivaldi - Summer.vlc")
audioPlayer.play(audioType: "avi", filename: "Star Wars.avi")






























/*
// Existing Interface
protocol OldMediaPlayer {
    func insertGramophoneRecord(title: String)
    func play()
}

// Existing realisation
class Gramophone: OldMediaPlayer {
    func insertGramophoneRecord(title: String) {
        print("Inserting \(title) Gramophone Record")
    }
    
    func play() {
        print("Playing song from Gramophone Record")
    }
}


// New interface
protocol NewMediaPlayer {
    func insertCD(title: String)
    func playCD()
}

// New realisation
class CDPlayer: NewMediaPlayer {
    func insertCD(title: String) {
        print("Inserting \(title) CD")
    }
    
    func playCD() {
        print("Playing track from CD")
    }
}


// Adapter
class MediaAdapter: NewMediaPlayer {
    
    private let mediaPlayer: Gramophone
    
    init(mediaPlayer: Gramophone) {
        self.mediaPlayer = mediaPlayer
    }
    
    func insertCD(title: String) {
        mediaPlayer.insertGramophoneRecord(title: title)
    }
    
    func playCD() {
        mediaPlayer.play()
    }
}


// Demo
let adaptedMediaPlayer = MediaAdapter(mediaPlayer: Gramophone())
adaptedMediaPlayer.insertCD(title: "[Sia - Elastic Heart]")
adaptedMediaPlayer.playCD()
*/