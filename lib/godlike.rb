# Godlike
# Extracted code from Carlos Brando's autotest notifications
# Wanted to make something easy that would play a cool sound
# after a successful test run
# aka: GODLIKE


Autotest.add_hook :all_good do
  sounds_directory = "#{File.dirname(__FILE__)}/godlike/sounds"
  
  sound_file = String.new
  
  if defined?(GODLIKE_SOUND)
    if File.exists? "#{sounds_directory}/#{GODLIKE_SOUND}.wav"
      sound_file = "#{sounds_directory}/#{GODLIKE_SOUND}.wav"
    else
      sound_file = GODLIKE_SOUND
    end
  else
    sound_file = "#{sounds_directory}/godlike.wav"
  end

  `#{File.expand_path(File.dirname(__FILE__) + "/../bin/")}/playsound #{sound_file}`
end