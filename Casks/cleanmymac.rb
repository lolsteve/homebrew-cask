cask 'cleanmymac' do
  if MacOS.release <= :snow_leopard
    version '1.11-1417522595'
    sha256 'ac5d4bf36882dd34bdb0a68eb384a6b3aba355be896d03dfa40a120c6bef4a0d'

    # devmate.com is the official download host per the appcast feed
    url "http://dl.devmate.com/com.macpaw.CleanMyMac/#{version.sub(%r{-.*$},'')}/#{version.sub(%r{.*?-},'')}/CleanMyMacClassic-#{version.sub(%r{-.*$},'')}.zip"
    appcast 'http://updates.devmate.com/com.macpaw.CleanMyMac.xml',
            :sha256 => '13bbf950696a9410fec848e80652f2826209b347fdb329b117371e25445951f5'
    app 'CleanMyMac.app'
    # todo: add uninstall and zap stanzas for legacy app
  elsif MacOS.release <= :lion
    version '2.3.5-1427986644'
    sha256 '16e192edcf58f25c6763349ef0e5194268bec4d000912b64b34f5897b4784097'
    # devmate.com is the official download host per the appcast feed
    url "http://dl.devmate.com/com.macpaw.CleanMyMac2/#{version.sub(%r{-.*$},'')}/#{version.sub(%r{.*?-},'')}/CleanMyMac#{version.to_i}-#{version.sub(%r{-.*$},'')}.zip"
    appcast "http://updates.devmate.com/com.macpaw.CleanMyMac#{version.to_i}.xml"
    app "CleanMyMac #{version.to_i}.app"

    uninstall :launchctl => "com.macpaw.CleanMyMac#{version.to_i}.Agent"

    zap :delete => [
      "/Library/LaunchDaemons/com.macpaw.CleanMyMac#{version.to_i}.Agent.plist",
      "/Library/PrivilegedHelperTools/com.macpaw.CleanMyMac#{version.to_i}.Agent",
      "/Users/Shared/CleanMyMac #{version.to_i}",
      "/private/var/run/com.macpaw.CleanMyMac#{version.to_i}.Agent.socket",
      "~/Library/Application Support/CleanMyMac #{version.to_i}",
      "~/Library/Caches/CleanMyMac #{version.to_i}",
      "~/Library/Logs/CleanMyMac #{version.to_i}.log",
      "~/Library/Preferences/com.macpaw.CleanMyMac-#{version.to_i}-Helper.plist",
      "~/Library/Preferences/com.macpaw.CleanMyMac#{version.to_i}.KnowledgeBase.plist",
      "~/Library/Preferences/com.macpaw.CleanMyMac#{version.to_i}.plist",
    ]
  else
    version '3.2.1-1448556223'
    sha256 'a5e7587d7edcece90c0d5b0b6aed8d008b6a1a93cb6911f0cf2e9e0c0453e6c4'

    # devmate.com is the official download host per the appcast feed
    url "http://dl.devmate.com/com.macpaw.CleanMyMac#{version.to_i}/#{version.sub(%r{-.*$},'')}/#{version.sub(%r{.*?-},'')}/CleanMyMac3-#{version.sub(%r{-.*$},'')}.zip"
    app "CleanMyMac #{version.to_i}.app"

    postflight do
      suppress_move_to_applications
    end

    uninstall :launchctl => "com.macpaw.CleanMyMac#{version.to_i}.Agent"

    zap :delete => [
      "/Library/LaunchDaemons/com.macpaw.CleanMyMac#{version.to_i}.Agent.plist",
      "/Library/PrivilegedHelperTools/com.macpaw.CleanMyMac#{version.to_i}.Agent",
      "/Users/Shared/CleanMyMac #{version.to_i}",
      "/private/var/run/com.macpaw.CleanMyMac#{version.to_i}.Agent.socket",
      "~/Library/Application Support/CleanMyMac #{version.to_i}",
      "~/Library/Application Support/CleanMyMac #{version.to_i} Menu",
      "~/Library/Caches/CleanMyMac #{version.to_i}",
      "~/Library/Logs/CleanMyMac #{version.to_i}.log",
      "~/Library/Preferences/com.macpaw.CleanMyMac-#{version.to_i}-Helper.plist",
      "~/Library/Preferences/com.macpaw.CleanMyMac#{version.to_i}.KnowledgeBase.plist",
      "~/Library/Preferences/com.macpaw.cleanmymac#{version.to_i}.menu.plist",
      "~/Library/Preferences/com.macpaw.CleanMyMac#{version.to_i}.plist",
    ]
  end

  name 'CleanMyMac'
  homepage 'https://macpaw.com/cleanmymac'
  license :commercial
end
