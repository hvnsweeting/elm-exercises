#!/bin/bash

mkdir -p docs
echo '''
  <html><head>
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/skeleton.css">
  </head>
''' > docs/index.html
echo '<h1>My Elm stuffs</h1>' >> docs/index.html
for p in web/*.elm
do
    filename=$(basename $p)
    echo $filename
    if grep READY $p; then
        output=$(echo $filename | sed 's/.elm//g').html
        elm-make $p --output docs/$output
        echo '<ul>'
        echo "<li><a href='./$output'>$output</a></li>" >> docs/index.html
        echo '</ul>'
    fi
done

echo '</body></html>' >> docs/index.html
echo "Open: file:///$(pwd)/docs/index.html"
