module Iyoutu
  Format = Struct.new(:format_code, :extension, :resolution_note)
  class YoutubeDLFormats
    attr_accessor :formats_output
    attr_accessor :video_only
    attr_accessor :audio_only
    attr_accessor :video_with_audio

    def initialize(formats_output)
      @formats_output = formats_output
      @video_only = []
      @audio_only = []
      @video_with_audio   = []

      formats_output_lines = formats_output.split("\n")
      # Partition formats
      formats_output_lines.each do |line|
        if line    =~ /audio only/
          @audio_only << parse_format_line(line)
        elsif line =~ /video only/
          @video_only << parse_format_line(line)
        elsif line =~ /^(\d+).*$/ # line starts with number(s)
          @video_with_audio   << parse_format_line(line)
        else
          # skip
        end
      end
    end

    def parse_format_line(line)
      format_line_regexp = /^(?<format_code>[^ ]+) +(?<extension>[[:alnum:]]+) +(?<resolution_note>.*)$/
      matches = format_line_regexp.match(line)
      Format.new(matches[:format_code], matches[:extension], matches[:resolution_note])
    end
  end
end
