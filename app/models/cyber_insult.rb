
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __FILE__)
load Gem.bin_path('bundler', 'bundle')

# class CyberInsult
#   attr_reader :fl_pronoun, :fl_noun, :fl_comp, :fl_cond
#
#
#   PRONOUNS = ["She", "He", "They", "That bastard", "That bitch", "Neo", "Acid Burn", "The Plague",
#                 "J Random Hacker", "That hacker", "That console cowboy",
#                 "That decker", "The boss", "My boss", "The new kid", "That kid" ]
#
#
#   COMPARISON = ["looks like a", "smells like a", "codes like a", "hacks like a",
#                 "fucks like a", "works like a", "is a" ]
#
#   NOUNS = ["20th century tourist", "wilson", "noob", "fed", "random", "bot",
#                 "warez d00d", "l33t d00d", "flatline", "raver", "tourist",
#                 "buttonhead", "mall ninja", "choob", "cylon" ]
#
#   CONDITIONS = ["with no skills", "who just got beat", "three days dead",
#                 "with broken hands", "on DSL", "on rollerblades",
#                 "on designer drugs", "on ISDN", "in  mirrorshades", "from the Sprawl",
#                 "on derms", "with deceleration poisoning"]


  def initialize
    @fl_pronoun = PRONOUNS.sample
    @fl_noun = NOUNS.sample
    @fl_comp = COMPARISON.sample
    @fl_cond = CONDITIONS.sample
	end


  def print_insult
    "#{@fl_pronoun} " "#{@fl_comp} " "#{@fl_noun} " "#{@fl_cond}."
  end


require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_SECRET"]


insult = CyberInsult.new
client.update(insult.print_insult)

#insult = CyberInsult.new
#print insult.print_insult
