# Godlike
# Extracted code from Carlos Brando's autotest notifications
# Wanted to make something easy that would play a cool sound
# after a successful test run
# aka: GODLIKE


def play_sound sound_file
  `#{File.expand_path(File.dirname(__FILE__) + "/../bin/")}/playsound #{sound_file}`
end

def success
  sound_file = ""
  sounds_directory = "#{File.dirname(__FILE__)}/godlike/sounds"
  
  if defined?(GODLIKE_SOUND)
    sound_name = GODLIKE_SOUND.is_a?(Proc) ? GODLIKE_SOUND.call : GODLIKE_SOUND
    if File.exists? "#{sounds_directory}/#{sound_name}.wav"
      sound_file = "#{sounds_directory}/#{sound_name}.wav"
    else
      sound_file = sound_name
    end
  else
    sound_file = "#{sounds_directory}/godlike.wav"
  end
  play_sound(sound_file)
end

def fail
  # do nothing
end

def pending
  # do nothing
end


Autotest.add_hook :ran_command do |autotest|
    result = Result.new(autotest)
    if result.exists?
      if result.has?('test-error') || result.has?('test-failed') || result.has?('example-failed')
        fail
      elsif result.has?('example-pending')
        pending
      else
        success
      end
    end
end