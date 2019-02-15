require 'iyoutu/version'
require 'iyoutu/youtube_dl_formats'

module Iyoutu
  class Error < StandardError; end

  ABORT_CHOICE = {
    name: "! Abort",
    value: :abort
  }

  def self.user_choose_format(prompt, question, formats)
    choices = formats.map do |format|
      {
        name:  "#{format.extension}/#{format.resolution_note}",
        value: format.format_code
      }
    end
    
    choices << ABORT_CHOICE

    prompt.select(question,
                  choices,
                  echo: false,
                  filter: true,
                  per_page: choices.length)
  end
end
