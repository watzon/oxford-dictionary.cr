require "file"
require "http/client"

require "./types"

class OxfordDictionary
  VERSION = "0.1.0"

  def initialize(
    @app_id : String,
    @app_key : String,
    @api_base_url : String = "od-api.oxforddictionaries.com")
    @client = HTTP::Client.new(@api_base_url, tls: true)
    @client.before_request do |request|
      request.headers["Accept"]  = "application/json"
      request.headers["app_id"]  = app_id
      request.headers["app_key"] = app_key
    end
  end

  def find(word : String, language : String = "en", region : String? = nil)
    request("entries/#{language}/#{word}")
  end

  def define(word : String, language : String = "en")
    request("entries/#{language}/#{word}/definitions")
  end

  def examples(word : String, language : String = "en")
    request("entries/#{language}/#{word}/examples")
  end

  def pronunciations(word : String, language : String = "en")
    request("entries/#{language}/#{word}/pronunciations")
  end

  def inflections(word : String, language : String = "en")
    request("inflections/#{language}/#{word}")
  end

  def synonyms(word : String, language : String = "en")
    request("entries/#{language}/#{word}/synonyms")
  end

  def antonyms(word : String, language : String = "en")
    request("entries/#{language}/#{word}/antonyms")
  end

  def thesaurus(word : String, language : String = "en")
    request("entries/#{language}/#{word}/synonyms;antonyms")
  end

  def sentences(word : String, language : String = "en")
    request("entries/#{language}/#{word}/sentences")
  end

  def translate(word : String, from from_language : String, to target_language : String)
    request("entries/#{from_language}/#{word}/translations=#{target_language}")
  end

  private def request(path : String)
    uri = File.join("/api/v1", path)
    response = @client.get(uri)
    if response.success?
      return Types::Result.from_json(response.body)
    else
      return nil
    end
  end
end