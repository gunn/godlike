# Godlike
# Extracted code from Carlos Brando's autotest notifications
# Wanted to make something easy that would play a cool sound
# after a successful test run
# aka: GODLIKE

module AutotestNotification
  class Config
 
    class << self
      attr_reader :images_directory
    end
 
    self.sounds_directory = "#{File.dirname(__FILE__)}/godlike/sounds"
  end
 
  Autotest.add_hook :ran_command do |at|
    result = at.results.is_a?(Array) ? at.results.last : at.results.split("\n").last
 
    if result
      %w{ error failure }.each { |x| instance_variable_set "@#{x}s", result[/(\d+) #{x}/, 1].to_i }
      
      case result
      when /test/
        play_sound unless @failures > 0 || @errors > 0
      when /example/
        play_sound unless @failures > 0
      end
    end
  end
 
  Autotest.add_hook :ran_features do |at|
    results = at.results.is_a?(Array) ? at.results : at.results.split("\n")
    if results
      # How many scenarios and steps have passed, are pending, have failed or are undefined?
      for result in results
        next unless result =~ /^\d+ (scenario|step)/
        scenario_or_step = $1
        %w( scenario step passed pending failed undefined ).each do |x|
          instance_variable_set "@#{scenario_or_step}_#{x}", result[/(\d+) #{x}/, 1].to_i
        end
      end
 
      play_sound if @scenario_failed + @step_failed == 0
    end
  end
 
  class << self
    def play_sound
      
      if !GODLIKE_SOUND.empty?
        sound_file = "#{sounds.directory}/godlike.wav" #default to godlike
      elsif File.exists? "#{sounds.directory}/#{GODLIKE_SOUND}.wav" 
        sound_file = "#{sounds.directory}/#{GODLIKE_SOUND}.wav" # user wants to play an included sound
      else
        sound_file = GODLIKE_SOUND #user wants to play an absolute path
      end
      
      #thanks Cralos Brando for the code!
      `#{File.expand_path(File.dirname(__FILE__) + "/../bin/")}/playsound #{sound_file}`
    end
  end
end