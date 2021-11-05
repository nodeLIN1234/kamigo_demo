module HomeHelper
  def env_setup_info
    infos = [
      {
        env_name: "LINE_CHANNEL_SECRET",
        channel_name: "LINE Messaging API",
        channel_tab: "Basic settings",
        field_name: "Channel secret"
      },
      {
        env_name: "LINE_CHANNEL_TOKEN",
        channel_name: "LINE Messaging API",
        channel_tab: "Messaging API",
        field_name: "Channel access token"
      },
      # {
      #   env_name: "ADMIN_LINE_ID",
      #   channel_name: "LINE Messaging API",
      #   channel_tab: "Basic settings",
      #   field_name: "Your user ID"
      # },
      {
        env_name: "BOT_ID",
        channel_name: "LINE 官方帳號後台",
        channel_tab: "最上方",
        field_name: "加入機器人好友時所需的 LINE ID"
      },
      {
        env_name: "LINE_LOGIN_CHANNEL_ID",
        channel_name: "LINE Login",
        channel_tab: "Basic settings",
        field_name: "Channel ID"
      },
      {
        env_name: "LINE_LOGIN_CHANNEL_SECRET",
        channel_name: "LINE Login",
        channel_tab: "Basic settings",
        field_name: "Channel secret"
      },
      {
        env_name: "LIFF_COMPACT",
        channel_name: "LINE Login",
        channel_tab: "LIFF",
        field_name: "Size 為 Compact 的 LIFF URL"
      },
      {
        env_name: "LIFF_TALL",
        channel_name: "LINE Login",
        channel_tab: "LIFF",
        field_name: "Size 為 Tall 的 LIFF URL"
      },
      {
        env_name: "LIFF_FULL",
        channel_name: "LINE Login",
        channel_tab: "LIFF",
        field_name: "Size 為 Full 的 LIFF URL"
      },
    ]

    infos.filter do |info|
      ENV[info[:env_name]].nil?
    end
  end

  def flex_messages
    {
      kamiflex_share_bot: kamiflex_share_bot,
      kamiflex_share_bot2: kamiflex_share_bot2,
      kamiflex_share_bot3: kamiflex_share_bot3
    }
  end

  # 分享機器人
  def kamiflex_share_bot
    Kamiflex.hash(self) do
      alt_text "Kamigo Demo 向您傳送了聯絡資訊"
      bubble do
        body do
          horizontal_box do
            text "Kamigo Demo", wrap: true, weight: :bold
            url_button "分享此訊息", safe_liff_path(path: "/share_bot?message_name=kamiflex_share_bot", liff_size: :compact), style: :primary, margin: :md
          end
          separator
          text "這是展示 Kamigo LINE Bot 框架的 LINE Bot，歡迎試用。", wrap: true, size: :sm, margin: :lg
          horizontal_box action: uri_action("https://line.me/R/ti/p/#{ENV["BOT_ID"]}"), borderColor: "#AAAAAA", borderWidth: :light, cornerRadius: :lg, margin: :xl do
            horizontal_box paddingAll: "10px" do
              horizontal_box cornerRadius: :xxl, width: "40px", height: "40px" do
                image "https://#{request.host}/images/kamigo.png", size: :full
              end
              text "Kamigo Demo", wrap: true, size: :lg, margin: :md, gravity: :center, weight: :bold, flex: 3
              text ">", color: "#AAAAAA", wrap: true, size: :md, gravity: :center, align: :end
            end
          end
        end
      end
    end
  end

  def kamiflex_share_bot2
    Kamiflex.hash(self) do
      alt_text "Kamigo Demo 向您傳送了聯絡資訊2"
      bubble do
        body do
          horizontal_box do
            text "Kamigo Demo2", wrap: true, weight: :bold
            url_button "分享此訊息", safe_liff_path(path: "/share_bot?message_name=kamiflex_share_bot2", liff_size: :compact), style: :primary, margin: :md
          end
        end
      end
    end
  end

  # 分享機器人
  def kamiflex_share_bot3
    Kamiflex.hash(self) do
      alt_text "Kamigo Demo 向您傳送了聯絡資訊"
      bubble do
        body paddingAll: "0px", margin: "0px" do
          horizontal_box width: "100%", height: "200px" do
            backgroundColor "https://tw.appledaily.com/resizer/fEE1TNf6TiKnMdqqLQlzC7KA5AM=/535x301/filters:quality(100)/cloudfront-ap-northeast-1.images.arcpublishing.com/appledaily/OWLTPDXZM5DEBPQ4RAP5TH3PCI.jpg", size: :full, aspectRatio: "20:13"
          end
          horizontal_box do
            text "Kamigo Demo", wrap: true, weight: :bold
            url_button "分享此訊息", safe_liff_path(path: "/share_bot?message_name=kamiflex_share_bot3", liff_size: :compact), style: :primary, margin: :md
          end
          separator
          text "這是展示 Kamigo LINE Bot 框架的 LINE Bot，歡迎試用。", wrap: true, size: :sm, margin: :lg
          horizontal_box action: uri_action("https://line.me/R/ti/p/#{ENV["BOT_ID"]}"), 
          borderColor: "#AAAAAA", borderWidth: :light, cornerRadius: :lg, margin: :xl do
            horizontal_box paddingAll: "10px" do
              horizontal_box cornerRadius: :xxl, width: "40px", height: "40px" do
                image "https://tw.appledaily.com/resizer/fEE1TNf6TiKnMdqqLQlzC7KA5AM=/535x301/filters:quality(100)/cloudfront-ap-northeast-1.images.arcpublishing.com/appledaily/OWLTPDXZM5DEBPQ4RAP5TH3PCI.jpg", size: :full
              end
              text "Kamigo Demo", wrap: true, size: :lg, margin: :md, gravity: :center, weight: :bold, flex: 3
              text ">", color: "#AAAAAA", wrap: true, size: :md, gravity: :center, align: :end
            end
          end
        end
      end
    end
  end

  def safe_liff_path(*args, **option)
    return liff_path(*args, **option) if ENV["LIFF_COMPACT"].present? && ENV["LIFF_TALL"].present? && ENV["LIFF_FULL"].present?
    root_url
  end
end
