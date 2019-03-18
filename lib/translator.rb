# require modules here
require 'yaml'
#emo_path = YAML.load_file('./lib/emoticons.yml')

def load_library(emo_path)
  # code goes here
  emoticons_list = YAML.load_file(emo_path)

  new_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticons_list.each do |meaning, emoticons| # key  = "angel, angry, "bored" etc" ... value = "O:)", "☜(⌒▽⌒)☞" etc
    english = emoticons[0] #O:)
    japanese = emoticons[1] #☜(⌒▽⌒)☞
    new_hash['get_meaning'][japanese] = meaning # "get_meaning" => ☜(⌒▽⌒)☞: angel}
    new_hash['get_emoticon'][english] = japanese # "get_emoticon" => O:): ☜(⌒▽⌒)☞
  end
 new_hash
end

def get_japanese_emoticon(emo_path = YAML.load_file('./lib/emoticons.yml'), emoticon)
    new_hash = load_library(emo_path)
    new_hash["get_emoticon"].each do |english, japanese|
    if english == emoticon
      return japanese
    end
  end
    return 'Sorry, that emoticon was not found'
end

def get_english_meaning(emo_path = YAML.load_file('./lib/emoticons.yml'), emoticon)
  new_hash = load_library(emo_path)
  new_hash["get_meaning"].each do |japanese, meaning|
    if emoticon == japanese
      return meaning
    end
  end
    return 'Sorry, that emoticon was not found'
end
