import AVFoundation

class AudioManager {
    static let shared = AudioManager() // Singleton
    var audioPlayer: AVAudioPlayer?
    private var isMuted: Bool = false
    
    func toggleMute() {
        isMuted.toggle()
        if isMuted {
            audioPlayer?.pause()
        } else {
            audioPlayer?.play()
        }
    }

    func playBackgroundMusic() {
        guard let path = Bundle.main.path(forResource: "rodeo-sonda-main-version-22509-01-35", ofType: "mp3") else {
            print("Muziekbestand niet gevonden")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops = -1
            if !isMuted{
                audioPlayer?.play()
            }
            audioPlayer?.play()
        } catch {
            print("Fout bij afspelen van muziek: \(error.localizedDescription)")
        }
    }
    
    func playCowSound() {
        guard let path = Bundle.main.path(forResource: "cow-moo-smartsound-fx-1-00-02", ofType: "mp3") else {
            print("Muziekbestand niet gevonden")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops = 0
            if !isMuted {
                audioPlayer?.play() 
            }
        } catch {
            print("Fout bij afspelen van muziek: \(error.localizedDescription)")
        }
    }

}
