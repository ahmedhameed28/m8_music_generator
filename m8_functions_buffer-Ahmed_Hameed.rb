##
## Defining some functions for this program
##

# plays notes in the order 1,3,2
define :play_rearranged do |start_note|
  play start_note, attack: 1, release: 2
  sleep(2)
  play start_note + 4, attack: 1, release: 3
  sleep(3)
  play start_note + 2, attack: 1, release: 4
  sleep(4)
end

# does the reverse of the above method: plays the notes in the order 2,3,1
define :play_reversed do |start_note|
  play start_note - 2, attack: 1, release: 4
  sleep(4)
  play start_note, attack: 1, release: 3
  sleep(3)
  play start_note - 4, attack: 1, release: 2
  sleep(2)
end

# iterates through the ring and plays the rearranges notes using the methods above
define :play_ring_forward do |ring_notes, num_notes|
  counter = 0
  num_notes.times do
    current = ring_notes[counter]
    play_rearranged current
    counter += 1
  end
end

# runs through a reversed version of the ring and plays the reverse of the rearranges notes
define :play_ring_backward do |ring_notes, num_notes|
  counter = 0
  num_notes.times do
    current = ring_notes[counter]
    play_reversed current
    counter += 1
  end
end

# plays 3 note triplets that are preesnt in the ring
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


