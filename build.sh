set -e

sass css/main.scss:main.css

./node_modules/.bin/md2resume cv.md

cat cv.html | tr '\n' 'µ' | sed "s/<style.*<\/style>/<link rel=\"stylesheet\" href=\"main\.css\" \/>/g" | tr 'µ' '\n' > cv2.html

cp cv2.html cv.html

sed -i.bak 's/<body class=\"\"/<body class=\"pdf\"/g' cv2.html

wkhtmltopdf cv2.html cv.pdf

rm cv2.html cv2.html.bak

rm -rf _site
mkdir _site
mv cv.html _site/index.html
mv cv.pdf _site/WilliamMayor-CV.pdf
mv main.css _site/
