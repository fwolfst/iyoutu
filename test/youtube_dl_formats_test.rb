require "test_helper"

class YoutubeDLFormatsTest < Minitest::Test
  YOUTUBE_DL_F_OUTPUT = <<~HEREDOC
    [youtube] bogus_id: Downloading webpage
    [youtube] bogus_id: Downloading video info webpage
    [info] Available formats for bogus_id:
    format code  extension  resolution note
    249          webm       audio only DASH audio   58k , opus @ 50k, 15.50MiB
    250          webm       audio only DASH audio   77k , opus @ 70k, 19.79MiB
    140          m4a        audio only DASH audio  132k , m4a_dash container, mp4a.40.2@128k, 44.05MiB
    171          webm       audio only DASH audio  133k , vorbis@128k, 33.12MiB
    251          webm       audio only DASH audio  150k , opus @160k, 38.50MiB
    256          m4a        audio only DASH audio  197k , m4a_dash container, mp4a.40.5, 66.01MiB
    258          m4a        audio only DASH audio  388k , m4a_dash container, mp4a.40.2, 131.21MiB
    278          webm       256x144    144p  100k , webm container, vp9, 24fps, video only, 25.27MiB
    160          mp4        256x144    144p  119k , avc1.4d400c, 24fps, video only, 37.83MiB
    242          webm       426x240    240p  226k , vp9, 24fps, video only, 27.67MiB
    133          mp4        426x240    240p  268k , avc1.4d4015, 24fps, video only, 83.38MiB
    243          webm       640x360    360p  317k , vp9, 24fps, video only, 80.72MiB
    134          mp4        640x360    360p  638k , avc1.4d401e, 24fps, video only, 91.72MiB
    244          webm       854x480    480p  643k , vp9, 24fps, video only, 163.53MiB
    135          mp4        854x480    480p 1167k , avc1.4d401e, 24fps, video only, 191.76MiB
    247          webm       1280x720   720p 1338k , vp9, 24fps, video only, 360.61MiB
    136          mp4        1280x720   720p 2331k , avc1.4d401f, 24fps, video only, 373.14MiB
    248          webm       1920x1080  1080p 2429k , vp9, 24fps, video only, 697.21MiB
    137          mp4        1920x1080  1080p 4369k , avc1.640028, 24fps, video only, 734.75MiB
    271          webm       2560x1440  1440p 6296k , vp9, 24fps, video only, 1.95GiB
    313          webm       3840x2160  2160p 12673k , vp9, 24fps, video only, 3.94GiB
    18           mp4        640x360    medium  362k , avc1.42001E, mp4a.40.2@ 96k (44100Hz), 123.34MiB
    22           mp4        1280x720   hd720 1132k , avc1.64001F, mp4a.40.2@192k (44100Hz) (best)
  HEREDOC

  YOUTUBE_DL_F_OUTPUT_2 = <<~HEREDOC
    [ARD] other-video: Downloading XML
    [info] Available formats for 102:
    format code                 extension  resolution note
    5.2.7.12.1_HDS_VoD_Web-L-0  f4m        unknown    (unsupported) , H.264
    5.2.7.12.1_HDS_VoD_Web-L-1  f4m        unknown    (unsupported) , H.264
    5.2.13.12.1_Web_L-0         m3u8       unknown    H.264
    5.2.13.12.1_Web_L-1         m3u8       unknown    H.264
    5.2.13.14.1_Web_XL-0        m3u8       unknown    H.264
    5.2.13.14.1_Web_XL-1        m3u8       unknown    H.264
    1.2.3.6.1_Prog_320x180-0    mp4        320x180     184k , H.264@ 128k, audio@ 56k
    1.2.3.6.1_Prog_320x180-1    mp4        320x180     184k , H.264@ 128k, audio@ 56k
    1.2.3.7.1_Prog_480x270-0    mp4        480x270     320k , H.264@ 256k, audio@ 64k
    1.2.3.7.1_Prog_480x270-1    mp4        480x270     320k , H.264@ 256k, audio@ 64k
    1.2.3.9.1_Web_M-0           mp4        512x288     608k , H.264@ 512k, audio@ 96k
    1.2.3.9.1_Web_M-1           mp4        512x288     608k , H.264@ 512k, audio@ 96k
    1.2.3.11.1_Web_L-0          mp4        640x360    1216k , H.264@1024k, audio@192k
    1.2.3.11.1_Web_L-1          mp4        640x360    1216k , H.264@1024k, audio@192k
    1.2.3.12.2_Web_L-0          mp4        960x540    1992k , H.264@1800k, audio@192k
    1.2.3.12.2_Web_L-1          mp4        960x540    1992k , H.264@1800k, audio@192k
    1.2.3.12.3_HbbTV_960x540-0  mp4        960x540    1992k , H.264@1800k, audio@192k
    1.2.3.12.3_HbbTV_960x540-1  mp4        960x540    1992k , H.264@1800k, audio@192k
    1.2.3.14.1_Prog_1280x720-0  mp4        1280x720   3776k , H.264@3584k, audio@192k
    1.2.3.14.1_Prog_1280x720-1  mp4        1280x720   3776k , H.264@3584k, audio@192k (best)
  HEREDOC


  def test_it_parses_youtube_dl_format_output
    formats = Iyoutu::YoutubeDLFormats.new(YOUTUBE_DL_F_OUTPUT)
    assert_equal 14, formats.video_only.count
    assert_equal 7,  formats.audio_only.count
    assert_equal 2,  formats.video_with_audio.count
  end

  def test_it_parses_youtube_dl_xml_format_output
    formats = Iyoutu::YoutubeDLFormats.new(YOUTUBE_DL_F_OUTPUT_2)
    assert_equal 0,  formats.video_only.count
    assert_equal 0,  formats.audio_only.count
    assert_equal 20, formats.video_with_audio.count
  end
end

