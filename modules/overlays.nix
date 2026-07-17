{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      mcpelauncher-ui-qt = prev.mcpelauncher-ui-qt.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          (builtins.toFile "mcpelauncher-googleaccount-parent.patch" ''
            diff --git a/mcpelauncher-ui-qt/googleaccount.h b/mcpelauncher-ui-qt/googleaccount.h
            index f81a29b..bb32349 100644
            --- a/mcpelauncher-ui-qt/googleaccount.h
            +++ b/mcpelauncher-ui-qt/googleaccount.h
            @@ -15,6 +15,8 @@ private:
                 QString m_accountToken;
             
             public:
            +    explicit GoogleAccount(QObject* parent = nullptr) : QObject(parent) {}
            +
                 QString const& accountIdentifier() const { return m_accountIdentifier; }
                 QString const& accountUserId() const { return m_accountUserId; }
                 QString const& accountToken() const { return m_accountToken; }
            diff --git a/mcpelauncher-ui-qt/googleloginhelper.cpp b/mcpelauncher-ui-qt/googleloginhelper.cpp
            index 461b306..f285a6f 100644
            --- a/mcpelauncher-ui-qt/googleloginhelper.cpp
            +++ b/mcpelauncher-ui-qt/googleloginhelper.cpp
            @@ -13,7 +13,7 @@ std::string GoogleLoginHelper::getTokenCachePath() {
                 return QDir(QStandardPaths::writableLocation(QStandardPaths::CacheLocation)).filePath("playapi_token_cache.conf").toStdString();
             }
             
            -GoogleLoginHelper::GoogleLoginHelper() : loginCache(getTokenCachePath()), login(device, loginCache) {
            +GoogleLoginHelper::GoogleLoginHelper() : loginCache(getTokenCachePath()), login(device, loginCache), currentAccount(this) {
                 unlockkey = settings.value("key").toString();
                 loadAccount();
             }
          '')
        ];
      });
    })
  ];
}
