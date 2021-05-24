tempo = 80

start_note = 60
depth_level = 3
step_size = 2
end_note = start_note + (depth_level * 4)
ring_size = (end_note-start_note)/step_size
counter = 0

live_loop :triumph do
  use_synth :mod_sine
  use_bpm tempo
  note_ring = (range start_note, end_note, step: step_size, inclusive: true)
  reversed_ring = note_ring.reverse
  
  play_ring_forward note_ring, ring_size
  sleep(1)
  use_synth :beep
  play_ring_chords note_ring, ring_size/3
  sleep(1)
  
  use_synth :mod_sine
  play_ring_backward reversed_ring, ring_size
  sleep(2)
  play_ring_chords reversed_ring, ring_size/3
  
  
  
  if (start_note >= 120)
    start_note = 60
  else
    start_note += 16
  end
  
  end_note = start_note + (depth_level * 4)
  ring_size = (end_note-start_note)/step_size
  
  if (tempo > 50 && count >= 8)
    tempo -= 3
  end
  
  counter += 1
  
end
