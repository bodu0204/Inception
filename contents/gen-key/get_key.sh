#!/bin/bash
openssl genrsa -out blyu.42.fr.key 2048 &&
echo "blyu.42.fr.key was made." &&
openssl req -out blyu.42.fr.csr -key blyu.42.fr.key -new -nodes -subj "/C=JP/ST=Tokyo/L=Ropongi/CN=blyu.42.fr"&&
echo "blyu.42.fr.csr was made." &&
openssl x509 -req -days 1 -signkey blyu.42.fr.key -in blyu.42.fr.csr -out blyu.42.fr.crt -extfile ${0%/*}/san.txt &&
echo "blyu.42.fr.crt was made." 

#openssl req -x509 -newkey rsa:4096 -nodes -keyout blyu.42.fr.key -out blyu.42.fr.crt -days 1 -subj "/C=JP/ST=Tokyo/L=Ropongi/CN=Webserv.blyu.42.fr" -extfile san.txt;
sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" "./blyu.42.fr.crt" &&
echo "security was set."

# security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" "証明書のパス"
#   証明書のインストール
# security
#   macOSにおいてセキュリティ関連の操作を行うためのコマンド。
# add-trusted-cert
#   certFileの証明書（DERまたはPEM形式）を、ユーザー単位またはローカル管理者の信頼設定に追加します。
# -d
#   admin cert storeに追加する。デフォルトはuser。
# -r trustRoot: 
#   登録する証明書に対して信頼レベルを設定します。trustRootは、システムの信頼されたルート認証局に証明書を追加することを意味します。
#   これにより、証明書の発行元が信頼された認証局である場合、それに基づいて署名されたすべての証明書を信頼することができます。
# -k /Library/Keychains/System.keychain: 
#   証明書を登録するキーチェーンの場所を指定します。この場合、/Library/Keychains/System.keychainに証明書が登録されます。