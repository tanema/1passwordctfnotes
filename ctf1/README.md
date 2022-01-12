
- notice image description "first programmer ever."
- grab image
- check image meta description
- decode base64
- curl --request GET --url https://1password.engineering/flag
- curl --request POST --url https://1password.engineering/flag
- curl --request POST --url https://1password.engineering/flag --data-ascii "Ada Lovelace"
- curl --request POST \
  -H "Content-Type: application/x-www-form-urlencoded; charset=utf-8" \
  --url https://1password.engineering/flag \
  --data-ascii "YTJWNVBXRmtZV3h2ZG1Wc1lXTmwK"
- echo "Ada Lovelace" | openssl rsautl -encrypt -pubin -inkey ./key.pub -out message.encr
- curl --request POST \
  -H "Content-Type: application/x-www-form-urlencoded; charset=utf-8" \
  --url https://1password.engineering/flag \
  --data "$(cat message.encr| base64)"
- curl --request POST -v \
  -H "Content-Type: application/x-www-form-urlencoded; charset=utf-8" \
  --url https://1password.engineering/flag \
  --data "$(cat message.encr| base64)"