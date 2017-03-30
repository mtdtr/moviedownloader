echo "起動中..."
dpkg -l | grep -q nicovideo-dl
# echo $?
if [ $? = "1" ] ; then
  echo "error:パッケージ [nicovideo-dl] がインストールされていません"
  echo "nicovideo-dl をインストールしますか?(y/n)"
  read nicodlis
  if [ $nicodlis = "y" ] ; then
    sudo apt-get install nicovideo-dl
  fi
else
  echo "*nicovideo-dl ready*"
fi
if [ ! -e /usr/local/bin/youtube-dl ] ; then
  echo "error:パッケージ [youtube-dl] がインストールされていません"
  echo "youtube-dl をインストールしますか?(y/n)"
  read y2ubedlis
  if [ $y2ubedlis = "y" ] ; then
    sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
    sudo chmod a+x /usr/local/bin/youtube-dl
    hash -r
    echo "*youtube-dl ready*"
  fi
else
  sudo youtube-dl -U
  echo "*youtube-dl ready*"
fi
echo "起動完了"
echo ""
echo "MTD動画ダウンローダーへようこそ!"
echo "操作を選択してください"
echo ""
echo "y Youtubeの動画をダウンロードする"
echo "n ニコニコの動画をダウンロードする"
echo ""
read cont
if [ $cont = "y" ] ; then
  echo ""
  echo "ダウンロードする動画のURLを入力してください"
  read url
  youtube-dl $url
elif [ $cont = "n" ] ; then
  echo ""
  echo "ダウンロードする動画のURLを入力してください(http:// から)"
  read url
  nicovideo-dl $url
fi
