# Godlike

The best autotest add on ever. Its motivational. Its awesome. Its Godlike. Godlike is an autotest hook that places cool sounds when you acheive 100% test passing rate. The default sound is the Unreal Tournament voice: GODLIKE

## Requirements

Godlike only works for Macs because they are the most god like.	
	
## Installation

	sudo gem install gemcutter
	sudo gem tumble
	sudo gem install godlike
	
	# .autotest
	require 'godlike'

## Customization

You can choose any of the few cools sounds I've included in the gem.

  * godlike.mp3
  * headshot.mp3
  * killingspree.mp3
  * perfect.mp3
  * supreme_victory.mp3
  * ultrakill.mp3
  * frag.mp3
  * flag_capture.mp3

Set the GODLIKE_SOUND consant in your autotest file

	require 'godlike'
	GODLIKE_SOUND = 'supreme_victory' # leave off extension
	# Note, you can also provided an absolute path to play your own sounds

Or set to a proc:

	sounds = %w[godlike headshot killingspree perfect supreme_victory ultrakill flag_capture frag]
	GODLIKE_SOUND = proc { sounds[(sounds.size*rand).to_i] }
	# Pic a sound at random each time


## Notes
The Autotest hook :all\_good was firing even on failure for me so I've changed it to use the :ran\_command hook plus some checks. -Arthur

Big thanks to [Carlos Brando](http://github.com/carlosbrando/autotest-notification) for writing the cocoa script to play audio. 



