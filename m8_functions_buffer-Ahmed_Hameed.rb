##
## Defining some functions for this program
##


define :play_rearranged do |start_note|
  play start_note, attack: 1, release: 2
  sleep(2)
  play start_note + 4, attack: 1, release: 3
  sleep(3)
  play start_note + 2, attack: 1, release: 4
  sleep(4)
end


define :play_reversed do |start_note|
  play start_note - 2, attack: 1, release: 4
  sleep(4)
  play start_note, attack: 1, release: 3
  sleep(3)
  play start_note - 4, attack: 1, release: 2
  sleep(2)
end


define :play_ring_forward do |ring_notes, num_notes|
  counter = 0
  num_notes.times do
    current = ring_notes[counter]
    play_rearranged current
    counter += 1
  end
end


define :play_ring_backward do |ring_notes, num_notes|
  counter = 0
  num_notes.times do
    current = ring_notes[counter]
    play_reversed current
    counter += 1
  end
end

define :play_ring_chords do |ring_notes, num_chords|
  current = ring_notes.take(3)
  rest = ring_notes.drop(3)
  
  num_chords.times do
    play current, attack: 0.5, sustain: 1, release: 5
    sleep(1)
    current = rest.take(3)
    rest = rest.drop(3)
  end
  
end


