echo 'moviedownloader を削除するための処理を実行するプログラムです。'
echo ''
echo '処理を選択してください'
echo 'y youtube-dlを削除'
echo 'n nicovideo-dlを削除'
echo 'yn どちらも削除'
read bo
echo $bo | grep y
if [ $? = 0 ] ; then
  echo "youtube-dl を削除します。よろしいですか？ (Enter で継続)"
  read a
  cd /usr/bin
  sudo rm youtube-dl
fi
echo $bo | grep n
if [ $? = 0 ] ; then
  echo "nicovideo-dl を削除します。よろしいですか？ (Enter で継続)"
  read a
  cd /usr/bin
  sudo rm nicovideo-dl
fi
echo "処理が完了しました。(Enter で終了)"
read b
