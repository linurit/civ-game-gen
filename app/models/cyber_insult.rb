
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __FILE__)
load Gem.bin_path('bundler', 'bundle')

class CyberInsult
  attr_reader :fl_pronoun, :fl_noun, :fl_comp, :fl_cond


  PRONOUNS = ["She", "He", "That bastard", "That bitch", "Neo", "Acid Burn", "The Plague",
                "J Random Hacker", "That hacker", "That console cowboy",
                "That decker", "The boss", "My boss", "The new kid", "That kid",
                "the cyber czar" ]


  COMPARISON = ["looks like a", "looked like a", "smells like a", "smelled like a",
                "codes like a", "coded like a", "hacks like a", "hacked like a",
                "fucks like a", "fucked like a", "works like a", "worked like a",
                "is a", "was a", "has eyes like a", "played like a", "plays like a",
                "moves like a", "moved like a", "dresses like a", "walks like a",
                "walked like a", "talked like a", "talks like a", "died like a",
                "acts like a", "acted like a", "has the dead eyes of"]

  NOUNS = ["20th century tourist", "wilson", "noob", "fed", "random", "bot",
                "warez d00d", "l33t d00d", "flatline", "raver", "tourist",
                "buttonhead", "mall ninja", "cyber-criminal", "hacker", "poser",
                "dot-matrix printer", "algorithm", "blogger", "skid", "virus",
                "pirate", "COBOL programmer", "C developer", "perl addict",
                "Apple fanatic", "Atari fanatic", "Amiga fanatic", "a chump",
                "a cyber-tourist" ]

  CONDITIONS = ["with no skillz", "who just got beat", "three days dead",
                "with broken hands", "on DSL", "on his grampa's modem",
                "on rollerblades", "on designer drugs", "on ISDN",
                "in  mirrorshades", "from the Sprawl", "on derms",
                "full of pills", "in cyberspace", "in my mentions",
                "sliding into my DMs", "at Defcon", "at B-Sides", "at RSA",
                "on an Amiga", "on an Atari", "on a Ono-Sendai", "on a Apple ][e",
                "in heat"]
                 ]


  def initialize
    @fl_pronoun = PRONOUNS.sample
    @fl_noun = NOUNS.sample
    @fl_comp = COMPARISON.sample
    @fl_cond = CONDITIONS.sample(2)
	end


  def print_insult
    "#{@fl_pronoun} " "#{@fl_comp} " "#{@fl_noun} " "#{@fl_cond}."
  end

end

require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_SECRET"]
end

insult = CyberInsult.new
client.update(insult.print_insult)

#insult = CyberInsult.new
#print insult.print_insult
